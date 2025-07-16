#!/bin/bash -l

# Set SCC Project
#$ -P depaqlab

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea

# Give job a name
#$ -N M2OR_INFOMAX

# Combine output and error files into a single file
#$ -j y

# Specify dir for output files
#$ -o /projectnb/depaqlab/Grant/Prosmith_refactor/results/M2OR/bash_output

# give it 12 hours to run per core/node
#$ -l h_rt=48:00:00

# requesting gpus:
#$ -l gpus=1
#$ -l gpu_c=3.7

# enable multiple cores (1 per gpu)
#$ -pe omp 4

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
python /projectnb/depaqlab/Grant/Prosmith_refactor/code/training/training.py --train_dir /projectnb/depaqlab/Grant/Prosmith_refactor/data/M2OR/rand_splits --embed_path /projectnb/depaqlab/Grant/Prosmith_refactor/data/M2OR/embeddings/featurized_mols/gin_supervised_infomax.pkl --save_model_path /projectnb/depaqlab/Grant/Prosmith_refactor/results/M2OR/saved_models --binary_task True --log_name M2OR_INFOMAX --pretrained_model /projectnb/depaqlab/Grant/Prosmith_refactor/BindingDB/saved_model/pretraining_IC50_6gpus_bs144_1.5e-05_layers6.txt.pkl
