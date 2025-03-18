#1.1
bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft 1

bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh test models/pythia-2.8b_hh/sft 0

#1.2
bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online test models/pythia-2.8b_hh/rm label

#1.3
bash exp/hh_exp/train_online.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_hh/sft exp/hh_exp/data/hh_online_rw "exo-pref" 2 models/pythia-2.8b_hh/sft 1

#2.1
bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt1 2

#2.2
bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online train models/pythia-2.8b_hh/rm label

#2.3
bash exp/hh_exp/train_online.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt1 exp/hh_exp/data/hh_online_rw "exo-pref" 2 models/pythia-2.8b_hh/sft 2 

#3.1
bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt2 3

#3.2
bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online train models/pythia-2.8b_hh/rm label

#3.3
bash exp/hh_exp/train_online.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt2 exp/hh_exp/data/hh_online_rw "exo-pref" 2 models/pythia-2.8b_hh/sft 3 

#4.1
bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt3 4

#4.2
bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online train models/pythia-2.8b_hh/rm label

#4.3
bash exp/hh_exp/train_online.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt3 exp/hh_exp/data/hh_online_rw "exo-pref" 2 models/pythia-2.8b_hh/sft 4 

#5.1
bash exp/hh_exp/inference_online_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt4 5

#5.2
bash exp/hh_exp/label_online_align_training.sh 0,1,2,3 exp/hh_exp/data/hh_online train models/pythia-2.8b_hh/rm label

#5.3
bash exp/hh_exp/train_online.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt4 exp/hh_exp/data/hh_online_rw "exo-pref" 2 models/pythia-2.8b_hh/sft 5

#inference test

bash exp/hh_exp/inference_align.sh 0,1,2,3 models/pythia-2.8b_hh/align_online_exo-pref_nc2

bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt1 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt2 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt3 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt4 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_exo-pref_nc2/ckpt5 test models/pythia-2.8b_hh/rm eval

python hh_bash/win_rate_computation.py online_exo-pref