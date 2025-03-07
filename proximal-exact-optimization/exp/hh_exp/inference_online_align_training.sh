deepspeed --include "localhost:$1" \
          --master_port 1234 src/sft_stage/inference_online_train.py \
                            --split $3 --model_path $4 \
                            --data_name_path $2 \
                            --prompt_num -1 \
                            --max_new_tokens 200 \
                            --max_len 512 \
                            --temp 0.8 \
                            --return_num 2 \
                            --batch_size 256 \

                            