#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64GB
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=6:00:00
#SBATCH --output=output-gpu.txt
#SBATCH --error=error-gpu.txt

module purge
module load gcc/8.3.0
module load cuda/10.2.89

ulimit -s unlimited

eval "$(conda shell.bash hook)"
conda activate ~/.conda/envs/3.6

python3 testgpu.py

# Discover concept
#python3 discover_concept.py

# Match concept
python3 match_concept.py

# Training Structural Concept Graph (SCG)
#python3 VR_training_XAI.py

# Reasoning image
#python3 Xception_WhyNot.py --img_class fire_engine --img_idx 19835
