LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

# ── Step 0: one-time baseline eval (SFT + HH reference) ──────────────────────
bash hh_bash_qwen3b/setup_baseline.sh

# ── Step 1: Offline DPO ───────────────────────────────────────────────────────
bash hh_bash_qwen3b/offline_dpo_rw.sh

# ── Step 2: Iterative DPO ────────────────────────────────────────────────────
bash hh_bash_qwen3b/online_dpo_rw.sh

# ── Step 3: Iterative PRPO (eval already done; skipped) ──────────────────────

# ── Step 4: Offline EXO ──────────────────────────────────────────────────────
bash hh_bash_qwen3b/offline_exo_rw.sh

# ── Step 5: Iterative EXO ────────────────────────────────────────────────────
bash hh_bash_qwen3b/online_exo_rw.sh

# ── Step 6: Iterative PR-EXO ─────────────────────────────────────────────────
bash hh_bash_qwen3b/pponline_exo_rw.sh

# ── Step 7: Collect all results ──────────────────────────────────────────────
python hh_bash_qwen3b/collect_results.py
