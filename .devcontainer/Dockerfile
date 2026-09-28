# Official Dev Container image: Git, a non-root `vscode` user, and the
# tooling the VS Code server expects. .NET 8 matches Unity 6's scripting runtime.
FROM mcr.microsoft.com/devcontainers/dotnet:1-8.0-noble

USER root

# The base image ships a Yarn apt source whose signing key is no longer published
# (NO_PUBKEY 62D54FD4003F6525). Drop it so apt-get update can succeed. Yarn is not
# used by this Unity/C# environment.
RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        git \
        ca-certificates \
        curl \
        postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER vscode
