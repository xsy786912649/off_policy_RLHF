#1.1
bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 1

bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 0

#1.2
bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

#1.3
bash exp/tldr_exp/train_online.sh 0,1,2,3 pythia-2.8b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft exp/tldr_exp/data/tldr_online_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 1

#2.1
bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt1 2

#2.2
bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

#2.3
bash exp/tldr_exp/train_online.sh 0,1,2,3 pythia-2.8b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt1 exp/tldr_exp/data/tldr_online_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 2 

#3.1
bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt2 3

#3.2
bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

#3.3
bash exp/tldr_exp/train_online.sh 0,1,2,3 pythia-2.8b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt2 exp/tldr_exp/data/tldr_online_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 3 

#4.1
bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt3 4

#4.2
bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

#4.3
bash exp/tldr_exp/train_online.sh 0,1,2,3 pythia-2.8b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt3 exp/tldr_exp/data/tldr_online_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 4 


#5.1
bash exp/tldr_exp/inference_online_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt4 5

#5.2
bash exp/tldr_exp/label_online_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm label

#5.3
bash exp/tldr_exp/train_online.sh 0,1,2,3 pythia-2.8b /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt4 exp/tldr_exp/data/tldr_online_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft 5

#inference test

bash exp/tldr_exp/inference_align.sh 0,1,2,3 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt1 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt2 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt3 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt4 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_online_dpo-rw_nc2/ckpt5 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/rm eval

python tldr_bash/win_rate_computation.py online_dpo-rw