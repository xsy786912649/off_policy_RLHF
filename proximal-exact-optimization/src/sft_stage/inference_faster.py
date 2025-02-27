from vllm import LLM, SamplingParams
from transformers import AutoTokenizer
from utils.data.data_utils import get_raw_dataset
from utils.utils import get_tokenizer
import argparse
import json
import os
import torch
import tqdm
import sys

sys.path.append(
    os.path.abspath(os.path.join(os.path.dirname(__file__), os.path.pardir)))

from data import SFTDataset
from utils.utils import get_tokenizer

# Remove unused imports and keep necessary ones

def parse_args():
    # Keep the same argument parser
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_path", type=str, default=None, required=True)
    parser.add_argument("--data_name_path", type=str, default="imdb/sft:imdb_exp/data/imdb_prefix10", help="name:path")
    parser.add_argument("--local_rank", type=int, help="deepspeed cmdline var")  # Might not be needed
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--dtype", type=str, default="half", help="vLLM uses 'half' for fp16")  # Changed
    parser.add_argument("--split", type=str, default="test")
    parser.add_argument("--batch_size", type=int, default=4)  # vLLM auto-batches
    parser.add_argument("--max_length", type=int, default=512)
    parser.add_argument("--max_new_tokens", type=int, default=200)
    parser.add_argument("--top_k", type=int, default=0)
    parser.add_argument("--temp", type=float, default=1.0)
    parser.add_argument("--return_num", type=int, default=4)
    parser.add_argument("--prompt_num", type=int, default=-1)
    # Remove kernel_inject as vLLM handles optimization
    return parser.parse_args()

def get_data_path(args):
    return args.data_name_path.split(":")[1]

def main():
    args = parse_args()

    # Set seed (vLLM handles randomness internally)
    torch.manual_seed(args.seed)

    # Prepare save path (same as original)
    save_path = get_data_path(args).rstrip("/") + f"_sft"
    os.makedirs(save_path, exist_ok=True)

    # Load dataset (same as original)
    raw_dataset = get_raw_dataset(args.data_name_path, args.seed, args.local_rank)
    if args.split == "test":
        inference_samples = raw_dataset.get_eval_data()
    else:
        inference_samples = raw_dataset.get_train_data()
    
    if args.prompt_num == -1:
        args.prompt_num = len(inference_samples)
    inference_samples = inference_samples[:args.prompt_num]
    print(f"Number of prompts: {len(inference_samples)}")

    # Extract raw prompts
    prompts = [sample["prompt"] for sample in inference_samples]

    # Initialize vLLM
    llm = LLM(
        model=args.model_path,
        tensor_parallel_size=int(os.getenv("WORLD_SIZE", 1)),
        dtype=args.dtype,
        max_model_len=args.max_length
    )

    # Set sampling parameters
    sampling_params = SamplingParams(
        temperature=args.temp,
        top_k=args.top_k,
        max_tokens=args.max_new_tokens,
        n=args.return_num,
        skip_special_tokens=True,  # Assuming original does this
        include_prompt=False  # Match return_full_text=False
    )

    # Generate all outputs
    outputs = llm.generate(prompts, sampling_params)

    # Format results
    res = []
    for output in outputs:
        res.append({
            "prompt": output.prompt,
            "completions": [completion.text for completion in output.outputs]
        })

    # Save results (same as original)
    print(f"Saving results to {save_path}")
    with open(os.path.join(save_path, args.split + ".json"), "w") as f:
        json.dump(res, f, indent=4)

if __name__ == "__main__":
    main()