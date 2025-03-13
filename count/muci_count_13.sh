#!/bin/bash

## run this with: sbatch muci_count_13
## check queue with squeue

## Resource Request
#SBATCH --job-name=muci_count_13
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_185/lily/logs/outs-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 8 threads and 128G meme"
echo `date`


mkdir -p /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/count
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/count
export PATH=/mnt/lustre/RDS-live/scrna/local/bin/:$PATH
# reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1.113/Sus_scrofa.Sscrofa11.1.113-filt-cellr
reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1.108/Sus_scrofa.Sscrofa11.1.108-filt-cellr
fastqs_path=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_185/lily/stages/demux/run_3_demux/outs/fastq_path/AAC3LWNHV

# make sure /mnt/lustre/RDS-live/angelopoulos/local/bin/bcl2fastq is in your path

# run 3 / mrun 13
# sample 20
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_20_count \
      --fastqs=$fastqs_path \
      --sample=4  \
      --transcriptome=$reference_transcriptome

# sample 19
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_19_count \
      --fastqs=$fastqs_path \
      --sample=3  \
      --transcriptome=$reference_transcriptome

# sample 18
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_18_count \
      --fastqs=$fastqs_path \
      --sample=2  \
      --transcriptome=$reference_transcriptome

# sample 17
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_17_count \
      --fastqs=$fastqs_path \
      --sample=1  \
      --transcriptome=$reference_transcriptome

echo `date`
sleep 10
echo "The End"
