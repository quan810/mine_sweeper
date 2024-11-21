FROM ruby:3.2.2

WORKDIR /app/
RUN apt update && apt install -y vim
COPY ./ /app/
RUN bundle install

EXPOSE 3000
