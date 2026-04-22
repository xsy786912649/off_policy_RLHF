#!/bin/bash
# Prepare TLDR data for all Qwen experiments.
# Downloads both datasets from HuggingFace and runs preprocessing.
# Output lands in exp/tldr_exp/data/tldr and exp/tldr_exp/data/tldr_filtered.
# Run from project root: bash exp/tldr_exp/prepare_data.sh

set -e

DATA_DIR="exp/tldr_exp/data"
mkdir -p "$DATA_DIR"

# ── Step 1: Download raw data ─────────────────────────────────────────────────
if [ ! -d "$DATA_DIR/raw_pref" ]; then
    echo "[1/4] Downloading openai/summarize_from_feedback ..."
    python3 - <<'EOF'
from datasets import load_dataset
import os
ds = load_dataset("openai/summarize_from_feedback", "comparisons")
os.makedirs("exp/tldr_exp/data/raw_pref", exist_ok=True)
ds["train"].to_json("exp/tldr_exp/data/raw_pref/train.json")
ds["validation"].to_json("exp/tldr_exp/data/raw_pref/test.json")
print("Done: raw_pref")
EOF
else
    echo "[1/4] raw_pref already exists, skipping download."
fi

if [ ! -d "$DATA_DIR/raw_filter" ]; then
    echo "[2/4] Downloading UCL-DARK/openai-tldr-filtered ..."
    python3 - <<'EOF'
from datasets import load_dataset
import os
ds = load_dataset("UCL-DARK/openai-tldr-filtered")
os.makedirs("exp/tldr_exp/data/raw_filter", exist_ok=True)
ds["train"].to_json("exp/tldr_exp/data/raw_filter/train.jsonl")
ds["test"].to_json("exp/tldr_exp/data/raw_filter/test.jsonl")
print("Done: raw_filter")
EOF
else
    echo "[2/4] raw_filter already exists, skipping download."
fi

# ── Step 2: Preprocess preference data → tldr/ ───────────────────────────────
if [ ! -d "$DATA_DIR/tldr" ]; then
    echo "[3/4] Running preproc_pref.py ..."
    cd "$DATA_DIR"
    python3 ../../preproc_pref.py raw_pref
    cd - > /dev/null
    # preproc_pref.py writes to ./tldr relative to cwd
    echo "Done: exp/tldr_exp/data/tldr"
else
    echo "[3/4] exp/tldr_exp/data/tldr already exists, skipping."
fi

# ── Step 3: Preprocess filtered SFT data → tldr_filtered/ ────────────────────
if [ ! -d "$DATA_DIR/tldr_filtered" ]; then
    echo "[4/4] Running preproc_filter.py ..."
    cd "$DATA_DIR"
    python3 ../../preproc_filter.py raw_filter
    cd - > /dev/null
    # preproc_filter.py writes to ./tldr_filtered relative to cwd
    echo "Done: exp/tldr_exp/data/tldr_filtered"
else
    echo "[4/4] exp/tldr_exp/data/tldr_filtered already exists, skipping."
fi

echo ""
echo "TLDR data ready:"
echo "  exp/tldr_exp/data/tldr           (preference pairs, train/test)"
echo "  exp/tldr_exp/data/tldr_filtered  (SFT filtered data, train/test)"
