FROM ruby:3.3.5
RUN mkdir /code
WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /code
