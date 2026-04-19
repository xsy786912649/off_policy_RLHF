#1.1
bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/sft 1

bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh test models/qwen2.5-14b_hh/sft 0

#1.2
bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline train models/qwen2.5-14b_hh/rm label

bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline test models/qwen2.5-14b_hh/rm label

#1.3
bash exp/hh_qwen14b_exp/train_pponline.sh 0,1,2,3,4,5,6,7 qwen2.5-14b models/qwen2.5-14b_hh/sft exp/hh_qwen14b_exp/data/hh_pponline_rw "pp-exo-rw" 2 models/qwen2.5-14b_hh/sft 1

#2.1
bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt1 2

#2.2
bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline train models/qwen2.5-14b_hh/rm label

#2.3
bash exp/hh_qwen14b_exp/train_pponline.sh 0,1,2,3,4,5,6,7 qwen2.5-14b models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt1 exp/hh_qwen14b_exp/data/hh_pponline_rw "pp-exo-rw" 2 models/qwen2.5-14b_hh/sft 2

#3.1
bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt2 3

#3.2
bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline train models/qwen2.5-14b_hh/rm label

#3.3
bash exp/hh_qwen14b_exp/train_pponline.sh 0,1,2,3,4,5,6,7 qwen2.5-14b models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt2 exp/hh_qwen14b_exp/data/hh_pponline_rw "pp-exo-rw" 2 models/qwen2.5-14b_hh/sft 3

#4.1
bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt3 4

#4.2
bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline train models/qwen2.5-14b_hh/rm label

#4.3
bash exp/hh_qwen14b_exp/train_pponline.sh 0,1,2,3,4,5,6,7 qwen2.5-14b models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt3 exp/hh_qwen14b_exp/data/hh_pponline_rw "pp-exo-rw" 2 models/qwen2.5-14b_hh/sft 4

#5.1
bash exp/hh_qwen14b_exp/inference_pponline_align_training.sh 0,1,2,3,4,5,6,7 hh/sft:exp/hh_qwen14b_exp/data/hh train models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt4 5

#5.2
bash exp/hh_qwen14b_exp/label_pponline_align_training.sh 0,1,2,3,4,5,6,7 exp/hh_qwen14b_exp/data/hh_pponline train models/qwen2.5-14b_hh/rm label

#5.3
bash exp/hh_qwen14b_exp/train_pponline.sh 0,1,2,3,4,5,6,7 qwen2.5-14b models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt4 exp/hh_qwen14b_exp/data/hh_pponline_rw "pp-exo-rw" 2 models/qwen2.5-14b_hh/sft 5

#inference test

bash exp/hh_qwen14b_exp/inference_align.sh 0,1,2,3,4,5,6,7 models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2

bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7  exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt1 test models/qwen2.5-14b_hh/rm eval

bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7  exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt2 test models/qwen2.5-14b_hh/rm eval

bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7  exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt3 test models/qwen2.5-14b_hh/rm eval

bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7  exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt4 test models/qwen2.5-14b_hh/rm eval

bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2,3,4,5,6,7  exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_pp-exo-rw_nc2/ckpt5 test models/qwen2.5-14b_hh/rm eval

python hh_bash_qwen14b/win_rate_computation.py online_pp-exo-rw