FROM ubuntu:20.04

RUN apt-get update -qq

# install RVM https://github.com/rvm/ubuntu_rvm
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN apt-get install -y rvm
RUN echo 'source "/usr/share/rvm/scripts/rvm"' >> ~/.bashrc

#install Ruby, and Bundler
ENV RUBY_VERSION=3.2.0
ENV RUBYGEMS_VERSION=3.3.10
SHELL ["/bin/bash", "-l", "-c"]
RUN rvm requirements
RUN rvm install ${RUBY_VERSION}
RUN rvm use ${RUBY_VERSION}
RUN gem update --system ${RUBYGEMS_VERSION}
ENV PATH "/usr/share/rvm/rubies/ruby-${RUBY_VERSION}/bin:${PATH}"

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y \
    nodejs \
    --no-install-recommends build-essential git libpq-dev libvips pkg-config bash bash-completion tzdata

RUN npm install --global yarn

RUN mkdir /rails
WORKDIR /rails
ADD Gemfile /rails/Gemfile
ADD Gemfile.lock /rails/Gemfile.lock
RUN bundle install