#include "gciUtils.h"
#include <fstream>
#include <iostream>
#include <stdexcept>

namespace molpro {
namespace gci {
namespace utils {

bool file_exists(const std::string &fname, const std::string &message) {
  if (std::ifstream{fname}.fail()) {
    if (!message.empty())
      std::cout << message << std::endl;
    return false;
  }
  return true;
}

hid_t open_hdf5_file(const std::string &fname, MPI_Comm communicator, bool create) {
#ifdef HAVE_HDF5
  auto plist_id = H5Pcreate(H5P_FILE_ACCESS);
  H5Pset_fapl_mpio(plist_id, communicator, MPI_INFO_NULL);
  hid_t id;
  if (create) {
    id = H5Fcreate(fname.c_str(), H5F_ACC_TRUNC, H5P_DEFAULT, plist_id);
    H5Pclose(plist_id);
  } else {
    id = H5Fopen(fname.c_str(), H5F_ACC_RDONLY, plist_id);
    H5Pclose(plist_id);
  }
  if (id < 0)
    throw std::runtime_error("open_hdf5_file(): failed to open/create file");
  return id;
#else // HAVE_HDF5
  throw std::logic_error("HDF5 support not compiled");
#endif // HAVE_HDF5
}

bool hdf5_file_open(hid_t file_id) {
#ifdef HAVE_HDF5
return H5Fget_obj_count(file_id, H5F_OBJ_FILE) > 0;
#else // HAVE_HDF5
throw std::logic_error("HDF5 support not compiled");
#endif // HAVE_HDF5
}

bool hdf5_dataset_exists(hid_t location, const std::string &dataset_name) {
#ifdef HAVE_HDF5
  return H5Lexists(location, dataset_name.c_str(), H5P_DEFAULT) > 0;
#else // HAVE_HDF5
throw std::logic_error("HDF5 support not compiled");
#endif // HAVE_HDF5
}

hid_t open_or_create_hdf5_dataset(const hid_t &location, const std::string &dataset_name, const hid_t &dtype_id,
                                  const size_t &length) {
#ifdef HAVE_HDF5
  hid_t dataset;
  if (hdf5_dataset_exists(location, dataset_name))
    dataset = H5Dopen(location, dataset_name.c_str(), H5P_DEFAULT);
  else {
    hsize_t dimensions[1] = {length};
    auto space = H5Screate_simple(1, dimensions, nullptr);
    dataset = H5Dcreate(location, dataset_name.c_str(), dtype_id, space, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);
    H5Sclose(space);
  }
  return dataset;
#else // HAVE_HDF5
throw std::logic_error("HDF5 support not compiled");
#endif // HAVE_HDF5
}

} // namespace utils
} // namespace gci
} // namespace molpro
