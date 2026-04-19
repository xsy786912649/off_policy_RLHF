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
                        --data_name_path hh/sft:exp/hh_qwen7b_exp/data/hh \
                        --max_length 512 \
                        --max_new_tokens 200 \
                        --batch_size 128


#bash exp/hh_qwen7b_exp/inference_align_sft.sh 0,1,2 models/qwen2.5-7b_hh/sft
#bash exp/hh_qwen7b_exp/inference_rm_test.sh 0,1,2 models/qwen2.5-7b_hh/sft test models/qwen2.5-7b_hh/rm eval
#bash exp/hh_qwen7b_exp/inference_rm_test.sh 0,1,2 exp/hh_qwen7b_exp/data/hh test models/qwen2.5-7b_hh/rm eval
