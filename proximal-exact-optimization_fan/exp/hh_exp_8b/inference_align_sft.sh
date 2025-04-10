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
                        --data_name_path hh/sft:exp/hh_exp_8b/data/hh \
                        --max_length 512 \
                        --max_new_tokens 500 \
                        --max_new_tokens 200 \
                        --batch_size 16 


#bash exp/hh_exp_8b/inference_align_sft.sh 0,1,2,3 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/llama-8b_hh/sft
#bash exp/hh_exp_8b/inference_rm_test.sh 0,1,2,3 /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/llama-8b_hh/sft test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/llama-8b_hh/rm eval
#bash exp/hh_exp_8b/inference_rm_test.sh 0,1,2,3 exp/hh_exp_8b/data/hh test /fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/llama-8b_hh/rm eval
