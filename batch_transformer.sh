#!/bin/bash -l

# Set SCC Project
#$ -P depaqlab

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea

# Give job a name
#$ -N CC_SCAF

# Combine output and error files into a single file
#$ -j y

# Specify dir for output files
#$ -o /projectnb/depaqlab/Grant/Prosmith_refactor/results/CC/bash_output

# give it 12 hours to run per core/node
#$ -l h_rt=48:00:00

# requesting gpus:
#$ -l gpus=1
#$ -l gpu_c=6.0

# enable multiple cores (1 per gpu)
#$ -pe omp 4

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
python /projectnb/depaqlab/Grant/Prosmith_refactor/code/training/training.py --train_dir /projectnb/depaqlab/Grant/Prosmith_refactor/data/CC/rand_splits --embed_path /projectnb/depaqlab/Grant/Prosmith_refactor/data/CC/embeddings/featurized_mols/ScaffoldKeyCalculator.pkl --save_model_path /projectnb/depaqlab/Grant/Prosmith_refactor/results/CC/saved_models --binary_task False --log_name CC_SCAF --pretrained_model /projectnb/depaqlab/Grant/Prosmith_refactor/BindingDB/saved_model/pretraining_IC50_6gpus_bs144_1.5e-05_layers6.txt.pkl
