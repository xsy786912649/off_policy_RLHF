#!/bin/bash
# Run KL computation for pponline (PRPO) vs online (DPO) across 3B / 7B / 14B.
# Results land in kl_results/<model_dir_name>/kl_values.txt
#
# Usage:  bash run_kl_all.sh <gpu_ids>
# Example: bash run_kl_all.sh 0,1,2,3,4,5,6,7

set -e
GPU_IDS=${1:-"0,1,2,3,4,5,6,7"}

# ── Qwen2.5-3B ──────────────────────────────────────────────────────────────
bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-3b_hh/align_online_pp-dpo-rw_nc2 \
    models/qwen2.5-3b_hh/sft \
    exp/hh_qwen3b_exp/data/hh_infer_res \
    5

bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-3b_hh/align_online_dpo-rw_nc2 \
    models/qwen2.5-3b_hh/sft \
    exp/hh_qwen3b_exp/data/hh_infer_res \
    5

# ── Qwen2.5-7B ──────────────────────────────────────────────────────────────
bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-7b_hh/align_online_pp-dpo-rw_nc2 \
    models/qwen2.5-7b_hh/sft \
    exp/hh_qwen7b_exp/data/hh_infer_res \
    5

bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-7b_hh/align_online_dpo-rw_nc2 \
    models/qwen2.5-7b_hh/sft \
    exp/hh_qwen7b_exp/data/hh_infer_res \
    5

# ── Qwen2.5-14B ─────────────────────────────────────────────────────────────
bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-14b_hh/align_online_pp-dpo-rw_nc2 \
    models/qwen2.5-14b_hh/sft \
    exp/hh_qwen14b_exp/data/hh_infer_res \
    5

bash compute_kl_iters.sh "$GPU_IDS" \
    models/qwen2.5-14b_hh/align_online_dpo-rw_nc2 \
    models/qwen2.5-14b_hh/sft \
    exp/hh_qwen14b_exp/data/hh_infer_res \
    5

echo ""
echo "=== All done. KL results ==="
for f in kl_results/*/kl_values.txt; do
    echo ""
    echo "[$f]"
    cat "$f"
done
