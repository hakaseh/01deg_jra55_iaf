#!/bin/bash
log=$(pwd)/archive/env-wrapper_logs/${PBS_JOBID}
mkdir -p ${log}
world_rank=$(printf "%05d\n" ${OMPI_COMM_WORLD_RANK})
local_rank=$(printf "%05d\n" ${OMPI_COMM_WORLD_LOCAL_RANK})
envdump=environ-yatm-${PBS_JOBID}.${world_rank}-$(hostname).${local_rank}
env > ${log}/${envdump}
exec /short/v45/aek156/CHUCKABLE/OceansAus/access-om2-yatm/access-om2/bin/yatm_84acdb8.exe "$@"
