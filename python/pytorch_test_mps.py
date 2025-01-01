#!/usr/bin/env python3

# test PyTorch using MPS on Apple Silicon
import torch  # type: ignore

if torch.backends.mps.is_available():
    mps_device = torch.device("mps")
    x = torch.ones(1, device=mps_device)
    print(x)
else:
    print("MPS device not found.")
