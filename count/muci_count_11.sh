#!/bin/bash

## run this with: sbatch muci_count_11
## check queue with squeue
##
## this script aligns sequencing reads in FASTQ files to a reference transcriptome and generates a number of  outputs
# and also creates gene count matrix

## Resource Request
#SBATCH --job-name=muci_count_11
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/logs/outs-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 8 threads and 128G meme for count step"
echo `date`

mkdir -p /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/count
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/count
export PATH=/mnt/lustre/RDS-live/scrna/local/bin/:$PATH
# reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1.113/Sus_scrofa.Sscrofa11.1.113-filt-cellr
reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1.108/Sus_scrofa.Sscrofa11.1.108-filt-cellr
fastqs_path=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/demux/run_1_demux/outs/fastq_path/AAC3L5KHV

# echo $reference_transcriptome
# make sure /mnt/lustre/RDS-live/angelopoulos/local/bin/bcl2fastq is in your path

# run 1 / mrun 11
# sample 08
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_08_count \
      --fastqs=$fastqs_path \
      --sample=8  \
      --transcriptome=$reference_transcriptome

# sample 07
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_07_count \
      --fastqs=$fastqs_path \
      --sample=7  \
      --transcriptome=$reference_transcriptome

# sample 06
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_06_count \
      --fastqs=$fastqs_path \
      --sample=6  \
      --transcriptome=$reference_transcriptome

# sample 05
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_05_count \
      --fastqs=$fastqs_path \
      --sample=5  \
      --transcriptome=$reference_transcriptome

# sample 04
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_04_count \
      --fastqs=$fastqs_path \
      --sample=4  \
      --transcriptome=$reference_transcriptome

# sample 03
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_03_count \
      --fastqs=$fastqs_path \
      --sample=3  \
      --transcriptome=$reference_transcriptome

# sample 02
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_02_count \
      --fastqs=$fastqs_path \
      --sample=2  \
      --transcriptome=$reference_transcriptome

# sample 01
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_01_count \
      --fastqs=$fastqs_path \
      --sample=1  \
      --transcriptome=$reference_transcriptome

echo `date`
sleep 10
echo "The End"
