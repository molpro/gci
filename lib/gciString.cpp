#include "gciString.h"
#include "gciStringSet.h"

#include <iostream>
#include <sstream>
#include <string.h>

using String = gci::String;

size_t gci::String::StringNotFound = (size_t) -1; ///< conventional null value for index
size_t gci::String::keyUnassigned = (size_t) -1; ///< conventional null value for key

String::String(const State *State, const int Spin)
    : m_spin(Spin) {
  if (State != nullptr) {
    orbitalSpace.reset(new OrbitalSpace(*State->orbitalSpace));
  }
  nullify();
}

String::String(const std::vector<char> bytestream, const State *State) {
  if (State == nullptr) {
    orbitalSpace = nullptr;
  } else {
    orbitalSpace.reset(new OrbitalSpace(*State->orbitalSpace));
//    xout << "assigned orbitalSpace="<<orbitalSpace<<std::endl;
//    xout <<orbitalSpace->str()<<std::endl;
  }
  nullify();
  size_t offset = 0;
  memcpy(&nelec, &bytestream[offset], sizeof(nelec));
  offset += sizeof(nelec);
  memcpy(&m_spin, &bytestream[offset], sizeof(m_spin));
  offset += sizeof(m_spin);
  m_orbitals.resize((size_t) nelec);
  memcpy(&m_orbitals[0], &bytestream[offset], sizeof(orbital_type) * m_orbitals.size());
  offset += sizeof(orbital_type) * m_orbitals.size();
//  xout <<"constructed String from bytestream nelec="<<nelec<<", spin="<<spin<<", orbitals=";
//  for (size_t i=0; i<nelec; i++) xout <<orbitals()[i]<<","; xout <<std::endl;
//  xout <<str(1)<<std::endl;
//  xout <<"back from str"<<std::endl;

}

std::vector<char> String::serialise() const {
  std::vector<char> bytestream(sizeof(nelec) + sizeof(m_spin) + nelec * sizeof(orbital_type));
  size_t offset = 0;
  memcpy(&bytestream[offset], &nelec, sizeof(nelec));
  offset += sizeof(nelec);
  memcpy(&bytestream[offset], &m_spin, sizeof(m_spin));
  offset += sizeof(m_spin);
  memcpy(&bytestream[offset], &m_orbitals[0], sizeof(orbital_type) * m_orbitals.size());
  offset += sizeof(orbital_type) * m_orbitals.size();
//  xout <<"serialised String to bytestream nelec="<<nelec<<", spin="<<spin<<", orbitals=";
//  for (size_t i=0; i<nelec; i++) xout <<orbitals()[i]<<","; xout <<std::endl;
//  xout <<str()<<std::endl;
  return bytestream;
}

//int String::create(unsigned int orbital) {
////      xout << "String::create before="<<str()<<", orbital="<<orbital<<std::endl;
//  //        xout  << "create orbital "<<orbital <<" " <<orbitals_.size()<<std::endl;
//  //        xout << "hamiltonian "<<(hamiltonian!=nullptr)<<std::endl;
//  if (orbitalSpace==nullptr)
//    throw std::logic_error("String::create missing orbitalSpace");
//  //        xout << "basisSize "<<hamiltonian->total()<<std::endl;
//  if (orbitalSpace==nullptr || orbital==(unsigned int)0 || orbital > (unsigned int) orbitalSpace->total()) throw std::range_error("invalid orbital");
//  //    xout <<"make iterator "<<std::endl;
////  std::vector<unsigned int>::iterator ilast=orbitals_.begin();
//  //    xout <<"iterator OK"<<std::endl;

//  int phase=((m_orbitals.size()/2)*2 == m_orbitals.size()) ? 1 : -1;
//  //    xout <<"phase="<<phase<<std::endl;
//  //    xout <<"spin="<<spin<<std::endl;
//  for (std::vector<orbital_type>::iterator i = m_orbitals.begin(); i!=m_orbitals.end(); ++i) {
//    if (*i==orbital) return 0; // exclusion principle
//    if (*i > orbital){
//      ms2+=m_spin;
//      nelec++;
//      symmetry^=orbitalSpace->orbital_symmetries[orbital-1];
////                  xout <<"create orbital="<<*i <<" with symmetry="<<orbitalSpace->orbital_symmetries[*i-1]<<", giving total symmetry"<<symmetry<<std::endl;
//      m_orbitals.insert(i,orbital);
////                  xout << "String::create inserts, after="<<str()<<", phase="<<phase<<std::endl;
//      return phase;
//    }
//    phase=-phase;
//  }
//  ms2+=m_spin;
//  nelec++;
//  symmetry^=orbitalSpace->orbital_symmetries[orbital-1];
//  m_orbitals.insert(m_orbitals.end(),orbital);
////      xout << "String::create final append, after="<<str()<<", phase="<<phase<<std::endl;
//  return phase;
//}

