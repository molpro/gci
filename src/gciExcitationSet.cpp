#include "gciExcitationSet.h"
#include <iostream>
#include <sstream>
Excitation::Excitation(size_t StringIndex, int Phase, size_t OrbitalAddress)
{
  stringIndex = StringIndex;
  phase = Phase;
  orbitalAddress = OrbitalAddress;
}

ExcitationSet::ExcitationSet(const String &from, const StringSet &to, int annihilations, int creations)
{
  int symexc=-1;
  From = from;
  //    xout <<"ExcitationSet taking From="<<From.str()<<" annihilations="<<annihilations<<" creations="<<creations<<std::endl;
  To = &to;
  if (to.symmetry>=0) symexc = from.symmetry ^ to.symmetry; // use symmetry if we can
  if (annihilations + creations ==1) {
    int ii=0;
    for (int i=0; i<(int)from.orbitalSpace->orbital_symmetries.size(); i++) {
      if (from.orbitalSpace->orbital_symmetries[i]==(unsigned int)symexc || symexc==-1) {
        String tt = from;
        int phase = (annihilations > 0) ? tt.destroy(i+1) : tt.create(i+1);
        if (phase) {
            tt.gci::String::keygen(to.PartialWeightArray);
            size_t ti=to.addressMap.find(tt.key())->second;
            emplace_back(ti,phase,ii);
        }
        ii++;
      }
    }
  }
  else if (annihilations+creations==2) {
    int parity = annihilations==creations ? 1 : -1 ; // could be changed
    //        xout << "two-orbital excitation, parity="<<parity<<std::endl;
    //        xout <<"from="<<from<<std::endl;
    for (int j=0; j<(int)from.orbitalSpace->orbital_symmetries.size(); j++) {
      String a = from;
      int phasea = (annihilations > 0) ?  a.destroy(j+1) : a.create(j+1);
      if (phasea) {
        for (int i=0; i<(int)(annihilations == creations ? from.orbitalSpace->orbital_symmetries.size() : j) ; i++) {
          if (from.orbitalSpace->orbital_symmetries[i]==((unsigned int)symexc^from.orbitalSpace->orbital_symmetries[j]) || symexc==-1) {
            String tt = a;
            int phase = (annihilations > 1) ? phasea*tt.destroy(i+1) : phasea*tt.create(i+1);
            if (phase) {
                tt.keygen(to.PartialWeightArray);
              size_t ti=to.addressMap.find(tt.key())->second;
              if (ti>= to.size()) {
                xout <<"i="<<i+1<<" phase="<<phase<<" ti="<<ti<<" tt="<<tt.str()<<std::endl;
                throw std::range_error("index error in ExcitationSet");
              }
              if (from.orbitalSpace->orbital_symmetries[i] > from.orbitalSpace->orbital_symmetries[j]) phase=-phase;
              emplace_back(ti,phase,from.orbitalSpace->pairIndex(i+1,j+1,parity));
            }
          }
        }
      }
    }
  }
}

std::string ExcitationSet::str(int verbosity) const {
  if ((*To).size()==0 || verbosity < 0) return "";
  std::stringstream ss;
  ss<<"Excitations for String "<<From.str() << " into symmetry " << (*To)[0].symmetry+1 <<":";
  for (ExcitationSet::const_iterator e=this->begin(); e!=this->end(); e++) {
    ss<<std::endl<< " String index="<< e->stringIndex
     <<"("<<(*To)[e->stringIndex].str()<<")"
    <<" phase="<<e->phase<<" orbitalAddress="<<e->orbitalAddress;
  }
  return ss.str();
}

std::ostream& gci::operator<<(std::ostream& os, ExcitationSet const& obj)
{
  return os << obj.str();
}