FROM ruby:3.1.2
RUN mkdir /code
WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /code
