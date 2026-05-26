# Stage 1: Build tex-fmt with Rust
FROM rust:slim AS builder
RUN cargo install tex-fmt

# Stage 2: Main Dev Environment
FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install basic dependencies needed for latex and general compilation
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        wget curl perl libcrypt1 xz-utils make git fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up TinyTeX globally
ENV PATH="/opt/TinyTeX/bin/x86_64-linux:${PATH}"

# Install TinyTeX as root so it's globally available
RUN curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh \
    && mv ~/.TinyTeX /opt/TinyTeX \
    && /opt/TinyTeX/bin/*/tlmgr path add \
    && tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet

# Copy the packages file and install LaTeX dependencies
COPY latex-packages.txt /tmp/
RUN tlmgr install $(grep -v '^\s*$' /tmp/latex-packages.txt | grep -v '^#' | tr '\n' ' ') \
    && tlmgr path add \
    && rm -f /tmp/latex-packages.txt

# Copy tex-fmt from the builder stage
COPY --from=builder /usr/local/cargo/bin/tex-fmt /usr/local/bin/tex-fmt

# Ensure /opt/TinyTeX is writable by everyone so the 'vscode' user can install more packages if needed
RUN chmod -R 777 /opt/TinyTeX

# Set the default user to vscode (created by the devcontainers base image)
USER vscode
WORKDIR /workspace
