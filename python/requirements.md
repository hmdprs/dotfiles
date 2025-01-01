# requirements

This document provides an overview of Python packages used across different domains, organized by their primary functionality.

## Table of Contents

- [requirements](#requirements)
  - [Table of Contents](#table-of-contents)
  - [Core Data Science \& Machine Learning](#core-data-science--machine-learning)
  - [Deep Learning \& Neural Networks](#deep-learning--neural-networks)
  - [LLM and AI Agents](#llm-and-ai-agents)
  - [Financial Analysis \& Trading](#financial-analysis--trading)
  - [Development Tools](#development-tools)
  - [Data Collection \& Processing](#data-collection--processing)
  - [Visualization](#visualization)
  - [Web Development \& APIs](#web-development--apis)
  - [Blockchain \& Web3](#blockchain--web3)
  - [Media Processing](#media-processing)

## Core Data Science & Machine Learning

- [numpy](https://github.com/numpy/numpy): Fundamental package for scientific computing with Python, providing support for large, multi-dimensional arrays and matrices
- [pandas](https://github.com/pandas-dev/pandas): Fast, powerful, and flexible data analysis and manipulation library with labeled data structures
- [polars](https://github.com/pola-rs/polars): Lightning-fast DataFrame library with a Python API, written in Rust
- [scikit-learn](https://github.com/scikit-learn/scikit-learn): Machine learning library for classification, regression, clustering, and dimensionality reduction
- [scipy](https://github.com/scipy/scipy): Fundamental algorithms for scientific computing in Python
- [xgboost](https://github.com/dmlc/xgboost): Optimized distributed gradient boosting library for efficient ML
- [lightgbm](https://github.com/Microsoft/LightGBM): High-performance gradient boosting framework based on decision tree algorithms
- [statsmodels](https://github.com/statsmodels/statsmodels): Statistical models, hypothesis tests, and data exploration
- [shap](https://github.com/slundberg/shap): Unified approach to explain machine learning model outputs
- [networkx](https://github.com/networkx/networkx): Creation, manipulation, and study of complex networks
- [sympy](https://github.com/sympy/sympy): Symbolic mathematics and computer algebra system
- [numba](https://github.com/numba/numba): JIT compiler that translates Python and NumPy code into fast machine code
- [metaflow](https://github.com/Netflix/metaflow): Framework for real-life data science projects from prototype to production
- [aim](https://github.com/aimhubio/aim): AI metadata tracker and visualizer for training runs and experiments

## Deep Learning & Neural Networks

- [pytorch-ignite](https://github.com/pytorch/ignite): High-level library for training and evaluating NNs
- [pytorch](https://github.com/pytorch/pytorch): Modern machine learning framework with strong GPU acceleration
- [torchvision](https://github.com/pytorch/vision): Computer vision datasets, models and tools for PyTorch
- [torchaudio](https://github.com/pytorch/audio): Audio datasets and models for PyTorch
- [torchtext](https://github.com/pytorch/text): Text processing tools and datasets for PyTorch
- [huggingface_hub](https://github.com/huggingface/huggingface_hub): Huggingface Hub client to download and publish models
- [transformers](https://github.com/huggingface/transformers): State-of-the-art Natural Language Processing models and tools
- [datasets](https://github.com/huggingface/datasets): The largest hub of ready-to-use datasets for ML models
- [diffusers](https://github.com/huggingface/diffusers): State-of-the-art diffusion models for image, video, and audio generation
- [accelerate](https://github.com/huggingface/accelerate): A simple way to launch, train, and use PyTorch models on any hardware
- [pyg](https://github.com/pyg-team/pytorch_geometric): Library for deep learning on irregular input data like graphs
- [mlx](https://github.com/ml-explore/mlx): Array framework optimized for machine learning on Apple silicon
- [litserve](https://github.com/Lightning-AI/LitServe): Serving engine for any AI model of any size

## LLM and AI Agents

- [openai](https://github.com/openai/openai-python): Official client library for OpenAI's APIs
- [ollama](https://github.com/ollama/ollama-python): Python client for running Ollama models locally
- [autogen](https://github.com/microsoft/autogen): Framework for building multi-agent AI systems
- [phidata](https://github.com/phidatahq/phidata): Build multi-modal Agents with memory, knowledge, tools and reasoning
- [promptflow](https://github.com/microsoft/promptflow): Framework for building and deploying LLM applications
- [swarm](https://github.com/openai/swarm): OpenAI's multi-agent orchestration framework
- [smolagents](https://github.com/huggingface/smolagents): Agents that write python code to call tools and orchestrate other agents
- [atomic-agents](https://github.com/BrainBlend-AI/atomic-agents): Building AI agents, atomically
- [pydantic_ai](https://github.com/pydantic/pydantic-ai): Agent Framework / shim to use Pydantic with LLMs
- [griptape](https://github.com/griptape-ai/griptape): Modular framework for AI agents with chain-of-thought reasoning, tools, and memory
- [langchain](https://github.com/langchain-ai/langchain): Framework for developing applications powered by language models
- [langgraph](https://github.com/langchain-ai/langgraph): Build resilient language agents as graphs
- [crewai](https://github.com/crewaiinc/crewai): Framework for orchestrating role-playing AI agents
- [eliza](https://github.com/elizaOS/eliza): Autonomous agents for everyone (JavaScript package)
- [graphiti](https://github.com/getzep/graphiti): Build dynamic temporally-aware Knowledge Graph for agentic applications
- [lavague](https://github.com/lavague-ai/LaVague): Create AI web agents to automate processes
- [tinytroupe](https://github.com/microsoft/TinyTroupe): LLM-powered multiagent persona simulation for imagination enhancement and business insights
- [praisonai](https://github.com/MervinPraison/PraisonAI): Combine PraisonAI Agents, AutoGen, and CrewAI
- [mirascope](https://github.com/Mirascope/mirascope): Unified interface that works across various LLM providers
- [aisuite](https://github.com/andrewyng/aisuite): Unified interface to multiple LLM providers
- [crawl4ai](https://github.com/unclecode/crawl4ai): Web crawling tailored for LLMs, AI agents, and data pipelines
- [graphrag](https://github.com/microsoft/graphrag): Graph-based RAG (Retrieval Augmented Generation) system
- [instructor](https://github.com/instructor-ai/instructor): Structured outputs for LLMs
- [guidance](https://github.com/guidance-ai/guidance): Control LLMs with structured outputs
- [outlines](https://github.com/dottxt-ai/outlines): Make LLMs generate structured outputs
- [llm-guard](https://github.com/protectai/llm-guard): Security toolkit for LLM applications
- [opik](https://github.com/comet-ml/opik): Evaluate, test and monitor LLM applications
- [routellm](https://github.com/lm-sys/RouteLLM): Serving LLM routers that save costs without compromising quality
- [exo](https://github.com/exo-explore/exo): Run your AI cluster at home with everyday devices
- [open-interpreter](https://github.com/OpenInterpreter/open-interpreter): Lets LLMs run code locally

## Financial Analysis & Trading

- [yfinance](https://github.com/ranaroussi/yfinance): Yahoo! Finance market data downloader
- [fredapi](https://github.com/mortada/fredapi): Python interface to Federal Reserve Economic Data
- [financetoolkit](https://github.com/JerBouma/FinanceToolkit): Efficient Financial Analysis
- [datamule](https://github.com/john-friedman/datamule-python): Work with SEC filings at scale
- [gs-quant](https://github.com/goldmansachs/gs-quant): Python toolkit for quantitative finance
- [financepy](https://github.com/domokane/FinancePy): Pricing and risk-management of Financial Derivatives
- [openbb](https://github.com/OpenBB-finance/OpenBBTerminal): Investment research platform with data from various sources
- [pandas-ta](https://github.com/twopirllc/pandas-ta): Technical Analysis library with 130+ indicators and tools
- [ta](https://github.com/bukosabino/ta): Technical Analysis library using Pandas and NumPy
- [backtesting](https://github.com/kernc/backtesting.py): Backtesting framework for trading strategies
- [bt](https://github.com/pmorissette/bt): Flexible backtesting for Python
- [pomegranate](https://github.com/jmschrei/pomegranate): Probabilistic modeling in Python
- [ccxt](https://github.com/ccxt/ccxt): Cryptocurrency trading library supporting multiple exchanges

## Development Tools

- [pydantic](https://github.com/pydantic/pydantic): Data validation using Python type annotations
- [pytest](https://github.com/pytest-dev/pytest): Feature-rich testing framework
- [ruff](https://github.com/astral-sh/ruff): Extremely fast Python linter and formatter
- [hatch](https://github.com/pypa/hatch): Modern, extensible Python project management
- [tach](https://github.com/gauge-sh/tach): Enforce dependencies
- [python-dotenv](https://github.com/theskumar/python-dotenv): Loads environment variables from .env files
- [joblib](https://github.com/joblib/joblib): Pipeline tools for Python, including parallelization
- [schedule](https://github.com/dbader/schedule): Python job scheduling for humans
- [rich](https://github.com/Textualize/rich): Library for rich text and beautiful formatting
- [jq](https://github.com/mwilliamson/jq.py): Lightweight and flexible JSON processor
- [whenever](https://github.com/ariebovenberg/whenever): Typed and DST-safe datetimes
- [righttyper](https://github.com/RightTyper/RightTyper): Generates types for function arguments and return values
- [marimo](https://github.com/marimo-team/marimo): Modern, reactive Python notebooks as pure code

## Data Collection & Processing

- [scrapy](https://github.com/scrapy/scrapy): Fast and powerful web crawling framework
- [crawlee](https://github.com/apify/crawlee-python): A web scraping and browser automation library
- [snscrape](https://github.com/JustAnotherArchivist/snscrape): Social media scraping tools
- [selenium](https://github.com/SeleniumHQ/selenium): Web browser automation tool
- [docling](https://github.com/DS4SD/docling): Document parsing and conversion to structured formats
- [surya](https://github.com/VikParuchuri/surya): OCR system supporting 90+ languages
- [unisim](https://github.com/google/unisim): Text similarity and fuzzy matching toolkit
- [fasttext](https://github.com/facebookresearch/fastText/): Efficient text classification and representation learning
- [datachain](https://github.com/iterative/datachain): Data versioning and ETL pipeline tool
- [sherlock](https://github.com/sherlock-project/sherlock): Hunt for social media accounts by username
- [fake-useragent](https://github.com/fake-useragent/fake-useragent): Up-to-date useragent faker with real world database
- [pysocks](https://github.com/Anorov/PySocks): SOCKS proxy client and wrapper

## Visualization

- [matplotlib](https://github.com/matplotlib/matplotlib): Comprehensive plotting library for static visualizations
- [plotly](https://github.com/plotly/plotly.py): Interactive visualization library for web-based plots
- [altair](https://github.com/altair-viz/altair): Declarative statistical visualization library
- [mplfinance](https://github.com/matplotlib/mplfinance): Tools for financial market data visualization

## Web Development & APIs

- [fastapi](https://github.com/tiangolo/fastapi): Modern, fast web framework for building APIs
- [requests](https://github.com/psf/requests): Elegant and simple HTTP library
- [streamlit](https://github.com/streamlit/streamlit): Framework for creating data applications
- [gradio](https://github.com/gradio-app/gradio): Create UIs for machine learning models
- [python-telegram-bot](https://github.com/python-telegram-bot/python-telegram-bot): A pure Python, asynchronous interface for the Telegram Bot API
- [supabase](https://github.com/supabase/supabase): Open source Firebase alternative
- [posting](https://github.com/darrenburns/posting): A modern API client that lives in your terminal

## Blockchain & Web3

- [vyper](https://github.com/vyperlang/vyper): Contract-oriented Python-like programming language for EVM
- [eth-brownie](https://github.com/eth-brownie/brownie): Python framework for Ethereum smart contracts
- [hardhat](https://github.com/NomicFoundation/hardhat): Ethereum development environment for smart contracts (JavaScript package)
- [web3.py](https://github.com/ethereum/web3.py): Python interface to Ethereum nodes

## Media Processing

- [Pillow](https://github.com/python-pillow/Pillow): Fork of PIL (Python Imaging Library) with active maintenance
- [yt-dlp](https://github.com/yt-dlp/yt-dlp): Feature-rich YouTube video downloader
- [gallery-dl](https://github.com/mikf/gallery-dl): Command-line program to download image galleries
- [colorthief](https://github.com/fengsp/color-thief-py): Grab color palettes from images
- [redvid](https://github.com/elmoiv/redvid): Reddit video downloader
- [podqueue](https://github.com/tquin/podqueue): Automate podcast feed archiving
- [vcsi](https://github.com/amietn/vcsi): Create video contact sheets
