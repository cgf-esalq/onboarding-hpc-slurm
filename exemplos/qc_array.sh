#!/bin/bash
#SBATCH --job-name=qc_array
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=02:00:00
#SBATCH --array=1-3%2
#SBATCH --output=logs/qc_%A_%a.out
#SBATCH --error=logs/qc_%A_%a.err

set -euo pipefail
# Carregue aqui o módulo ou ambiente que disponibiliza fastqc.
command -v fastqc
fastqc --version

AMOSTRA=$(sed -n "${SLURM_ARRAY_TASK_ID}p" lista_amostras.txt)
: "${AMOSTRA:?Linha vazia ou inexistente na lista de amostras}"

echo "Amostra: ${AMOSTRA} | Tarefa: ${SLURM_ARRAY_TASK_ID}"
echo "Nó: $(hostname) | Início: $(date)"
fastqc -t "${SLURM_CPUS_PER_TASK}" \
  "data/raw/${AMOSTRA}.fastq.gz" \
  -o results/fastqc/
echo "Fim: $(date)"
