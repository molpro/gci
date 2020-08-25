#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include "file_util.h"
#include <molpro/linalg/array/util/temp_file.h>
#include <molpro/linalg/array/util/temp_hdf5_handle.h>

#include <fstream>

using molpro::linalg::array::util::file_exists;
using molpro::linalg::array::util::HDF5Handle;
using molpro::linalg::array::util::temp_file_name;
using molpro::linalg::array::util::temp_hdf5_handle;

TEST(TempFile, temp_file_name) {
  const auto body = ".temp";
  const auto suffix = ".suffix";
  auto f1 = temp_file_name(body, suffix);
  auto f2 = temp_file_name(body, suffix);
  ASSERT_FALSE(f1.empty());
  ASSERT_FALSE(file_exists(f1));
  ASSERT_EQ(f1, f2);
  std::ofstream(f1.c_str()).close();
  auto g = GarbageCollector(f1);
  ASSERT_TRUE(file_exists(f1));
  auto f3 = temp_file_name(body, suffix);
  ASSERT_FALSE(f1.empty());
  ASSERT_NE(f1, f3);
}

TEST(TempFile, temp_hdf5_handle) {
  auto g = GarbageCollector{};
  {
    auto h1 = temp_hdf5_handle(".temp");
    ASSERT_FALSE(h1.file_name().empty());
    ASSERT_FALSE(file_exists(h1.file_name()));
    ASSERT_TRUE(h1.erase_on_destroy());
    g.file_name = h1.file_name();
    h1.open_file(HDF5Handle::Access::read_write);
    ASSERT_TRUE(file_exists(h1.file_name()));
  }
  ASSERT_FALSE(file_exists(g.file_name));
}
