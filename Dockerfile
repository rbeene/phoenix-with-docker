# Elixir 1.5.2: https://hub.docker.com/_/elixir/
FROM elixir:1.5.2
ENV DEBIAN_FRONTEND=noninteractive

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Install NodeJS 7.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y -q nodejs

# Set /app as workdir
RUN mkdir /app
ADD . /app
WORKDIR /app
