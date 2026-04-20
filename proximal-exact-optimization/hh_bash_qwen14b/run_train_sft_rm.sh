LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# Step 1: reuse preprocessed HH data from 3B (same dataset)
mkdir -p exp/hh_qwen14b_exp/data
cp -r exp/hh_qwen3b_exp/data/hh exp/hh_qwen14b_exp/data/hh

# Step 2: SFT
# Note: with ZeRO-3, save_zero_three_model() directly gathers and saves pytorch_model.bin
# to output_dir/ — no separate consolidation step needed.
bash exp/hh_qwen14b_exp/train_sft.sh qwen2.5-14b models/Qwen2.5-14B

# Step 3: SFT inference (train + test，供 RM 训练用)
bash exp/hh_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/sft
bash exp/hh_qwen14b_exp/inference_sft.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh test models/qwen2.5-14b_hh/sft

# Step 4: RM training
# Note: same as SFT — pytorch_model.bin is saved directly, no consolidation needed.
bash exp/hh_qwen14b_exp/train_rm.sh qwen2.5-14b models/Qwen2.5-14B
