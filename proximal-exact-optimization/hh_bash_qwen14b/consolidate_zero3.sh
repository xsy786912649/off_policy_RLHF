#!/bin/bash
# Usage: bash hh_bash_qwen14b/consolidate_zero3.sh <checkpoint_dir>
# Converts ZeRO-3 sharded checkpoint to a single pytorch_model.bin
CKPT_DIR=$1
echo "=== Consolidating ZeRO-3 checkpoint: $CKPT_DIR ==="
python "$CKPT_DIR/zero_to_fp32.py" "$CKPT_DIR" "$CKPT_DIR/pytorch_model.bin"
echo "=== Done: $CKPT_DIR/pytorch_model.bin ==="