//int String::destroy(unsigned int orbital) {
//  if (orbitalSpace==nullptr || orbital==(unsigned int)0 || orbital > (unsigned int) orbitalSpace->total() ) throw std::range_error("invalid orbital");
//  if (m_orbitals.size() <= 0) return (int) 0; //throw "too few electrons in String";
//  //    xout << "String::destroy before="<<str()<<", orbital="<<orbital<<std::endl;
////  int phase=1;
//  int phase=((m_orbitals.size()/2)*2 == m_orbitals.size()) ? -1 : 1;
//  for (std::vector<orbital_type>::iterator i = m_orbitals.begin(); i!=m_orbitals.end(); ++i) {
//    if (*i==orbital)  {
//      ms2-=m_spin;
//      nelec--;
//      symmetry^=orbitalSpace->orbital_symmetries[*i-1];
//      m_orbitals.erase(i);
//      //            xout << "String::destroy succeeds, after="<<str()<<", phase="<<phase<<std::endl;
//      return phase;
//    }
//    phase=-phase;
//  }
//  //    xout << "String::destroy fails, after="<<str()<<std::endl;
//  return (int)0; // exclusion principle
//}

void String::nullify() {
  m_orbitals.clear();
  ms2 = 0;
  nelec = 0;
  symmetry = 0;
  m_key = keyUnassigned;
}

const std::vector<String::orbital_type> &String::orbitals() const {
  return m_orbitals;
}

std::string String::str(int verbosity, unsigned int columns) const {
  std::string result;
//      xout <<"String::str orbitals_[0]" <<orbitals_[0]<<std::endl;
//  xout << "String::str length of orbitals_="<<orbitals_.size()<<std::endl;
  if (verbosity >= 0) {
    for (std::vector<orbital_type>::const_iterator i = m_orbitals.begin(); i != m_orbitals.end(); ++i) {
      if (i != m_orbitals.begin()) result.append(",");
      std::stringstream ss;
      int ispin = (int) (*i) * (int) m_spin;
      ss << ispin;
      std::string rr;
      ss >> rr;
      result.append(rr);
    }
//      xout << "end of loop occ orbital"<<std::endl;
    std::stringstream ss;
    ss << " [";
    if (m_key != keyUnassigned) ss << m_key << ".";
    ss << computed_symmetry() + 1 << "]"; // internally symmetries are implemented 0-7, but externally as 1-8
    std::string rr;
    ss >> rr;
    result.append(rr);
  }
  return result;
}

unsigned int String::computed_symmetry(bool nocheck) const {
  unsigned int s = 0;
//  xout << "in computed_symmetry"<<std::endl;
//  xout <<orbitalSpace->str()<<std::endl;
  for (int i = 0; i < (int) m_orbitals.size(); i++) {
    s ^= orbitalSpace->orbital_symmetries[m_orbitals[i] - 1];
    //        xout <<"orbital "<<orbitals_[i]<<",  symmetry="<<hamiltonian->orbital_symmetries[orbitals_[i]-1]<<" total symmetry now "<<s<<std::endl;
  }
  if (s != symmetry && !nocheck) {
    xout << "s=" << s << ", symmetry=" << symmetry << std::endl;
    throw std::runtime_error("String symmetry messed up");
  }
//  xout << "computed_symmetry"<<s<<std::endl;
  return s;
}

bool String::next(int sym) {
  if (sym < 0) { // generate the next string of any symmetry
    orbital_type limit = orbitalSpace->total();
    std::vector<orbital_type>::iterator k;
    orbital_type floor = 0;
    for (std::vector<orbital_type>::reverse_iterator i = m_orbitals.rbegin(); i != m_orbitals.rend(); ++i) {
      floor = ++(*i);
      k = i.base();
      if (*i <= limit) break;
      limit--;
    }
    if (limit <= orbitalSpace->total() - m_orbitals.size()) return false; // we ran out of boxes to put the objects into
    while (k != m_orbitals.rbegin().base())
      *(k++) = ++floor;
    symmetry = computed_symmetry(true);
    //    xout << "String::next returns with symmetry="<<symmetry<<std::endl;
    return true;
  } else { // call myself until we get the symmetry required
    bool notexhausted;
    while ((notexhausted = next()) && (symmetry = computed_symmetry()) != (unsigned int) sym);
    return notexhausted;
  }
}

bool String::first(int n, int sym) {
  //    xout << "String::first " << n <<" nelec="<<nelec<< std::endl;
  if (n <= 0) n = nelec;
  if (n <= 0) n = m_orbitals.size();
  nullify();
  //    xout << n <<std::endl;
  for (unsigned int i = 1; i <= (unsigned int) n; i++)
    create(i);
  nelec = n;
  //    xout << "String::first first go, sym, symmetry "<<sym<<symmetry<<std::endl;
  if (sym < 0 || computed_symmetry() == (unsigned int) sym) return true;
  return next(sym);
}

String String::exhausted;

size_t String::index(const StringSet &set) const {
  const auto i = set.addressMap.find(m_key);
  return (i == set.addressMap.end()) ? StringNotFound : i->second;
}

bool String::operator==(const String &other) const {
  return m_key == other.m_key;
}