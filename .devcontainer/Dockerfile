FROM docker.io/zmkfirmware/zmk-dev-arm:3.0

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

ARG UID=1000
ARG GID=1000
ARG USERNAME=dev

RUN echo "UID: ${UID}, GID: ${GID}, USERNAME: ${USERNAME}"

# Update Ubuntu Software repository
RUN apt update --fix-missing && apt -y upgrade

# Install standard tools
RUN apt -y install sudo wget curl git git-lfs iproute2 unzip screen ranger

# Install development tools
RUN apt -y install build-essential make gcc g++ cmake

# Ensure the specified GID exists, creating the group if necessary
RUN if ! getent group ${GID}; then \
      groupadd -g ${GID} ${USERNAME}; \
    else \
      existing_group=$(getent group ${GID} | cut -d: -f1) && \
      groupmod -n ${USERNAME} ${existing_group}; \
    fi

# Ensure the specified UID exists, creating the user if necessary
RUN if ! id -u ${UID}; then \
      useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME}; \
    else \
      existing_user=$(getent passwd ${UID} | cut -d: -f1) && \
      usermod -l ${USERNAME} ${existing_user} && \
      usermod -d /home/${USERNAME} -m ${USERNAME}; \
    fi

# Ensure the user is part of the sudo group and has passwordless sudo
RUN usermod -aG sudo ${USERNAME} && \
    sh -c "echo '${USERNAME} ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/${USERNAME}" && \
    chmod 0440 /etc/sudoers.d/${USERNAME}

COPY .bashrc tmp
RUN mv /tmp/.bashrc /home/${USERNAME}/.bashrc

# Switch to the new user
USER ${USERNAME}

# Set the home directory for the user
ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}

