#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64GB
#SBATCH --time=1:00:00
#SBATCH --output=output.txt
#SBATCH --error=error.txt

ulimit -s unlimited

python discover_concept.py
