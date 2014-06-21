#include "gciWavefunction.h"
#include <sstream>
#include <iostream>
#ifndef MOLPRO
#include <gciMolpro.h>
#endif
#include "gciStringSet.h"
#include "gciTransitionDensity.h"
//#include "mkl.h"
#include "Profiler.h"

Wavefunction::Wavefunction(FCIdump *dump) : State(dump) {
  buildStrings();
}

Wavefunction::Wavefunction(std::string filename) : State(filename) {
  if (filename!="") buildStrings();
}
Wavefunction::Wavefunction(OrbitalSpace* h, int n, int s, int m2) : State(h,n,s,m2) {
  buildStrings();
}

Wavefunction::Wavefunction(const State& state) : State(state) {
  buildStrings();
}

Wavefunction::Wavefunction(const Wavefunction &other) : State(other)
{
  alphaStrings.resize(8); betaStrings.resize(8);
  for (int i=0;i<8;i++)
  {
    alphaStrings[i] = other.alphaStrings[i];
    betaStrings[i] = other.betaStrings[i];
  }
  dimension = other.dimension;
  _blockOffset = other._blockOffset;
  buffer = other.buffer;
}

void Wavefunction::buildStrings()
{
  profiler.start("buildStrings");
  alphaStrings.resize(8); betaStrings.resize(8);
  dimension = 0;
  _blockOffset.resize(8);
  for (unsigned int syma=0; syma<8; syma++) {
    unsigned int symb = syma ^ symmetry;
    String stringa(this,1);
    stringa.first((nelec+ms2)/2);
    alphaStrings[syma] = StringSet(stringa, true, syma);
    String stringb(this,-1);
    stringb.first((nelec-ms2)/2);
    betaStrings[symb] = StringSet(stringb, true, symb);
    _blockOffset[syma]=dimension;
    dimension += alphaStrings[syma].size()*betaStrings[symb].size();
  }
  profiler.stop("buildStrings");
}

size_t Wavefunction::size()
{
  return dimension;
}

void Wavefunction::allocate_buffer()
{
  buffer.resize(dimension,(double)0);
}

void Wavefunction::set(size_t offset, const double val)
{
  buffer.at(offset) = val;
}

void Wavefunction::set(const double value)
{
  allocate_buffer();
  for (std::vector<double>::iterator b=buffer.begin(); b != buffer.end(); b++) *b=value;
}

