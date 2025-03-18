deepspeed --include "localhost:$1" \
          --master_port 1241 src/rm_stage/inference.py \
          --data_path $2 \
          --split $3 \
          --model_path $4 \
          --batch_size 128 \
          --max_length 512 \
          --eval_num -1 \
          --overwrite \
          --mode $5 \

# bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh test /oss/zhanghangfan/xsy/proximal-exact-optimization/models/pythia-2.8b_hh/rm eval
# bash exp/hh_exp/inference_rm_test.sh 0,1,2,3 exp/hh_exp/data/hh_infer_res/models/pythia-2.8b_hh/align_online_dpo-pref_nc2/ckpt1 test /oss/zhanghangfan/xsy/proximal-exact-optimization/models/pythia-2.8b_hh/rm eval