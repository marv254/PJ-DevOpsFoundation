FROM ruby:alpine
LABEL maintainer="Marvin Korir <devopsmarv@gmail.com>"

RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver webdrivers

ENTRYPOINT [ "rspec" ]