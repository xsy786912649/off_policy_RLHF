LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

#1

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft 1

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr test models/qwen2.5-7b_tldr/sft 0

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft train models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft test models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/train_offline.sh 0,1,2,3,4,5,6,7 qwen2.5-7b models/qwen2.5-7b_tldr/sft exp/tldr_qwen7b_exp/data/tldr_rw "exo-rw" 2 models/qwen2.5-7b_tldr/sft 1

#2

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft 2

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft train models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/train_offline.sh 0,1,2,3,4,5,6,7 qwen2.5-7b models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt1 exp/tldr_qwen7b_exp/data/tldr_rw "exo-rw" 2 models/qwen2.5-7b_tldr/sft 2

#3

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft 3

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft train models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/train_offline.sh 0,1,2,3,4,5,6,7 qwen2.5-7b models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt2 exp/tldr_qwen7b_exp/data/tldr_rw "exo-rw" 2 models/qwen2.5-7b_tldr/sft 3

#4

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft 4

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft train models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/train_offline.sh 0,1,2,3,4,5,6,7 qwen2.5-7b models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt3 exp/tldr_qwen7b_exp/data/tldr_rw "exo-rw" 2 models/qwen2.5-7b_tldr/sft 4

#5

bash exp/tldr_qwen7b_exp/inference_offline_align_training.sh 0,1,2,3,4,5,6,7 tldr/sft:exp/tldr_exp/data/tldr train models/qwen2.5-7b_tldr/sft 5

bash exp/tldr_qwen7b_exp/label_offline_align_training.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_sft train models/qwen2.5-7b_tldr/rm label

bash exp/tldr_qwen7b_exp/train_offline.sh 0,1,2,3,4,5,6,7 qwen2.5-7b models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt4 exp/tldr_qwen7b_exp/data/tldr_rw "exo-rw" 2 models/qwen2.5-7b_tldr/sft 5

#inference test

bash exp/tldr_qwen7b_exp/inference_align.sh 0,1,2,3,4,5,6,7 models/qwen2.5-7b_tldr/align_exo-rw_nc2

bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt1 test models/qwen2.5-7b_tldr/rm eval

bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt2 test models/qwen2.5-7b_tldr/rm eval

bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt3 test models/qwen2.5-7b_tldr/rm eval

bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt4 test models/qwen2.5-7b_tldr/rm eval

bash exp/tldr_qwen7b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7 exp/tldr_qwen7b_exp/data/tldr_infer_res/models/qwen2.5-7b_tldr/align_exo-rw_nc2/ckpt5 test models/qwen2.5-7b_tldr/rm eval

python tldr_bash_qwen7b/win_rate_computation.py exo-rw
