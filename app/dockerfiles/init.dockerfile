FROM php
RUN apt-get update && apt-get install -y \
  git \
  zip unzip \
  gettext-base
COPY --from=composer /usr/bin/composer /usr/bin/composer