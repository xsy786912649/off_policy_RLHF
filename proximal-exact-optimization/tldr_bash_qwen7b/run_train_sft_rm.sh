LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# ── Step 1: Prepare shared TLDR data (download + preprocess, idempotent) ─────
# Data is shared across all model sizes; skip if already done.
bash exp/tldr_exp/prepare_data.sh

# ── Step 2: SFT ──────────────────────────────────────────────────────────────
bash exp/tldr_qwen7b_exp/train_sft.sh qwen2.5-7b models/Qwen2.5-7B

# ── Step 3: SFT inference (train + test, needed for RM training data) ─────────
bash exp/tldr_qwen7b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft
bash exp/tldr_qwen7b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test models/qwen2.5-7b_tldr/sft

# ── Step 4: RM ───────────────────────────────────────────────────────────────
bash exp/tldr_qwen7b_exp/train_rm.sh qwen2.5-7b models/Qwen2.5-7B
