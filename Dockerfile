ARG atlantis_version=v0.22.3
FROM ghcr.io/runatlantis/atlantis:${atlantis_version}

ARG infracost_version=v0.10.16

# Install required packages and Infracost
RUN apk --update --no-cache add ca-certificates openssl openssh-client curl git jq
RUN \
  curl -s -L "https://github.com/infracost/infracost/releases/download/${infracost_version}/infracost-linux-amd64.tar.gz" | tar xz -C /tmp && \
  mv /tmp/infracost-linux-amd64 /usr/bin/infracost

ARG terragrunt_version=v0.43.1

# Install Terragrunt
RUN \
  curl -s -L "https://github.com/gruntwork-io/terragrunt/releases/download/${terragrunt_version}/terragrunt_linux_amd64" >/usr/bin/terragrunt && \
  chmod a+x /usr/bin/terragrunt
