#1

bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

#bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

#bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

bash exp/imdb_exp/train_offline.sh 0 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft exp/imdb_exp/data/imdb_prefix10_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 1

#2

bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

bash exp/imdb_exp/train_offline.sh 0 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt1 exp/imdb_exp/data/imdb_prefix10_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 2

#3

bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

bash exp/imdb_exp/train_offline.sh 0 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt2 exp/imdb_exp/data/imdb_prefix10_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 3

#4

bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

bash exp/imdb_exp/train_offline.sh 0 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt3 exp/imdb_exp/data/imdb_prefix10_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 4

#5

bash exp/imdb_exp/inference_sft.sh 0 imdb/sft:exp/imdb_exp/data/imdb_prefix10 train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft

bash exp/imdb_exp/inference_rm.sh 0 exp/imdb_exp/data/imdb_prefix10_sft train /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/rm label

bash exp/imdb_exp/train_offline.sh 0 gpt2-large /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt4 exp/imdb_exp/data/imdb_prefix10_rw "dpo-rw" 2 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft 5

#inference test

bash exp/imdb_exp/inference_align.sh 0 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/align_dpo-rw_nc2

bash exp/imdb_exp/inference_class.sh 0 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt1 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 0 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt2 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 0 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt3 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 0 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt4 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

bash exp/imdb_exp/inference_class.sh 0 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_dpo-rw_nc2/ckpt5 test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/class eval

