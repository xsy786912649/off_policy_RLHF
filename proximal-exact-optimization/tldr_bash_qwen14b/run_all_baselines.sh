LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# ── Step 0: one-time baseline eval (SFT + TLDR reference) ────────────────────
bash tldr_bash_qwen14b/setup_baseline.sh

# ── Step 1: Offline DPO ───────────────────────────────────────────────────────
bash tldr_bash_qwen14b/offline_dpo_rw.sh

# ── Step 2: Iterative DPO ────────────────────────────────────────────────────
bash tldr_bash_qwen14b/online_dpo_rw.sh

# ── Step 3: Iterative PRPO ───────────────────────────────────────────────────
bash tldr_bash_qwen14b/pponline_dpo_rw.sh

# ── Step 4: Offline EXO ──────────────────────────────────────────────────────
bash tldr_bash_qwen14b/offline_exo_rw.sh

# ── Step 5: Iterative EXO ────────────────────────────────────────────────────
bash tldr_bash_qwen14b/online_exo_rw.sh

# ── Step 6: Iterative PR-EXO ─────────────────────────────────────────────────
bash tldr_bash_qwen14b/pponline_exo_rw.sh

# ── Step 7: Collect all results ──────────────────────────────────────────────
python tldr_bash_qwen14b/collect_results.py
