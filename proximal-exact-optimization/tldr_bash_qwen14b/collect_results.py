"""
Collect all Qwen2.5-14B TLDR win rate results.
Reads eval JSON files directly; prints a table and saves results.json.

Usage:
    python tldr_bash_qwen14b/collect_results.py
"""
import json, os

INFER_BASE = "exp/tldr_qwen14b_exp/data/tldr_infer_res/models/qwen2.5-14b_tldr"
SFT_EVAL   = f"{INFER_BASE}/sft/eval/test.json"
TLDR_EVAL  = "exp/tldr_exp/data/tldr/eval/test.json"

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


def win_rates(sft_data, tldr_data, ckpt_data):
    n = len(sft_data)
    win_sft = win_tldr = mean_r = 0.0
    for s, h, c in zip(sft_data, tldr_data, ckpt_data):
        r_sft  = [x[0] for x in s["scores_texts"]]
        r_tldr = [x[0] for x in h["scores_texts"]]
        r_c    = [x[0] for x in c["scores_texts"]]

        w = sum(rc >= rs for rc in r_c for rs in r_sft) / (len(r_sft) * len(r_c))
        win_sft += w

        wh = sum(rc >= max(r_tldr) for rc in r_c) / len(r_c)
        win_tldr += wh

        mean_r += sum(r_c) / len(r_c)

    return win_sft / n, win_tldr / n, mean_r / n


def main():
    sft_data  = load(SFT_EVAL)
    tldr_data = load(TLDR_EVAL)
    if sft_data is None or tldr_data is None:
        print(f"Missing baseline files. Run setup_baseline.sh first.")

    all_results = {}
    header = f"{'Method':<22} {'Iter':>4}  {'vs SFT(RM)':>10}  {'vs Chosen(RM)':>13}  {'Mean Reward':>11}"
    print(header)
    print("-" * len(header))

    for name, ckpt_dir in METHODS:
        method_results = []
        for i in range(1, 6):
            path = os.path.join(ckpt_dir, f"ckpt{i}", "eval", "test.json")
            ckpt_data = load(path)
            if ckpt_data is None or sft_data is None or tldr_data is None:
                print(f"{name:<22} {i:>4}  {'---':>10}  {'---':>13}  {'---':>11}")
                method_results.append(None)
                continue
            n = min(len(sft_data), len(tldr_data), len(ckpt_data))
            ws, wh, mr = win_rates(sft_data[:n], tldr_data[:n], ckpt_data[:n])
            print(f"{name:<22} {i:>4}  {ws*100:>10.2f}  {wh*100:>13.2f}  {mr:>11.4f}")
            method_results.append({"vs_sft_rm": round(ws*100, 2),
                                   "vs_chosen_rm": round(wh*100, 2),
                                   "mean_reward": round(mr, 4)})
        all_results[name] = method_results
        print()

    out = "tldr_bash_qwen14b/results.json"
    with open(out, "w") as f:
        json.dump(all_results, f, indent=2)
    print(f"\nSaved to {out}")


if __name__ == "__main__":
    main()