void Wavefunction::diagonalHamiltonian(const Hamiltonian &hamiltonian)
{
  profiler.start("diagonalHamiltonian");
  std::vector<double> ha=hamiltonian.int1(1);
  std::vector<double> hbb=hamiltonian.int1(-1);
  std::vector<double> Jaa, Jab, Jbb, Kaa, Kbb;
  if (hamiltonian.integrals_aa != NULL) {
    Jaa=hamiltonian.intJ(1,1);
    Jab=hamiltonian.intJ(1,-1);
    Jbb=hamiltonian.intJ(1,1);
    Kaa=hamiltonian.intK(1);
    Kbb=hamiltonian.intK(-1);
  }
  //    xout << "ha" <<std::endl;
  //        for (size_t i=0; i<hamiltonian->basisSize; i++)
  //            xout << ha[i] << " ";
  //        xout <<std::endl;
  //    xout << "Jaa" <<std::endl;
  //    for (size_t j=0; j<hamiltonian->basisSize; j++) {
  //        for (size_t i=0; i<hamiltonian->basisSize; i++)
  //            xout << Jaa[i+j*hamiltonian->basisSize] << " ";
  //        xout <<std::endl;
  //    }
  //    xout << "Kaa" <<std::endl;
  //    for (size_t j=0; j<hamiltonian->basisSize; j++) {
  //        for (size_t i=0; i<hamiltonian->basisSize; i++)
  //            xout << Kaa[i+j*hamiltonian->basisSize] << " ";
  //        xout <<std::endl;
  //    }
  size_t offset=0;
  set(hamiltonian.coreEnergy);
  for (unsigned int syma=0; syma<8; syma++) {
    unsigned int symb = syma ^ symmetry;
    size_t nsa = alphaStrings[syma].size();
    size_t nsb = betaStrings[symb].size();
    size_t nact = orbitalSpace->total();
    if (! nsa || ! nsb) continue;
    std::vector<double> ona = alphaStrings[syma].occupationNumbers();
    std::vector<double> onb = betaStrings[symb].occupationNumbers();
    if (false && orbitalSpace->spinUnrestricted) { // UHF
    } else { // RHF
      for (size_t ia=0; ia < nsa; ia++) {
        std::vector<double> on(onb);
        for (size_t i=0; i<nact; i++) {
          for (size_t ib=0; ib < nsb; ib++)
            on[ib+i*nsb] += ona[ia+i*nsa];
        }
        for (size_t i=0; i<nact; i++)
          for (size_t ib=0; ib < nsb; ib++)
            buffer[offset+ib] += on[ib+i*nsb] * ha[i];
        if (hamiltonian.integrals_aa != NULL) {
          for (size_t i=0; i<nact; i++) {
            for (size_t j=0; j<=i; j++) {
              double zz = Jaa[j+i*nact] - (double)0.5 * Kaa[j+i*nact];
              if (i == j) zz *= (double)0.5;
              for (size_t ib=0; ib < nsb; ib++)
                buffer[offset+ib] += on[ib+i*nsb] * on[ib+j*nsb] * zz;
            }
          }
          double vv = (double) ms2*ms2;
          std::vector<double> f(nsb,(double)0);
          for (size_t i=0; i<nact; i++)
            for (size_t ib=0; ib < nsb; ib++) {
              on[ib+i*nsb] *= ((double)2 - on[ib+i*nsb]); // on becomes a mask for singly-occupied orbitals
              f[ib] += on[ib+i*nsb];
            }
          for (size_t ib=0; ib < nsb; ib++)
            f[ib] = f[ib] < (double) 1.1 ? (double) 1.1 : f[ib]; // mask off singularities (this code does nothing for 0 or 1 open-shell orbitals)
          for (size_t ib=0; ib < nsb; ib++)
            f[ib] = (vv-f[ib]) / (f[ib]*(f[ib]-(double)1));
          for (size_t i=0; i<nact; i++) {
            for (size_t j=0; j<i; j++) {
              double zz = -(double)0.5 * Kaa[i*nact+j];
              for (size_t ib=0; ib < nsb; ib++)
                buffer[offset+ib] += f[ib] * on[ib+i*nsb] * on[ib+j*nsb] * zz;
            }
            double zz = -(double)0.25 * Kaa[i*nact+i];
            for (size_t ib=0; ib < nsb; ib++)
              buffer[offset+ib] += on[ib+i*nsb] * zz;
          }
        }
        offset += nsb;
      }
    }
  }
  profiler.stop("diagonalHamiltonian");
}

void Wavefunction::axpy(double a, Wavefunction &x)
{
  for (size_t i=0; i<buffer.size(); i++) buffer[i] += x.buffer[i]*a;
}

Wavefunction& Wavefunction::operator*=(const double &value)
{
  for (std::vector<double>::iterator b=buffer.begin(); b != buffer.end(); b++) *b*=value;
  return *this;
}

//Wavefunction& Wavefunction::operator = ( const Wavefunction &other)
//{
//    if (this != &other) {
//    if (! compatible(other)) throw "attempt to copy between incompatible Wavefunction objects";
//        *this = other;
//    }
//    return *this;
//}

Wavefunction& Wavefunction::operator+=(const Wavefunction &other)
{
  if (! compatible(other)) throw "attempt to add incompatible Wavefunction objects";
//  xout << "Wavefunction::operator += &this=" << this <<" &other="<<&other <<std::endl;
  for (size_t i=0; i<buffer.size(); i++)  buffer[i] += other.buffer[i];
  return *this;
}


Wavefunction& Wavefunction::operator-=(const Wavefunction &other)
{
  if (! compatible(other)) throw "attempt to add incompatible Wavefunction objects";
  for (size_t i=0; i<buffer.size(); i++)  buffer[i] -= other.buffer[i];
  return *this;
}

Wavefunction& Wavefunction::operator-=(const double other)
{
  for (size_t i=0; i<buffer.size(); i++)  buffer[i] -= other;
  return *this;
}


Wavefunction& Wavefunction::operator/=(const Wavefunction &other)
{
  if (! compatible(other)) throw "attempt to add incompatible Wavefunction objects";
  for (size_t i=0; i<buffer.size(); i++)  buffer[i] /= other.buffer[i];
  return *this;
}


