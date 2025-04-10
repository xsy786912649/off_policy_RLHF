#1

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 1

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 0

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label 

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/train_offline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft exp/hh_exp_6.9b/data/hh_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 1

#2

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 2

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/train_offline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt1 exp/hh_exp_6.9b/data/hh_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 2

#3

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 3

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/train_offline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt2 exp/hh_exp_6.9b/data/hh_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 3

#4

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 4

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/train_offline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt3 exp/hh_exp_6.9b/data/hh_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 4

#5

bash exp/hh_exp_6.9b/inference_offline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 5

bash exp/hh_exp_6.9b/label_offline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/train_offline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt4 exp/hh_exp_6.9b/data/hh_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 5

#inference test

bash exp/hh_exp_6.9b/inference_align.sh 0,1,2,3 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt1 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt2 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt3 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt4 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_dpo-pref_nc2/ckpt5 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

python hh_bash/win_rate_computation.py dpo-pref