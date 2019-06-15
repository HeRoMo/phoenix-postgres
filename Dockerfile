FROM node:12.4-stretch as node

FROM elixir:1.8

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
                inotify-tools \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
ENV YARN_VERSION 1.16.0
RUN mkdir -p /opt
COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
  && chmod +x /usr/local/lib/node_modules/npm/bin/npm-cli.js

# Install Pheonix Framework
RUN mix local.hex --force \
  && mix archive.install hex phx_new 1.4.8 --force