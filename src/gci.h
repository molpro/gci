#ifndef GCI_H
#define GCI_H
#include <vector>
#include <cstring>
#include <stdexcept>
#include "Profiler.h"
#include <stdint.h>
#include "sharedCounter.h"

#ifndef MOLPRO
#define xout std::cout
#else
#include "gciMolpro.h"
#endif

#define MPI_COMM_COMPUTE MPI_COMM_WORLD

#include "mpi.h"


#include <iostream>
#include <memory>
namespace gci {

extern std::unique_ptr<Profiler> profiler; // global profiler

extern int parallel_rank, parallel_size;

extern MPI_Comm molpro_plugin_intercomm;
extern bool molpro_plugin;

// shared counter
extern int64_t __nextval_counter;
extern sharedCounter* _nextval_counter;
inline long nextval(int64_t option=parallel_size){
//  int64_t value; PPIDD_Nxtval(&option,&value); //xout <<std::endl<<"@nextval("<<option<<",rank="<<parallel_rank<<")="<<value<<std::endl;
//  return value;
  if (option < 0 ) {_nextval_counter->reset();return 0;}
//  long value= _nextval_counter->increment();
//  xout <<"nextval returning "<<value<<std::endl;
//  return value;
  return _nextval_counter->increment();
}

// task scheduler
extern int64_t __task_granularity, __task, __my_first_task;
inline void DivideTasks(std::size_t ntasks, std::size_t nMinBatch = 0, std::size_t nMaxBatch = 0) {{
  // simple static LB
  __task_granularity = (ntasks-1)/parallel_size+1;
  __task_granularity = __task_granularity > 0 ? __task_granularity : 1;
  if ((int64_t)nMinBatch > 0 && __task_granularity < (int64_t)nMinBatch) __task_granularity = (int64_t)nMinBatch;
  if ((int64_t)nMaxBatch > 0 && __task_granularity > (int64_t)nMaxBatch) __task_granularity = (int64_t)nMaxBatch;
//  __task_granularity = 3;
  nextval(-parallel_size);
//  xout << "DivideTasks ntasks="<<ntasks<<std::endl;
  __task=0;
  __my_first_task=-__task_granularity-1;
//  xout << "__task_granularity="<<__task_granularity<<", __my_first_task="<<__my_first_task<<std::endl;
}}
inline bool NextTask() {
  {
//    return (parallel_rank==0);
//    xout << "On entry, NextTask has __my_first_task="<<__my_first_task <<std::endl;
  if (__my_first_task+__task_granularity <= __task)
//    xout << "NextTask calls nextval()"<<std::endl;
  if (__my_first_task+__task_granularity <= __task)
    __my_first_task = nextval()*__task_granularity;
//  xout << "NextTask has __my_first_task="<<__my_first_task<<", __task_granularity="<<__task_granularity<<", __task="<<__task<<std::endl;
//  xout << "NextTask returns "<< (__task++ >= __my_first_task && __task <= __my_first_task+__task_granularity) <<std::endl;
  return (__task++ >= __my_first_task && __task <= __my_first_task+__task_granularity) ;
  }
}
inline void EndTasks() {
}

// simple task distribution assembly

inline void gather_chunks(double *buffer, const size_t length, const size_t chunk) {
      {
        std::vector<int> recvcounts(parallel_size), displs(parallel_size);
        displs[0]=0;
        for (size_t i=1; i<(size_t)parallel_size; i++) {
          displs[i]=(int)i*chunk;
          if (displs[i] > (int)(length)) displs[i]=(int)length;
          recvcounts[i-1]=displs[i]-displs[i-1];
        }
        recvcounts[parallel_size-1]=(int)(length)-displs[parallel_size-1];
//        xout << "nsa="<<nsa<<std::endl;
//        xout << "displ:"; for (size_t i=0; i<(size_t)parallel_size; i++) xout <<" "<<displs[i]; xout <<std::endl;
//        xout << "recvcounts:"; for (size_t i=0; i<(size_t)parallel_size; i++) xout <<" "<<recvcounts[i]; xout <<std::endl;
        MPI_Allgatherv(MPI_IN_PLACE,0,MPI_DATATYPE_NULL,buffer,&recvcounts[0],&displs[0],MPI_DOUBLE,MPI_COMM_COMPUTE);
      }
}

void inline gsum(double* buffer, const size_t len)
{
  std::vector<double>result;
  if (parallel_rank == 0)
    result.resize(len);
  MPI_Reduce(buffer,&result[0],(int)len,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_COMPUTE);
  if (parallel_rank == 0)
    std::memcpy(buffer,&result[0],sizeof(double)*len);
  MPI_Bcast(buffer,(int)len,MPI_DOUBLE,0,MPI_COMM_COMPUTE);
}


}

#endif // GCI_H
