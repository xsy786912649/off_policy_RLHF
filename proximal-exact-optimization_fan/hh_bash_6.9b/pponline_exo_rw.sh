#1.1
bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 1 

bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 0

#1.2
bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

#1.3
bash exp/hh_exp_6.9b/train_pponline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft exp/hh_exp_6.9b/data/hh_pponline_rw "pp-exo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 1

#2.1
bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt1 2

#2.2
bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

#2.3
bash exp/hh_exp_6.9b/train_pponline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt1 exp/hh_exp_6.9b/data/hh_pponline_rw "pp-exo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 2 

#3.1
bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt2 3

#3.2
bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

#3.3
bash exp/hh_exp_6.9b/train_pponline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt2 exp/hh_exp_6.9b/data/hh_pponline_rw "pp-exo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 3 

#4.1
bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt3 4

#4.2
bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

#4.3
bash exp/hh_exp_6.9b/train_pponline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt3 exp/hh_exp_6.9b/data/hh_pponline_rw "pp-exo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 4 

#5.1
bash exp/hh_exp_6.9b/inference_pponline_align_training.sh 0,1,2,3 hh/sft:exp/hh_exp_6.9b/data/hh train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt4 5

#5.2
bash exp/hh_exp_6.9b/label_pponline_align_training.sh 0,1,2,3 exp/hh_exp_6.9b/data/hh_pponline train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm label

#5.3
bash exp/hh_exp_6.9b/train_pponline.sh 0,1,2,3 pythia-6.9b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt4 exp/hh_exp_6.9b/data/hh_pponline_rw "pp-exo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/sft 5

#inference test

bash exp/hh_exp_6.9b/inference_align.sh 0,1,2,3 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt1 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt2 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt3 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt4 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

bash exp/hh_exp_6.9b/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/align_online_pp-exo-rw_nc2/ckpt5 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-6.9b_hh/rm eval

python hh_bash_6.9b/win_rate_computation.py online_pp-exo-rw