#include "util.h"
namespace molpro::linalg::itsolv::util {

std::string StringFacet::toupper(std::string in) {
  facet.toupper(in.data(), in.data() + in.size());
  return in;
}

std::string StringFacet::tolower(std::string in) {
  facet.tolower(in.data(), in.data() + in.size());
  return in;
}

bool StringFacet::tobool(const std::string &in) {
  auto val = toupper(in);
  crop_space(val);
  bool result;
  if (val == "TRUE" || val == "T" || val == "1") {
    result = true;
  } else if (val == "FALSE" || val == "F" || val == "0") {
    result = false;
  } else {
    throw std::runtime_error("value =" + val + ", must be one of {TRUE, T, 1, FALSE, F, 0}");
  }
  return result;
}

void StringFacet::crop_space(std::string &path) {
  path.erase(path.begin(), std::find_if(path.begin(), path.end(), [](auto &el) { return !std::isspace(el); }));
  path.erase(std::find_if(path.rbegin(), path.rend(), [](auto &el) { return !std::isspace(el); }).base(), path.end());
}

} // namespace molpro::linalg::itsolv::util
