deepspeed --include "localhost:$1" \
          --master_port 1239 src/rm_stage/label_offline_train.py \
          --data_path $2 \
          --split $3 \
          --model_path $4 \
          --batch_size 128 \
          --max_length 512 \
          --eval_num -1 \
          --overwrite \
          --mode $5 \