#1.1
bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

#bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

#1.2
bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#1.3
bash exp/imdb_exp/train_online.sh 1 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft exp/imdb_exp/data/imdb_prefix10_online_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 1

#2.1
bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt1

#2.2
bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#2.3
bash exp/imdb_exp/train_online.sh 1 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt1 exp/imdb_exp/data/imdb_prefix10_online_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 2 

#3.1
bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt2

#3.2
bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#3.3
bash exp/imdb_exp/train_online.sh 1 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt2 exp/imdb_exp/data/imdb_prefix10_online_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 3 

#4.1
bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt3

#4.2
bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#4.3
bash exp/imdb_exp/train_online.sh 1 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt3 exp/imdb_exp/data/imdb_prefix10_online_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 4 


#5.1
bash exp/imdb_exp/inference_online_align_training.sh 1 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt4

#5.2
bash exp/imdb_exp/label_online_align_training.sh 1 exp/imdb_exp/data/imdb_prefix10_online train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#5.3
bash exp/imdb_exp/train_online.sh 1 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt4 exp/imdb_exp/data/imdb_prefix10_online_rw "dpo-pref" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 5

#inference test

bash exp/imdb_exp/inference_align.sh 1 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_online_dpo-pref_nc2

bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt1 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt2 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt3 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt4 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_dpo-pref_nc2/ckpt5 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval
