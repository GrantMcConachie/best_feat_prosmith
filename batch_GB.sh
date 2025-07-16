#!/bin/bash -l

# Set SCC Project
#$ -P depaqlab

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea

# Give job a name
#$ -N M2OR_CONTEXTPRED_GB

# Combine output and error files into a single file
#$ -j y

# Specify dir for output files
#$ -o /projectnb/depaqlab/Grant/Prosmith_refactor/results/M2OR/bash_output

# give it 12 hours to run per core/node
#$ -l h_rt=48:00:00

# requesting gpus:
#$ -l gpus=1
#$ -l gpu_c=3.7

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
python /projectnb/depaqlab/Grant/Prosmith_refactor/code/training/training_GB.py --train_dir /projectnb/depaqlab/Grant/Prosmith_refactor/data/M2OR/rand_splits --embed_path /projectnb/depaqlab/Grant/Prosmith_refactor/data/M2OR/embeddings/featurized_mols/gin_supervised_contextpred.pkl --num_iter 500 --log_name M2OR_CONTEXTPRED_GB --binary_task True
