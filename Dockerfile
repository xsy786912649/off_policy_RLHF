# ──────────────────────────────────────────────────────────────────────────────
#  Environment for off_policy_RLHF experiments
#
#  Covers:
#    - exact-optimization      (EXO / DPO baselines)
#    - proximal-exact-optimization  (PRPO — Pythia-2.8B/6.9B/8B, GPT2-Large)
#    - Qwen2.5-3B / Qwen2.5-7B experiments (new)
#
#  Key version decision:
#    transformers 4.45.0  — satisfies original ≥4.34.1 requirement AND adds
#                           Qwen2 architecture support (added in 4.40.0,
#                           required for Qwen2.5).  All other APIs used in the
#                           codebase (GPTNeoXLayer, HfDeepSpeedConfig, etc.)
#                           remain available in 4.45.0.
#
#  Base: PyTorch 2.4.1 + CUDA 12.1 + cuDNN 9 (devel = includes nvcc for
#        DeepSpeed CUDA extension compilation)
# ──────────────────────────────────────────────────────────────────────────────
FROM pytorch/pytorch:2.4.1-cuda12.4-cudnn9-devel

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    CUDA_HOME=/usr/local/cuda \
    PATH=/opt/conda/bin:$PATH

# ── System dependencies ───────────────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
        git wget curl vim \
        build-essential \
        libaio-dev \
    && rm -rf /var/lib/apt/lists/*

# ── Python packages ───────────────────────────────────────────────────────────
RUN pip install \
    "transformers==4.45.0" \
    "numpy==1.26.4" \
    "datasets==2.20.0" \
    "tensorboard" \
    "tqdm" \
    "huggingface_hub" \
    "accelerate" \
    "sentencepiece" \
    "tiktoken"

# ── DeepSpeed 0.16.3 with pre-compiled CUDA extensions ───────────────────────
# DS_BUILD_FUSED_ADAM  — FusedAdam / DeepSpeedCPUAdam (used by training scripts)
# DS_BUILD_TRANSFORMER — faster transformer kernels for training
# Requires nvcc provided by the devel base image above.
RUN DS_BUILD_FUSED_ADAM=1 DS_BUILD_TRANSFORMER=1 \
    pip install "deepspeed==0.16.3"

# ── Code is mounted at runtime via -v, not copied ────────────────────────────
WORKDIR /workspace/off_policy_RLHF/proximal-exact-optimization

# ── Smoke-test: verify all key imports resolve correctly ─────────────────────
RUN python - <<'EOF'
import torch, transformers, deepspeed, datasets
from transformers import AutoModelForCausalLM, AutoTokenizer
from transformers.integrations.deepspeed import HfDeepSpeedConfig
print(f"torch        {torch.__version__}")
print(f"transformers {transformers.__version__}")
print(f"deepspeed    {deepspeed.__version__}")
print(f"datasets     {datasets.__version__}")
print(f"CUDA avail   {torch.cuda.is_available()}")
print("All imports OK")
EOF
