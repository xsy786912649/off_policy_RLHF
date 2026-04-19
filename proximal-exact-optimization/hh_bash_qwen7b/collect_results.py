"""
Collect all Qwen2.5-7B Anthropic-HH win rate results.
Usage:
    python hh_bash_qwen7b/collect_results.py
"""
import json, os

INFER_BASE = "exp/hh_qwen7b_exp/data/hh_infer_res/models/qwen2.5-7b_hh"
SFT_EVAL   = f"{INFER_BASE}/sft/eval/test.json"
HH_EVAL    = "exp/hh_qwen7b_exp/data/hh/eval/test.json"

METHODS = [
    ("Offline DPO",      f"{INFER_BASE}/align_dpo-rw_nc2"),
    ("Iterative DPO",    f"{INFER_BASE}/align_online_dpo-rw_nc2"),
    ("Iterative PRPO",   f"{INFER_BASE}/align_online_pp-dpo-rw_nc2"),
    ("Offline EXO",      f"{INFER_BASE}/align_exo-rw_nc2"),
    ("Iterative EXO",    f"{INFER_BASE}/align_online_exo-rw_nc2"),
    ("Iterative PR-EXO", f"{INFER_BASE}/align_online_pp-exo-rw_nc2"),
]


def load(path):
    if not os.path.isfile(path):
        return None
    with open(path) as f:
        return json.load(f)


def win_rates(sft_data, hh_data, ckpt_data):
    n = len(sft_data)
    win_sft = win_hh = mean_r = 0.0
    for s, h, c in zip(sft_data, hh_data, ckpt_data):
        r_sft = [x[0] for x in s["scores_texts"]]
        r_hh  = [x[0] for x in h["scores_texts"]]
        r_c   = [x[0] for x in c["scores_texts"]]
        win_sft += sum(rc >= rs for rc in r_c for rs in r_sft) / (len(r_sft) * len(r_c))
        win_hh  += sum(rc >= max(r_hh) for rc in r_c) / len(r_c)
        mean_r  += sum(r_c) / len(r_c)
    return win_sft / n, win_hh / n, mean_r / n


def main():
    sft_data = load(SFT_EVAL)
    hh_data  = load(HH_EVAL)
    if sft_data is None or hh_data is None:
        print("Missing baseline files. Run setup_baseline.sh first.")

    all_results = {}
    header = f"{'Method':<22} {'Iter':>4}  {'vs SFT(RM)':>10}  {'vs Chosen(RM)':>13}  {'Mean Reward':>11}"
    print(header)
    print("-" * len(header))

    for name, ckpt_dir in METHODS:
        method_results = []
        for i in range(1, 6):
            path = os.path.join(ckpt_dir, f"ckpt{i}", "eval", "test.json")
            ckpt_data = load(path)
            if ckpt_data is None or sft_data is None or hh_data is None:
                print(f"{name:<22} {i:>4}  {'---':>10}  {'---':>13}  {'---':>11}")
                method_results.append(None)
                continue
            n = min(len(sft_data), len(hh_data), len(ckpt_data))
            ws, wh, mr = win_rates(sft_data[:n], hh_data[:n], ckpt_data[:n])
            print(f"{name:<22} {i:>4}  {ws*100:>10.2f}  {wh*100:>13.2f}  {mr:>11.4f}")
            method_results.append({"vs_sft_rm": round(ws*100, 2),
                                   "vs_chosen_rm": round(wh*100, 2),
                                   "mean_reward": round(mr, 4)})
        all_results[name] = method_results
        print()

    out = "hh_bash_qwen7b/results.json"
    with open(out, "w") as f:
        json.dump(all_results, f, indent=2)
    print(f"\nSaved to {out}")


if __name__ == "__main__":
    main()
