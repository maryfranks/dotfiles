FROM debian:bookworm-slim

# System essentials, core runtimes, and shell/network utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    zsh \
    git \
    curl \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set Zsh as the default shell
ENV SHELL=/bin/zsh

# Copy the dedicated remote zsh config into place
COPY .zshrc /root/.zshrc

# Install Official Google Gemini CLI via npm
RUN npm install -g @google/gemini-cli

# Install OpenAI Codex CLI via its official standalone script
RUN curl -fsSL https://chatgpt.com/codex/install.sh | sh

# Set working workspace directory
WORKDIR /workspace

# Default entry command drops you into zsh
CMD ["zsh"]