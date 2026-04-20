#!/bin/bash
# Usage: bash hh_bash_qwen14b/consolidate_zero3.sh <checkpoint_dir>
#
# For ZeRO-3 alignment training:
#   save_zero_three_model() gathers ALL parameters and saves the COMPLETE pytorch_model.bin
#   to output_dir/ (the PARENT of ckptN/).
#   save_hf_format() saves config/tokenizer to ckptN/, but its pytorch_model.bin is INCOMPLETE
#   (only rank-0 shard).
#
# Solution: copy the complete weights from the parent dir into the checkpoint subdir.
CKPT_DIR=$1
PARENT_DIR=$(dirname "$CKPT_DIR")
echo "=== Copying ZeRO-3 gathered weights: $PARENT_DIR/pytorch_model.bin -> $CKPT_DIR/pytorch_model.bin ==="
cp "$PARENT_DIR/pytorch_model.bin" "$CKPT_DIR/pytorch_model.bin"
echo "=== Done ==="
