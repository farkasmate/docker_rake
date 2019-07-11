FROM ruby:2.4-alpine
MAINTAINER Mate Farkas <mate.farkas@sch.hu>

RUN gem install \
  bundler \
  rake

ADD bin/rake-wrapper /usr/local/bin/rake-wrapper
ADD bin/--help /usr/local/bin/--help
ADD docker-compose.yaml /docker-compose.yaml

WORKDIR /bundle
CMD /usr/local/bin/rake-wrapper
