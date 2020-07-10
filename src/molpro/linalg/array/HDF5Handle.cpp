#include "HDF5Handle.h"

#include <algorithm>
#include <fstream>
#include <iostream>
#include <stdexcept>

namespace molpro {
namespace linalg {
namespace array {
namespace util {

const hid_t HDF5Handle::hid_default;

HDF5Handle::HDF5Handle(std::string file) : m_file_name{std::move(file)}, m_file_owner{true} {}
HDF5Handle::HDF5Handle(std::string file, std::string group)
    : m_file_name{std::move(file)}, m_group_name{std::move(group)}, m_file_owner{true}, m_group_owner{true} {}
HDF5Handle::HDF5Handle(hid_t hid, bool transfer_ownership) {
  if (H5Iis_valid(hid) > 0) {
    auto type = H5Iget_type(hid);
    if (type == H5I_FILE) {
      m_file_hid = hid;
      m_file_owner = transfer_ownership;
      m_file_is_open = transfer_ownership;
      m_file_name = hdf5_get_file_name(hid);
    } else if (type == H5I_GROUP) {
      m_group_hid = hid;
      m_group_owner = transfer_ownership;
      m_group_is_open = transfer_ownership;
      m_group_name = hdf5_get_object_name(m_group_hid);
    }
  }
}
HDF5Handle::~HDF5Handle() {
  HDF5Handle::close_file();
  HDF5Handle::close_group();
}
hid_t HDF5Handle::open_file(HDF5Handle::Access type) {
  if (file_is_open()) {
    unsigned intent = 0;
    auto err = H5Fget_intent(m_file_hid, &intent);
    if (err < 0)
      return hid_default;
    unsigned curr_intent = 0;
    if (type == Access::read_only)
      curr_intent = H5F_ACC_RDONLY;
    else if (type == Access::read_write)
      curr_intent = H5F_ACC_RDWR;
    if (intent == curr_intent || intent & curr_intent)
      return m_file_hid;
    else
      return hid_default;
  }
  if (!m_file_owner || m_file_name.empty())
    return hid_default;
  if (file_exists(m_file_name)) {
    if (type == Access::read_only)
      m_file_hid = H5Fopen(m_file_name.c_str(), H5F_ACC_RDONLY, H5P_DEFAULT);
    else
      m_file_hid = H5Fopen(m_file_name.c_str(), H5F_ACC_RDWR, H5P_DEFAULT);
  } else {
    m_file_hid = H5Fcreate(m_file_name.c_str(), H5F_ACC_EXCL, H5P_DEFAULT, H5P_DEFAULT);
  }
  m_file_is_open = m_file_hid > 0;
  if (!m_file_is_open)
    m_file_hid = hid_default;
  return m_file_hid;
}
hid_t HDF5Handle::open_file(const std::string &file, HDF5Handle::Access type) {
  if (!m_file_name.empty())
    return hid_default;
  m_file_name = file;
  m_file_owner = true;
  return open_file(type);
}
void HDF5Handle::close_file() {
  if (!m_file_owner || !file_is_open())
    return;
  if (H5Iis_valid(m_file_hid) > 0) {
    H5Fclose(m_file_hid);
  }
  m_file_hid = hid_default;
}
bool HDF5Handle::file_is_open() const { return H5Iis_valid(m_file_hid) > 0; }
bool HDF5Handle::group_is_open() const { return H5Iis_valid(m_group_hid) > 0; }
std::string HDF5Handle::file_name() const { return m_file_name; }
std::string HDF5Handle::group_name() const { return m_group_name; }
void HDF5Handle::close_group() {
  if (!m_group_owner || m_group_hid == hid_default)
    return;
  if (H5Iis_valid(m_group_hid) > 0) {
    H5Gclose(m_group_hid);
  }
  m_group_hid = hid_default;
}
hid_t HDF5Handle::open_group() {
  if (group_is_open())
    return m_group_hid;
  if (!m_group_owner || m_group_name.empty())
    return hid_default;
  if (!file_is_open() && m_file_owner)
    if (open_file(Access::read_only) == hid_default)
      return hid_default;

  if (hdf5_link_exists(m_file_hid, m_group_name) < 1) {
    m_group_hid = H5Gcreate(m_file_hid, m_group_name.c_str(), H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
  } else {
    m_group_hid = H5Gopen(m_file_hid, m_group_name.c_str(), H5P_DEFAULT);
  }
  m_group_is_open = m_group_hid > 0;
  if (!m_group_is_open)
    m_group_hid = hid_default;
  return m_group_hid;
}
hid_t HDF5Handle::open_group(std::string &group) {
  if (!m_group_name.empty() || m_group_hid != hid_default)
    return hid_default;
  m_group_name = group;
  m_group_owner = true;
  return open_group();
}

bool file_exists(const std::string &fname) { return !std::ifstream{fname}.fail(); }

hid_t hdf5_open_file(const std::string &fname, bool read_only) {
  hid_t id;
  if (read_only)
    id = H5Fopen(fname.c_str(), H5F_ACC_RDONLY, H5P_DEFAULT);
  else
    id = H5Fopen(fname.c_str(), H5F_ACC_RDWR, H5P_DEFAULT);
  return id;
}

hid_t hdf5_create_file(const std::string &fname) {
  return H5Fcreate(fname.c_str(), H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
}

hid_t hdf5_open_file(const std::string &fname, MPI_Comm communicator, bool read_only) {
  auto plist_id = H5Pcreate(H5P_FILE_ACCESS);
  H5Pset_fapl_mpio(plist_id, communicator, MPI_INFO_NULL);
  hid_t id;
  if (read_only)
    id = H5Fopen(fname.c_str(), H5F_ACC_RDONLY, plist_id);
  else
    id = H5Fopen(fname.c_str(), H5F_ACC_RDWR, plist_id);
  H5Pclose(plist_id);
  return id;
}

hid_t hdf5_create_file(const std::string &fname, MPI_Comm communicator) {
  auto plist_id = H5Pcreate(H5P_FILE_ACCESS);
  H5Pset_fapl_mpio(plist_id, communicator, MPI_INFO_NULL);
  auto id = H5Fcreate(fname.c_str(), H5F_ACC_TRUNC, H5P_DEFAULT, plist_id);
  H5Pclose(plist_id);
  return id;
}

bool hdf5_file_is_open(hid_t file_id) { return H5Fget_obj_count(file_id, H5F_OBJ_FILE) > 0; }

bool hdf5_dataset_exists(hid_t location, const std::string &dataset_name) {
  return H5Lexists(location, dataset_name.c_str(), H5P_DEFAULT) > 0;
}
std::string hdf5_get_object_name(hid_t id) {
  auto size = H5Iget_name(id, nullptr, 0);
  std::string result;
  result.resize(size + 1);
  H5Iget_name(id, &result[0], size + 1);
  return result;
}
std::string hdf5_get_file_name(hid_t id) {
  auto size = H5Fget_name(id, nullptr, 0);
  std::string result;
  result.resize(size + 1);
  H5Fget_name(id, &result[0], size + 1);
  return result;
}
//  "/group1/group2/dataset/does_not_exist"
htri_t hdf5_link_exists(hid_t id, std::string path) {
  path.erase(path.begin(), std::find_if(path.begin(), path.end(), [](auto &el) { return !std::isspace(el); }));
  path.erase(std::find_if(path.rbegin(), path.rend(), [](auto &el) { return !std::isspace(el); }).base(), path.end());
  if (path.empty())
    return -1;
  htri_t res = -1;
  size_t n = 0;
  while (n != std::string::npos) {
    n = path.find('/', n);
    if (n != std::string::npos)
      ++n;
    auto sub = path.substr(0, n);
    res = H5Lexists(id, sub.c_str(), H5P_DEFAULT);
    if (res < 1)
      break;
  }
  return res;
}

} // namespace util
} // namespace array
} // namespace linalg
} // namespace molpro
