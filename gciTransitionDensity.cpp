#include "gciTransitionDensity.h"
#include <iostream>
#include <sstream>

TransitionDensity::TransitionDensity(const Wavefunction &w, const StringSet &alphaStrings, const StringSet &betaStrings, int parity)
{
  // first parse the type of transition
  nsa = alphaStrings.size();
  nsb = betaStrings.size();
  if (nsa==0 || nsb==0) return;
  unsigned int syma = alphaStrings[0].computed_symmetry();
  unsigned int symb =  betaStrings[0].computed_symmetry();
  xout << "syma="<<syma<<", nsa="<<nsa<<std::endl;
  xout << "symb="<<symb<<", nsb="<<nsb<<std::endl;
  unsigned int symexc = w.symmetry ^ syma ^ symb;
  excitations = w.orbitalSpace->total(symexc,parity);
  int deltaAlpha = w.alphaStrings[0].proto.nelec - alphaStrings.proto.nelec;
  int deltaBeta = w.betaStrings[0].proto.nelec - betaStrings.proto.nelec;

  xout <<"TransitionDensity "<<symexc<<" "<<nsa*nsb*excitations<<std::endl;
  resize(nsa*nsb*excitations,(double)0);
  if (nsa*nsb*excitations == 0) return;

  if (deltaAlpha==0 && deltaBeta==0) { // number of electrons preserved, so one-electron excitation

    size_t woffset=0;
    unsigned int wsyma;
    unsigned int wsymb;
    size_t wnsa, wnsb;
    // alpha excitations
    for (wsyma=0; wsyma<8; wsyma++) {
      wsymb = w.symmetry^wsyma;
      wnsa = w.alphaStrings[wsyma].size();
      wnsb = w.betaStrings[wsymb].size();
      if (wsymb == symb) break;
      woffset += wnsa*wnsb;
    }
    // assumes that alphaStrings, betaStrings are contiguous ordered subsets of wavefunction strings
    size_t woffa = woffset + betaStrings[0].index(w.betaStrings[wsymb]);
    xout << "alpha wsyma="<<wsyma<<", wsymb="<<wsymb<<", woffa="<<woffa<<std::endl;

    size_t offa=0;
    for (StringSet::const_iterator s = alphaStrings.begin(); s != alphaStrings.end(); s++) {
      //          xout << "alpha string "<<*s<<std::endl;
      ExcitationSet ee(*s,w.alphaStrings[wsyma],1,1);
      //          xout << "alpha excitations " << ee.str() <<std::endl;
      for (ExcitationSet::const_iterator e=ee.begin(); e!=ee.end(); e++) {
        //                xout << "alpha excitation " << e->orbitalAddress <<"="<<(*h.integrals_a)[e->orbitalAddress]<<" "<<e->phase <<" "<<e->stringIndex<<std::endl;
        if (e->phase < 0)
          for (size_t ib=0; ib<nsb; ib++)
            (*this)[offa+nsa*nsb*e->orbitalAddress+ib]-=
              w.buffer[woffa+e->stringIndex*wnsb+ib];
        else
          for (size_t ib=0; ib<nsb; ib++)
            (*this)[offa+nsa*nsb*e->orbitalAddress+ib]+=
              w.buffer[woffa+e->stringIndex*wnsb+ib];
      }
      offa += nsb;
      woffa += wnsb;
    }

    // beta excitations
    woffset=0;
    for (wsyma=0; wsyma<syma; wsyma++) {
      wnsa = w.alphaStrings[wsyma].size();
      wsymb = w.symmetry^wsyma;
      wnsb = w.betaStrings[wsymb].size();
      woffset += wnsa*wnsb;
    }
    wsyma = syma;
    wsymb = w.symmetry^wsyma;
    wnsa = w.alphaStrings[wsyma].size();
    wnsb = w.betaStrings[wsymb].size();
    size_t woffb = woffset + wnsb * alphaStrings[0].index(w.alphaStrings[wsyma]);
    size_t offb = 0;
    xout << "beta wsyma="<<wsyma<<", wsymb="<<wsymb<<", woffset="<<woffset<<", woffb="<<woffb<<std::endl;
    for (StringSet::const_iterator s = betaStrings.begin(); s != betaStrings.end(); s++) {
      ExcitationSet ee(*s,w.betaStrings[wsymb],1,1);
      for (ExcitationSet::const_iterator e=ee.begin(); e!=ee.end(); e++) {
        //                xout << "beta excitation " << e->orbitalAddress <<"="<<(*h.integrals_b)[e->orbitalAddress]<<" "<<e->phase <<" "<<e->stringIndex<<std::endl;
        if (e->phase < 0)
          for (size_t ia=0; ia<nsa; ia++)
            (*this)[offb+nsa*nsb*e->orbitalAddress+ia*nsb]-=
              w.buffer[woffb+e->stringIndex+wnsb*ia];
        else
          for (size_t ia=0; ia<nsa; ia++)
            (*this)[offb+nsa*nsb*e->orbitalAddress+ia*nsb]+=
              w.buffer[woffb+e->stringIndex+wnsb*ia];
      }
      offb ++;
      woffb++;
    }

  } else if (deltaAlpha==2) { // wavefunction has 2 more alpha electrons than interacting states
  } else if (deltaBeta==2) { // wavefunction has 2 more beta electrons than interacting states
  } else {
    throw "unimplemented case";
  }
}

std::string TransitionDensity::str(int verbosity) const
{
  if (verbosity < 0) return std::string("");
  std::ostringstream s;
//  xout <<"TransitionDensity::str size()="<<size()<<std::endl;
  if (size()!= nsa*nsb*excitations) {xout << "wrong size in TransitionDensity::str "<<size()<<" "<<nsa*nsb*excitations<<std::endl; throw "help";}
  if (size())
  for (size_t ij=0; ij < excitations; ij++) {
    s <<std::endl;
    for (size_t ab=0; ab < nsa*nsb; ab++)
      s << (*this)[ab+ij*nsa*nsb] <<" ";
  }
  return s.str();
}
