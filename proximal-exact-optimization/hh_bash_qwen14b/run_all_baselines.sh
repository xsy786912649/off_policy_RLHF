LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

bash hh_bash_qwen14b/setup_baseline.sh
bash hh_bash_qwen14b/offline_dpo_rw.sh
bash hh_bash_qwen14b/online_dpo_rw.sh
bash hh_bash_qwen14b/pponline_dpo_rw.sh
bash hh_bash_qwen14b/offline_exo_rw.sh
bash hh_bash_qwen14b/online_exo_rw.sh
bash hh_bash_qwen14b/pponline_exo_rw.sh
python hh_bash_qwen14b/collect_results.py
