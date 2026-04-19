# Run once before win_rate_computation.py to generate reference baselines.
# Requires: SFT and RM already trained.

# Generate SFT model samples on test set
bash exp/hh_qwen14b_exp/inference_align_sft.sh 0,1,2,3,4,5,6,7 models/qwen2.5-14b_hh/sft

# RM-evaluate SFT samples → path1 in win_rate_computation.py
bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/sft test models/qwen2.5-14b_hh/rm eval

# RM-evaluate raw HH chosen/rejected → path11 in win_rate_computation.py
bash exp/hh_qwen14b_exp/inference_rm.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh test models/qwen2.5-14b_hh/rm eval