Wavefunction gci::operator+(const Wavefunction &w1, const Wavefunction &w2)
{
  Wavefunction result = w1;
  return result += w2;
}

Wavefunction gci::operator-(const Wavefunction &w1, const Wavefunction &w2)
{
  Wavefunction result = w1;
  return result -= w2;
}

Wavefunction gci::operator/(const Wavefunction &w1, const Wavefunction &w2)
{
  Wavefunction result = w1;
  return result /= w2;
}

Wavefunction gci::operator*(const Wavefunction &w1, const double &value)
{
  Wavefunction result = w1;
  return result *= value;
}

Wavefunction gci::operator*(const double &value, const Wavefunction &w1)
{
  Wavefunction result = w1;
  return result *= value;
}

double gci::operator *(const Wavefunction &w1, const Wavefunction &w2)
{
  if (! w1.compatible(w2)) throw "attempt to form scalar product between incompatible Wavefunction objects";
  double result=(double)0;
  for (size_t i=0; i<w1.buffer.size(); i++) result += w1.buffer[i]*w2.buffer[i];
  return result;
}

Wavefunction& gci::Wavefunction::operator -()
{
  for (size_t i=0; i<buffer.size(); i++)
    buffer[i]=-buffer[i];
  return *this;
}

std::string Wavefunction::str(int verbosity) const
{
  std::ostringstream s;
  if (verbosity >= 1) {
    s<<std::endl<<"Wavefunction object at address " << this ;
    s<<std::endl<<"Values at address " << &buffer <<" and of length " << buffer.size();
    size_t address=0;
    for (unsigned int syma=0; syma<8; syma++) {
      unsigned int symb = syma ^ symmetry ;
      if (alphaStrings[syma].size() && betaStrings[symb].size()) {
        s<<std::endl<< "Alpha strings of symmetry "<<syma+1<<":";
        for (StringSet::const_iterator i=alphaStrings[syma].begin(); i!=alphaStrings[syma].end(); i++) s <<std::endl<< i->str();
        s<<std::endl<< "Beta strings of symmetry "<<symb+1<<":";
        for (StringSet::const_iterator i=betaStrings[symb].begin(); i!=betaStrings[symb].end(); i++) s <<std::endl<< i->str();
        if (buffer.size() == dimension && verbosity >=2) {
          s<<std::endl<<"Values:";
          for (size_t i=0; i<alphaStrings[syma].size(); i++) {
            s<<std::endl;
            for (size_t j=0; j<betaStrings[symb].size(); j++) {
              s << buffer[address++] << " ";
            }
          }
        }
      }
    }
  }
  return this->State::str(verbosity)+s.str();
}

bool Wavefunction::compatible(const Wavefunction &other) const
{
  return dimension==other.dimension && buffer.size() == other.buffer.size();
}

size_t Wavefunction::minloc()
{
  size_t result=0;
  for (size_t offset=0; offset<buffer.size(); offset++)
    if (buffer[offset] < buffer[result]) result=offset;
  return result;
}

size_t Wavefunction::maxloc()
{
  size_t result=0;
  for (size_t offset=0; offset<buffer.size(); offset++)
    if (buffer[offset] > buffer[result]) result=offset;
  return result;
}

double Wavefunction::at(size_t offset)
{
  return buffer.at(offset);
}

Determinant Wavefunction::determinantAt(size_t offset)
{
  size_t address=0;
  for (unsigned int syma=0; syma<8; syma++) {
    unsigned int symb = syma ^ symmetry ;
    size_t newaddress = address +  alphaStrings[syma].size() * betaStrings[symb].size();
    if (offset >= address && offset < newaddress) {
      size_t a=(offset-address)/betaStrings[symb].size();
      size_t b=offset-address-a*betaStrings[symb].size();
      return Determinant(this,&alphaStrings[syma][a],&betaStrings[symb][b]);
    }
    address=newaddress;
  }
  throw "Wavefunction::determinantAt cannot find";
}

size_t Wavefunction::blockOffset(const unsigned int syma) const
{
  return _blockOffset.at(syma);
}

