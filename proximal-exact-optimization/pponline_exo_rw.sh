#1.1
bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train models/gpt2-large_imdb/sft

#bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 test models/gpt2-large_imdb/sft

#1.2
bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online train models/gpt2-large_imdb/rm label

#bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online test models/gpt2-large_imdb/rm label

#1.3
bash exp/imdb_exp/train_pponline.sh 2,3 gpt2-large models/gpt2-large_imdb/sft exp/imdb_exp/data/imdb_prefix10_online_rw "pp-exo-rw" 2 models/gpt2-large_imdb/sft 1

#2.1
bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt1

#2.2
bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online train models/gpt2-large_imdb/rm label

#2.3
bash exp/imdb_exp/train_pponline.sh 2,3 gpt2-large models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt1 exp/imdb_exp/data/imdb_prefix10_online_rw "pp-exo-rw" 2 models/gpt2-large_imdb/sft 2 

#3.1
bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt2

#3.2
bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online train models/gpt2-large_imdb/rm label

#3.3
bash exp/imdb_exp/train_pponline.sh 2,3 gpt2-large models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt2 exp/imdb_exp/data/imdb_prefix10_online_rw "pp-exo-rw" 2 models/gpt2-large_imdb/sft 3 

#4.1
bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt3

#4.2
bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online train models/gpt2-large_imdb/rm label

#4.3
bash exp/imdb_exp/train_pponline.sh 2,3 gpt2-large models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt3 exp/imdb_exp/data/imdb_prefix10_online_rw "pp-exo-rw" 2 models/gpt2-large_imdb/sft 4 

#5.1
bash exp/imdb_exp/inference_online_align_training.sh 2,3 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt4

#5.2
bash exp/imdb_exp/label_online_align_training.sh 2,3 exp/imdb_exp/data/imdb_prefix10_online train models/gpt2-large_imdb/rm label

#5.3
bash exp/imdb_exp/train_pponline.sh 2,3 gpt2-large models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt4 exp/imdb_exp/data/imdb_prefix10_online_rw "pp-exo-rw" 2 models/gpt2-large_imdb/sft 5

#inference test

bash exp/imdb_exp/inference_align.sh 2,3 models/gpt2-large_imdb/align_online_pp-exo-rw_nc2

bash exp/imdb_exp/inference_class.sh 2,3 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt1 test models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 2,3 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt2 test models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 2,3 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt3 test models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 2,3 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt4 test models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 2,3 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_pp-exo-rw_nc2/ckpt5 test models/gpt2-large_imdb/class eval
