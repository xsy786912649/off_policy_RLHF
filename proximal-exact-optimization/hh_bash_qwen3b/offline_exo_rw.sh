#1

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft 1

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh test models/qwen2.5-3b_hh/sft 0

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft train models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft test models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/train_offline.sh 0,1,2 qwen2.5-3b models/qwen2.5-3b_hh/sft exp/hh_qwen3b_exp/data/hh_rw "exo-rw" 2 models/qwen2.5-3b_hh/sft 1

#2

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft 2

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft train models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/train_offline.sh 0,1,2 qwen2.5-3b models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt1 exp/hh_qwen3b_exp/data/hh_rw "exo-rw" 2 models/qwen2.5-3b_hh/sft 2

#3

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft 3

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft train models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/train_offline.sh 0,1,2 qwen2.5-3b models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt2 exp/hh_qwen3b_exp/data/hh_rw "exo-rw" 2 models/qwen2.5-3b_hh/sft 3

#4

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft 4

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft train models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/train_offline.sh 0,1,2 qwen2.5-3b models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt3 exp/hh_qwen3b_exp/data/hh_rw "exo-rw" 2 models/qwen2.5-3b_hh/sft 4

#5

bash exp/hh_qwen3b_exp/inference_offline_align_training.sh 0,1,2 hh/sft:exp/hh_qwen3b_exp/data/hh train models/qwen2.5-3b_hh/sft 5

bash exp/hh_qwen3b_exp/label_offline_align_training.sh 0,1,2 exp/hh_qwen3b_exp/data/hh_sft train models/qwen2.5-3b_hh/rm label

bash exp/hh_qwen3b_exp/train_offline.sh 0,1,2 qwen2.5-3b models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt4 exp/hh_qwen3b_exp/data/hh_rw "exo-rw" 2 models/qwen2.5-3b_hh/sft 5

#inference test

bash exp/hh_qwen3b_exp/inference_align.sh 0,1,2 models/qwen2.5-3b_hh/align_exo-rw_nc2

bash exp/hh_qwen3b_exp/inference_rm_test.sh 0,1,2  models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt1 test models/qwen2.5-3b_hh/rm eval

bash exp/hh_qwen3b_exp/inference_rm_test.sh 0,1,2  models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt2 test models/qwen2.5-3b_hh/rm eval

bash exp/hh_qwen3b_exp/inference_rm_test.sh 0,1,2  models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt3 test models/qwen2.5-3b_hh/rm eval

bash exp/hh_qwen3b_exp/inference_rm_test.sh 0,1,2  models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt4 test models/qwen2.5-3b_hh/rm eval

bash exp/hh_qwen3b_exp/inference_rm_test.sh 0,1,2  models/qwen2.5-3b_hh/align_exo-rw_nc2/ckpt5 test models/qwen2.5-3b_hh/rm eval

python hh_bash_qwen3b/win_rate_computation.py exo-rw