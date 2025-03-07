#1

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh test models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft test models/pythia-2.8b_hh/rm label

bash exp/hh_exp/train_offline.sh 0,1 pythia-2.8b models/pythia-2.8b_hh/sft exp/hh_exp/data/hh_rw "exo-rw" 2 models/pythia-2.8b_hh/sft 1

#2

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/train_offline.sh 0,1 pythia-2.8b models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt1 exp/hh_exp/data/hh_rw "exo-rw" 2 models/pythia-2.8b_hh/sft 2

#3

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/train_offline.sh 0,1 pythia-2.8b models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt2 exp/hh_exp/data/hh_rw "exo-rw" 2 models/pythia-2.8b_hh/sft 3

#4

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/train_offline.sh 0,1 pythia-2.8b models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt3 exp/hh_exp/data/hh_rw "exo-rw" 2 models/pythia-2.8b_hh/sft 4

#5

bash exp/hh_exp/inference_sft.sh 0,1 hh/sft:exp/hh_exp/data/hh train models/pythia-2.8b_hh/sft

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_sft train models/pythia-2.8b_hh/rm label

bash exp/hh_exp/train_offline.sh 0,1 pythia-2.8b models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt4 exp/hh_exp/data/hh_rw "exo-rw" 2 models/pythia-2.8b_hh/sft 5

#inference test

bash exp/hh_exp/inference_align.sh 0,1 models/pythia-2.8b_hh/align_exo-rw_nc2

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt1 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt2 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt3 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt4 test models/pythia-2.8b_hh/rm eval

bash exp/hh_exp/inference_rm.sh 0,1 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_exo-rw_nc2/ckpt5 test models/pythia-2.8b_hh/rm eval
