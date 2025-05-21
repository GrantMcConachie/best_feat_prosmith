#!/bin/bash -l

# Set SCC Project
#$ -P depaqlab

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea

# Give job a name
#$ -N CC_CATS_GB

# Combine output and error files into a single file
#$ -j y

# Specify dir for output files
#$ -o /projectnb/depaqlab/Grant/ProSmith_scc/CC_and_HC/bash_output

# give it 12 hours to run per core/node
#$ -l h_rt=48:00:00

# requesting gpus:
#$ -l gpus=1
#$ -l gpu_c=6.0

# set torch home stuff to avoid anything dumb w cache stuff in my home dir:
HF_HOME=/projectnb/depaqlab/emily/prosmith/github/downhome
TORCH_HOME=/projectnb/depaqlab/emily/prosmith/github/downhome


# Keep track of information related to the current job
echo "=========================================================="
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID : $JOB_ID"
echo "hey queen"
echo "=========================================================="

# activate environment for prosmith:
module load miniconda
conda activate prosmith

# run the Python function
python /projectnb/depaqlab/Grant/Prosmith_refactor/code/training/training_GB.py --train_dir /projectnb/depaqlab/Grant/Prosmith_refactor/data/CC/rand_splits --embed_path /projectnb/depaqlab/Grant/Prosmith_refactor/data/CC/embeddings/featurized_mols/CATS.pkl --num_iter 500 --log_name CC_CATS_GB --binary_task False
