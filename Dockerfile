# Set this to the version of Atlantis you want to use
ARG atlantis_version=latest
FROM ghcr.io/runatlantis/atlantis:${atlantis_version}

# Set this to the minor version of Infracost CLI you want to use (e.g., v0.9, v0.10)
ARG infracost_version=v0.10

# Install required packages and latest ${cli_version} version of Infracost
RUN apk --update --no-cache add ca-certificates openssl openssh-client curl git jq
RUN \
  curl -s -L "https://infracost.io/downloads/${infracost_version}/infracost-linux-amd64.tar.gz" | tar xz -C /tmp && \
  mv /tmp/infracost-linux-amd64 /usr/bin/infracost

ARG terragrunt_version=v0.42.3

# Install Terragrunt
RUN \
  curl -s -L "https://github.com/gruntwork-io/terragrunt/releases/download/${terragrunt_version}/terragrunt_linux_amd64" >/usr/bin/terragrunt && \
  chmod a+x /usr/bin/terragrunt
