#!/bin/bash

## run this with: (example) sbatch --output="/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/logs/%x-%j-outs_differential-$SLURM_DATE.txt" /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/code/html/html_differential.sh
## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of Elma's project: bsp185

## Resource Request
#SBATCH --job-name=muci_html
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/logs/%x-%j-outs_differential_${SLURM_DATE}.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 10 thread and 128G mem"
echo `date`

module load tools


echo "here: " `pwd`
echo "clust date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/code

export sampSet="run_1"
export sampDPI="1_DPI"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/preprocess/differential_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('differential_lily.Rmd',  output_file=\"${cF}\")"

export sampSet="run_2"
export sampDPI="20_DPI"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/preprocess/differential_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('differential_lily.Rmd',  output_file=\"${cF}\")"

echo `date`
sleep 10
echo "The End"
