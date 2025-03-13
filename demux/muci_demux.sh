#!/bin/bash

## run this with: sbatch muci_demux
## check queue with squeue
##
## this script de-multiplexing bsp185 project runs 1+2+3 BCL files into fastq files

## Resource Request
#SBATCH --job-name=muci_demux
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/logs/logs_demux-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 8 threads and 128G mem"
echo `date`
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/
mkdir -p lily/stages/demux/

cd lily/stages/demux/
export PATH=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/bin/:$PATH

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/230616_VH01203_11_AAC3L5KHV --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/sample_sheet_mrun_11.csv --id=run_1_demux

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/230622_VH01203_12_AAC3L5CHV --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/sample_sheet_mrun_12.csv --id=run_2_demux

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/230704_VH01203_13_AAC3LWNHV --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/sample_sheet_mrun_13.csv --id=run_3_demux

srun echo `date`
srun sleep 10
srun echo "The End"
