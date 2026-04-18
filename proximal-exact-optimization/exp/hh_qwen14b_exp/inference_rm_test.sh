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


# bash exp/hh_qwen14b_exp/inference_rm_test.sh 0,1,2 exp/hh_qwen14b_exp/data/hh_infer_res/models/qwen2.5-14b_hh/align_online_dpo-pref_nc2/ckpt1 test models/qwen2.5-14b_hh/rm eval