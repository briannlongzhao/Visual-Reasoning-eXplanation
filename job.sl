#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=1:00:00
#SBATCH --output=output.txt
#SBATCH --error=error.txt

ulimit -s unlimited
eval "$(conda shell.bash hook)"
conda activate ~/.conda/envs/3.6
module load gcc/8.3.0

python3 discover_concept.py
#python3 Xception_WhyNot.py --img_class fire_engine --img_idx 19835
