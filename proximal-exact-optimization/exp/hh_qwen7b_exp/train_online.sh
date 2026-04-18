#!/bin/bash

# names and paths
init_model_name=$2
init_model_path=$3
dataset_name=hh/rw
dataset_path=$4
# options: exo-pref/exo-rw
loss_type=$5
num_contrastive=$6
ref_model_path=$7
online_iter=$8
tb_path=tb_logs

dataset_abbr=$( echo $dataset_name | cut -d'/' -f1 )

# general
#train_bsz * grad_accum * num_gpus = 4 * 4 * 8 = 128
#step = number / (train_bsz  * num_gpus)= 43200 / ( 4 * 3 )/5 = 3600/5 = 720
port=1486
train_bsz=16
eval_bsz=16
max_len=512
max_gen_len=200
lr=1e-6
wm_steps=0
eps=1
grad_accum=1
wd=0
ZERO_STAGE=2
num_save_checkpoint=-1
save_step_interval=-1
max_iter_step=-1

# alignment config
beta_r=0.1
beta_pi=0.5
temp=0.8

exp_name=${init_model_name}_${dataset_abbr}/align_online_${loss_type}_nc${num_contrastive}

OUTPUT=models/$exp_name

if [ -d "$OUTPUT" ]; then
    echo "Warning: Directory '$OUTPUT' already exists."
else
    mkdir -p $OUTPUT
fi

# training commands ==================================


deepspeed --include "localhost:$1" --master_port $port \
src/align_stage/train_online.py \
   --model_name_or_path $init_model_path \
   --ref_name_or_path $ref_model_path \
   --beta_r $beta_r \
   --beta_pi $beta_pi \
   --num_contrastive $num_contrastive \
   --online_iter $online_iter \
   --temp $temp \
   --max_iter_step $max_iter_step \
   --save_step_interval $save_step_interval \
   --num_save_checkpoint $num_save_checkpoint \
   --loss_type $loss_type \
   --data_name_path $dataset_name:$dataset_path \
   --data_output_path $dataset_path \
   --output_dir $OUTPUT \
   --enable_tensorboard \
   --tensorboard_name_path $exp_name:$tb_path \
   --per_device_train_batch_size $train_bsz \
   --per_device_eval_batch_size $eval_bsz \
   --max_seq_len $max_len \
   --max_gen_len $max_gen_len \
   --learning_rate $lr \
   --num_warmup_steps $wm_steps \
   --num_train_epochs $eps \
   --gradient_accumulation_steps $grad_accum \
   --weight_decay $wd \
   --gradient_checkpointing \
   --print_loss \
   --zero_stage $ZERO_STAGE \
   --deepspeed 2>&1 | tee -a $OUTPUT/training.log
