# Pull base image
ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}

# Install tools and libraries
RUN \
    apt update && \
    apt -y install \
        git \
        vim \
        libpq-dev && \

    # Clean package cache
    apt clean

# Install composer
RUN \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer && \
    rm composer-setup.php

# Mount host machine's user
ARG UID
ARG GID
ARG UNAME

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

RUN \
    groupadd -g ${GID} ${UNAME} && \
    useradd -u ${UID} -g ${GID} ${UNAME}

# Change working directory and user
WORKDIR /workspace
USER ${UNAME}
