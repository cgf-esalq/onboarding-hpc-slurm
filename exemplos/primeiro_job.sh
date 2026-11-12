#!/bin/bash
#SBATCH --job-name=primeiro_job
#SBATCH --partition=teste
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M
#SBATCH --time=00:01:00
#SBATCH --output=logs/primeiro_%j.out
#SBATCH --error=logs/primeiro_%j.err

set -euo pipefail
echo "Início: $(date)"
echo "Job: ${SLURM_JOB_ID}"
echo "Nó: $(hostname)"
echo "Diretório: $(pwd)"
echo "CPUs por tarefa: ${SLURM_CPUS_PER_TASK}"
echo "Bash: ${BASH_VERSION}"
sleep 5
echo "Fim: $(date)"
