#include "gciDeterminant.h"
#include <iostream>

Determinant::Determinant(State* State, String* alpha, String*beta)
{
  if (State == NULL) {
    nelec=999999999;
    orbitalSpace=NULL;
    ms2=0;
  } else {
    nelec=State->nelec;
    orbitalSpace=State->orbitalSpace;
    ms2=State->ms2;
  }
  if (alpha!=NULL) stringAlpha=*alpha;
  if (beta!=NULL) stringBeta=*beta;
  stringAlpha.orbitalSpace=stringBeta.orbitalSpace=orbitalSpace;
  //    xout << "determinant constructor, hamiltonian="<<(hamiltonian!=NULL)<<hamiltonian->total()<<std::endl;
}

int Determinant::create(int orbital) {
  //    xout << "create orbital "<<orbital <<std::endl;
  unsigned int orbabs = orbital > 0 ? orbital : -orbital;
  if (orbitalSpace==NULL || orbital==(int)0 || orbital > (int) orbitalSpace->total() || orbital < -(int)orbitalSpace->total()) throw "invalid orbital";
  if (orbital > 0) {
    if (stringAlpha.orbitals().size() >= (nelec+ms2)/2) throw "too many electrons in determinant";
    //        xout <<"try to populate stringAlpha"<<std::endl;
    return stringAlpha.create(orbabs);
  } else {
    if (stringBeta.orbitals().size() >= (nelec-ms2)/2) throw "too many electrons in determinant";
    return stringBeta.create(orbabs);
  }
}

int Determinant::destroy(int orbital) {
  if (orbitalSpace==NULL || orbital==(int)0 || orbital > (int) orbitalSpace->total() || orbital < -(int)orbitalSpace->total()) throw "invalid orbital";
  unsigned int orbabs = orbital > 0 ? orbital : -orbital;
  String* string = orbital > 0 ? &stringAlpha : &stringBeta;
//  if (string->orbitals().size() <= 0) throw "too few electrons in determinant";
  return string->destroy(orbabs);

}

void Determinant::first()
{
  //    xout <<"Determiant::first nelec="<<nelec<<", ms2="<<ms2<<(nelec+ms2)/2<<(nelec-ms2)/2<<std::endl;
  stringAlpha.first((nelec+ms2)/2);
  stringBeta.first((nelec-ms2)/2);
}

bool Determinant::next()
{
  if (stringBeta.next()) return true;
  //    xout << "Determinant::next needs to make a new alpha string"<<std::endl;
  stringBeta.first((nelec-ms2)/2);
  return stringAlpha.next();
}

std::string Determinant::str(int verbosity) const
{
  return verbosity >= 0 ? stringAlpha.str()+"|"+stringBeta.str() : std::string("");
}
