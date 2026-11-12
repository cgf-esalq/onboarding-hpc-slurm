#!/bin/bash
#SBATCH --job-name=alinhamento_bwa
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=04:00:00
#SBATCH --output=logs/bwa_%j.out
#SBATCH --error=logs/bwa_%j.err

set -euo pipefail
echo "Início: $(date) | Nó: $(hostname) | Job: ${SLURM_JOB_ID}"

# Carregue aqui o módulo ou ambiente disponível no laboratório.
# Exemplo, somente se esse módulo existir: module load bwa
command -v bwa
bwa 2>&1 | head -n 5 || true

bwa mem -t "${SLURM_CPUS_PER_TASK}" \
  data/raw/ref.fa data/raw/sample1.fq.gz \
  > results/sample1.sam

echo "Fim com sucesso: $(date)"
