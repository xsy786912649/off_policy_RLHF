deepspeed --include "localhost:$1" \
          --master_port 1234 src/rm_stage/label_online_train.py \
          --data_path $2 \
          --split $3 \
          --model_path $4 \
          --batch_size 128 \
          --mode $5 \
          --max_length 512 \
          --overwrite \
          --eval_num -1 \