void Wavefunction::hamiltonianOnWavefunction(const Hamiltonian &h, const Wavefunction &w)
{
  profiler.start("hamiltonianOnWavefunction");
  for (size_t i=0; i<buffer.size(); i++)
    buffer[i] += h.coreEnergy * w.buffer[i];


  if (h.bracket_integrals_a!=NULL || h.bracket_integrals_b!=NULL) {
  size_t offset=0;
  profiler.start("1-electron");
  for (unsigned int syma=0; syma<8; syma++) {
    unsigned int symb = w.symmetry^syma;
    size_t nsa = alphaStrings[syma].size();
    size_t nsb = betaStrings[symb].size();
    if (h.bracket_integrals_a != NULL ) {
      profiler.start("1-electron TransitionDensity");
      TransitionDensity d(w,
                          w.alphaStrings[syma].begin(),
                          w.alphaStrings[syma].end(),
                          w.betaStrings[symb].begin(),
                          w.betaStrings[symb].end(),
                          1,true, !h.spinUnrestricted);
      profiler.stop("1-electron TransitionDensity");
      profiler.start("1-electron MXM");
      MxmDrvNN(&buffer[offset],&d[0], &(*h.bracket_integrals_a)[0],
          nsa*nsb,w.orbitalSpace->total(0,1),1,true);
      profiler.stop("1-electron MXM",2*nsa*nsb*w.orbitalSpace->total(0,1));
    }
    if (h.spinUnrestricted && h.bracket_integrals_b != NULL) {
      profiler.start("1-electron TransitionDensity");
      TransitionDensity d(w,
                          w.alphaStrings[syma].begin(),
                          w.alphaStrings[syma].end(),
                          w.betaStrings[symb].begin(),
                          w.betaStrings[symb].end(),
                          1,false, true);
      profiler.stop("1-electron TransitionDensity");
      profiler.start("1-electron MXM");
      MxmDrvNN(&buffer[offset],&d[0], &(*h.bracket_integrals_b)[0],
          nsa*nsb,w.orbitalSpace->total(0,1),1,true);
      profiler.stop("1-electron MXM",2*nsa*nsb*w.orbitalSpace->total(0,1));
    }
    offset += nsa*nsb;
  }
  profiler.stop("1-electron");

//  xout <<"residual after 1-electron:"<<std::endl<<str(2)<<std::endl;
  }

  if (h.bracket_integrals_aa != NULL) { // two-electron contribution, alpha-alpha
    profiler.start("aa integrals");
    size_t nsbbMax = 64; // temporary static
    for (unsigned int syma=0; syma<8; syma++) {
      profiler.start("StringSet aa");
      StringSet aa(w.alphaStrings,2,0,syma);
      profiler.stop("StringSet aa");
      if (aa.size()==0) continue;
      for (unsigned int symb=0; symb<8; symb++) {
        unsigned int symexc = syma^symb^w.symmetry;
        size_t nexc = h.pairSpace.find(-1)->second[symexc];
        size_t nsb = betaStrings[symb].size(); if (nsb==0) continue;
        profiler.start("aa1 loop");
        for (StringSet::iterator aa1, aa0=aa.begin(); aa1=aa0+nsbbMax > aa.end() ? aa.end() : aa0+nsbbMax, aa0 <aa.end(); aa0=aa1) { // loop over alpha batches
          size_t nsa = aa1-aa0;
          profiler.start("TransitionDensity aa");
          TransitionDensity d(w,aa0,aa1,w.betaStrings[symb].begin(),w.betaStrings[symb].end(),-1,false,false);
          profiler.stop("TransitionDensity aa");
          TransitionDensity e(d);
          profiler.start("MXM aa");
          MxmDrvNN(&e[0],&d[0],
                   &(*h.bracket_integrals_aa)[h.pairSpace.find(-1)->second.offset(0,symexc,0)],
              nsa*nsb,nexc,nexc,false);
          profiler.stop("MXM aa",2*nsa*nsb*nexc*nexc);
          profiler.start("action aa");
          e.action(*this);
          profiler.stop("action aa");
        }
        profiler.stop("aa1 loop");
      }
    }
    profiler.stop("aa integrals");
  }

  if (h.bracket_integrals_bb != NULL) { // two-electron contribution, beta-beta
    profiler.start("bb integrals");
    size_t nsbbMax = 64; // temporary static
    for (unsigned int symb=0; symb<8; symb++) {
      StringSet bb(w.betaStrings,2,0,symb);
      if (bb.size()==0) continue;
      for (unsigned int syma=0; syma<8; syma++) {
        unsigned int symexc = symb^syma^w.symmetry;
        size_t nexc = h.pairSpace.find(-1)->second[symexc];
        size_t nsa = alphaStrings[syma].size(); if (nsa==0) continue;
        for (StringSet::iterator bb1, bb0=bb.begin(); bb1=bb0+nsbbMax > bb.end() ? bb.end() : bb0+nsbbMax, bb0 <bb.end(); bb0=bb1) { // loop over beta batches
          size_t nsb = bb1-bb0;
          profiler.start("TransitionDensity bb");
          TransitionDensity d(w,w.alphaStrings[syma].begin(),w.alphaStrings[syma].end(),bb0,bb1,-1,false,false);
          profiler.stop("TransitionDensity bb");
          TransitionDensity e(d);
          profiler.start("MXM bb");
          MxmDrvNN(&e[0],&d[0],
                   &(*h.bracket_integrals_bb)[h.pairSpace.find(-1)->second.offset(0,symexc,0)],
              nsa*nsb,nexc,nexc,false);
          profiler.stop("MXM bb",2*nsa*nsb*nexc*nexc);
          profiler.start("action bb");
          e.action(*this);
          profiler.stop("action bb");
        }
      }
    }
    profiler.stop("bb integrals");
  }

  if (h.bracket_integrals_ab != NULL) { // two-electron contribution, alpha-beta
    profiler.start("ab integrals");
    size_t nsaaMax = 640; // temporary static
    size_t nsbbMax = 640; // temporary static
    for (unsigned int symb=0; symb<8; symb++) {
      StringSet bb(w.betaStrings,1,0,symb);
      if (bb.size()==0) continue;
      for (unsigned int syma=0; syma<8; syma++) {
        StringSet aa(w.alphaStrings,1,0,syma);
        if (aa.size()==0) continue;
        unsigned int symexc = symb^syma^w.symmetry;
        size_t nexc = h.pairSpace.find(0)->second[symexc];
        profiler.start("StringSet iterator loops");
        for (StringSet::iterator aa1, aa0=aa.begin(); aa1=aa0+nsaaMax > aa.end() ? aa.end() : aa0+nsaaMax, aa0 <aa.end(); aa0=aa1) { // loop over alpha batches
          size_t nsa = aa1-aa0;
          for (StringSet::iterator bb1, bb0=bb.begin(); bb1=bb0+nsbbMax > bb.end() ? bb.end() : bb0+nsbbMax, bb0 <bb.end(); bb0=bb1) { // loop over beta batches
            size_t nsb = bb1-bb0;
//            for (unsigned int i=0; i<99; i++)
//              TransitionDensity d(w,aa0,aa1, bb0,bb1,0,false,false);
          profiler.start("TransitionDensity ab");
            TransitionDensity d(w,aa0,aa1, bb0,bb1,0,false,false);
          profiler.stop("TransitionDensity ab");
            TransitionDensity e(d);
	    // if (false) {
	    //   xout << "AB integral block" <<std::endl;
	    //   for (size_t j=0; j<nexc; j++) {
	    // 	for (size_t i=0; i<nexc; i++)
	    // 	  xout <<
      // 	    (*h.bracket_integrals_ab)[h.pairSpace.find(0)->second.offset(0,symexc,0)+i+j*nexc]
	    // 	       << " ";
	    // 	xout <<std::endl;
	    //   }
	    //}
          profiler.start("MXM ab");
            MxmDrvNN(&e[0],&d[0],
                     &(*h.bracket_integrals_ab)[h.pairSpace.find(0)->second.offset(0,symexc,0)],
                nsa*nsb,nexc,nexc,false);
          profiler.stop("MXM ab",2*nsa*nsb*nexc*nexc);
          profiler.start("action ab");
            e.action(*this);
          profiler.stop("action ab");
          }
        }
        profiler.stop("StringSet iterator loops");
      }
    }
    profiler.stop("ab integrals");
  }


  profiler.stop("hamiltonianOnWavefunction");
}

void Wavefunction::put(File& f, int index)
{
  profiler.start("Wavefunction::put");
  f.write(buffer,index*buffer.size());
  profiler.stop("Wavefunction::put",index*buffer.size());
}


void Wavefunction::get(File& f, int index)
{
  profiler.start("Wavefunction::get");
  f.read(buffer,index*buffer.size());
  profiler.stop("Wavefunction::get",index*buffer.size());
}
