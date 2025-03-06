
deepspeed --include "localhost:$1" \
    --master_port 2231 src/class_stage/inference_win_rate.py \
    --data_path $2 \
    --split $3 \
    --model_path $4 \
    --sft_data_path $5 \
    --batch_size 64 \
    --mode $6 \
    --max_length 512 \
    --overwrite \
    --kernel_inject \
    --eval_num -1 \
    
# Usage:
#bash exp/imdb_exp/inference_class.sh 1 exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_online_exo-rw_nc2/ckpt5 exp/imdb_exp/data/imdb_prefix10_sft test models/gpt2-large_imdb/class win_rate
