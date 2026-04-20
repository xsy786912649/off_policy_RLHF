LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

mkdir -p exp/hh_qwen3b_exp/data
# data already preprocessed; skip if exists
[ -d exp/hh_qwen3b_exp/data/hh ] || python exp/hh_qwen3b_exp/preproc.py $HH_RAW_DATA_PATH

bash exp/hh_qwen3b_exp/train_sft.sh qwen2.5-3b models/Qwen2.5-3B

bash exp/hh_qwen3b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft
bash exp/hh_qwen3b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen3b_exp/data/hh test models/qwen2.5-3b_hh/sft

bash exp/hh_qwen3b_exp/train_rm.sh qwen2.5-3b models/Qwen2.5-3B
