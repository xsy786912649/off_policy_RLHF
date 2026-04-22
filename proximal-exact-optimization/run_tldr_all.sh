#!/bin/bash
# =============================================================================
# Full TLDR pipeline for Qwen2.5-3B / 7B / 14B
# Run from project root:  bash run_tldr_all.sh
# =============================================================================
set -e

LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/run_tldr_all_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | run_tldr_all.sh ==="

# ── 0. Download + preprocess TLDR data (shared, idempotent) ──────────────────
bash exp/tldr_exp/prepare_data.sh

# =============================================================================
# Qwen2.5-3B
# =============================================================================
echo ""
echo "============================================================"
echo "  Qwen2.5-3B  SFT + RM"
echo "============================================================"
bash exp/tldr_qwen3b_exp/train_sft.sh qwen2.5-3b models/Qwen2.5-3B
bash exp/tldr_qwen3b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-3b_tldr/sft
bash exp/tldr_qwen3b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test  models/qwen2.5-3b_tldr/sft
bash exp/tldr_qwen3b_exp/train_rm.sh qwen2.5-3b models/Qwen2.5-3B

echo ""
echo "============================================================"
echo "  Qwen2.5-3B  Baselines"
echo "============================================================"
bash tldr_bash_qwen3b/setup_baseline.sh
bash tldr_bash_qwen3b/offline_dpo_rw.sh
bash tldr_bash_qwen3b/online_dpo_rw.sh
bash tldr_bash_qwen3b/pponline_dpo_rw.sh
bash tldr_bash_qwen3b/offline_exo_rw.sh
bash tldr_bash_qwen3b/online_exo_rw.sh
bash tldr_bash_qwen3b/pponline_exo_rw.sh
python tldr_bash_qwen3b/collect_results.py

# =============================================================================
# Qwen2.5-7B
# =============================================================================
echo ""
echo "============================================================"
echo "  Qwen2.5-7B  SFT + RM"
echo "============================================================"
bash exp/tldr_qwen7b_exp/train_sft.sh qwen2.5-7b models/Qwen2.5-7B
bash exp/tldr_qwen7b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft
bash exp/tldr_qwen7b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test  models/qwen2.5-7b_tldr/sft
bash exp/tldr_qwen7b_exp/train_rm.sh qwen2.5-7b models/Qwen2.5-7B

echo ""
echo "============================================================"
echo "  Qwen2.5-7B  Baselines"
echo "============================================================"
bash tldr_bash_qwen7b/setup_baseline.sh
bash tldr_bash_qwen7b/offline_dpo_rw.sh
bash tldr_bash_qwen7b/online_dpo_rw.sh
bash tldr_bash_qwen7b/pponline_dpo_rw.sh
bash tldr_bash_qwen7b/offline_exo_rw.sh
bash tldr_bash_qwen7b/online_exo_rw.sh
bash tldr_bash_qwen7b/pponline_exo_rw.sh
python tldr_bash_qwen7b/collect_results.py

# =============================================================================
# Qwen2.5-14B
# =============================================================================
echo ""
echo "============================================================"
echo "  Qwen2.5-14B  SFT + RM"
echo "============================================================"
bash exp/tldr_qwen14b_exp/train_sft.sh qwen2.5-14b models/Qwen2.5-14B
bash exp/tldr_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-14b_tldr/sft
bash exp/tldr_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test  models/qwen2.5-14b_tldr/sft
bash exp/tldr_qwen14b_exp/train_rm.sh qwen2.5-14b models/Qwen2.5-14B

echo ""
echo "============================================================"
echo "  Qwen2.5-14B  Baselines"
echo "============================================================"
bash tldr_bash_qwen14b/setup_baseline.sh
bash tldr_bash_qwen14b/offline_dpo_rw.sh
bash tldr_bash_qwen14b/online_dpo_rw.sh
bash tldr_bash_qwen14b/pponline_dpo_rw.sh
bash tldr_bash_qwen14b/offline_exo_rw.sh
bash tldr_bash_qwen14b/online_exo_rw.sh
bash tldr_bash_qwen14b/pponline_exo_rw.sh
python tldr_bash_qwen14b/collect_results.py

echo ""
echo "=== $(date) | run_tldr_all.sh DONE ==="
