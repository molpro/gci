FROM ubuntu:jammy-20220531
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake git g++ doxygen graphviz bash rsync curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mpich libhdf5-mpich-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libblas-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y liblapack-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libeigen3-dev
