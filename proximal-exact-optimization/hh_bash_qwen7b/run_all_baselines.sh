LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(basename "$0" .sh)_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1
echo "=== $(date) | $(basename "$0") ==="

bash hh_bash_qwen7b/setup_baseline.sh
bash hh_bash_qwen7b/offline_dpo_rw.sh
bash hh_bash_qwen7b/online_dpo_rw.sh
bash hh_bash_qwen7b/pponline_dpo_rw.sh
bash hh_bash_qwen7b/offline_exo_rw.sh
bash hh_bash_qwen7b/online_exo_rw.sh
bash hh_bash_qwen7b/pponline_exo_rw.sh
python hh_bash_qwen7b/collect_results.py
