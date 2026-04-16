#1

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train models/pythia-2.8b_tldr/sft 1

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr test models/pythia-2.8b_tldr/sft 0

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft train models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft test models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/train_offline.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_tldr/sft exp/tldr_exp/data/tldr_rw "dpo-rw" 2 models/pythia-2.8b_tldr/sft 1

#2

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train models/pythia-2.8b_tldr/sft 2

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft train models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/train_offline.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt1 exp/tldr_exp/data/tldr_rw "dpo-rw" 2 models/pythia-2.8b_tldr/sft 2

#3

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train models/pythia-2.8b_tldr/sft 3

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft train models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/train_offline.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt2 exp/tldr_exp/data/tldr_rw "dpo-rw" 2 models/pythia-2.8b_tldr/sft 3

#4

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train models/pythia-2.8b_tldr/sft 4

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft train models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/train_offline.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt3 exp/tldr_exp/data/tldr_rw "dpo-rw" 2 models/pythia-2.8b_tldr/sft 4

#5

bash exp/tldr_exp/inference_offline_align_training.sh 0,1,2,3 tldr/sft:exp/tldr_exp/data/tldr train models/pythia-2.8b_tldr/sft 5

bash exp/tldr_exp/label_offline_align_training.sh 0,1,2,3 exp/tldr_exp/data/tldr_sft train models/pythia-2.8b_tldr/rm label

bash exp/tldr_exp/train_offline.sh 0,1,2,3 pythia-2.8b models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt4 exp/tldr_exp/data/tldr_rw "dpo-rw" 2 models/pythia-2.8b_tldr/sft 5

#inference test

bash exp/tldr_exp/inference_align.sh 0,1,2,3 models/pythia-2.8b_tldr/align_dpo-rw_nc2

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt1 test models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt2 test models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt3 test models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt4 test models/pythia-2.8b_tldr/rm eval

bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3  models/pythia-2.8b_tldr/align_dpo-rw_nc2/ckpt5 test models/pythia-2.8b_tldr/rm eval

python tldr_bash/win_rate_computation.py dpo-rw