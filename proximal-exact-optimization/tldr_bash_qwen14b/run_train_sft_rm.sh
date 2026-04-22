LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# Preprocess TLDR data (shared, run once)
mkdir -p exp/tldr_exp/data
[ -d exp/tldr_exp/data/tldr ] || python exp/tldr_exp/preproc_pref.py
[ -d exp/tldr_exp/data/tldr_filtered ] || python exp/tldr_exp/preproc_filter.py

bash exp/tldr_qwen14b_exp/train_sft.sh qwen2.5-14b models/Qwen2.5-14B

bash exp/tldr_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-14b_tldr/sft
bash exp/tldr_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test models/qwen2.5-14b_tldr/sft

bash exp/tldr_qwen14b_exp/train_rm.sh qwen2.5-14b models/Qwen2.5-14B
