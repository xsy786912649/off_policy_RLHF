# args:
# - 1: device ids
# - 2: model_path


temp=0.8
ref_temp=0.8


# generate
model_path=$2

deepspeed --include "localhost:$1" \
        --master_port 1231 src/align_stage/inference.py \
                        --split test --model_path $model_path \
                        --prompt_num 512 \
                        --return_num 4 \
                        --seed 42 \
                        --temp $temp \
                        --data_name_path imdb/sft:exp/imdb_exp/data/imdb_prefix10 \
                        --max_length 512 \
                        --max_new_tokens 500 \
                        --batch_size 32 \
                        --kernel_inject

#bash exp/imdb_exp/inference_align_sft.sh 0,1 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/gpt2-large_imdb/sft