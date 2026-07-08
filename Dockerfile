FROM jenkins/jenkins:lts

USER root

# Install Git
RUN apt-get update && \
    apt-get install -y git ca-certificates curl gnupg && \
    apt-get clean

# Add Docker's official GPG key
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
  > /etc/apt/sources.list.d/docker.list

# Install Docker CLI only
RUN apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean

USER root