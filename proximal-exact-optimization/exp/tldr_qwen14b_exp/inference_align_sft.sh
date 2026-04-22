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
                        --data_name_path tldr/sft:exp/tldr_exp/data/tldr \
                        --max_length 650 \
                        --max_new_tokens 75 \
                        --batch_size 16 


#bash exp/tldr_exp/inference_align_sft.sh 0,1,2,3 models/pythia-2.8b_tldr/sft
#bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3 models/pythia-2.8b_tldr/sft test models/pythia-2.8b_tldr/rm eval
#bash exp/tldr_exp/inference_rm_test.sh 0,1,2,3 exp/tldr_exp/data/tldr test models/pythia-2.8b_tldr/rm eval
