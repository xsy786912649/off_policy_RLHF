LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# Run once before win_rate_computation.py to generate reference baselines.
# Requires: SFT and RM already trained.

# Generate SFT model samples on test set
bash exp/tldr_qwen7b_exp/inference_align_sft.sh 0,1,2,3,4,5,6,7 models/qwen2.5-7b_tldr/sft

# RM-evaluate SFT samples → path1 in win_rate_computation.py
bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/sft test models/qwen2.5-7b_tldr/rm eval

# RM-evaluate raw TLDR chosen/rejected → path11 in win_rate_computation.py
bash exp/tldr_qwen7b_exp/inference_rm.sh 0,1,2,3,4,5,6,7 exp/tldr_exp/data/tldr test models/qwen2.5-7b_tldr/rm eval
