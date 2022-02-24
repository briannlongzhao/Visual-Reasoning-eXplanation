#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64GB
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=1:00:00
#SBATCH --output=output-gpu.txt
#SBATCH --error=error-gpu.txt

module load cuda/11.1-1
ulimit -s unlimited

eval "$(conda shell.bash hook)"
conda activate ~/.conda/envs/VRX3.6

#pip install --upgrade --no-deps --force-reinstall torch torch-geometric==1.7.1
#pip install --upgrade --no-deps --force-reinstall torch-scatter torch-sparse -f https://data.pyg.org/whl/torch-1.9.0+cu111.html

python testgpu.py
python3 Xception_WhyNot.py --img_class fire_engine --img_idx 19835
