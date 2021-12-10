FROM ruby:2.4.2

RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git && gem install bundler

ENV APP_HOME /reddit
RUN mkdir $APP_HOME

COPY reddit/ $APP_HOME
WORKDIR $APP_HOME

EXPOSE 9292

RUN cd /reddit && rm Gemfile.lock && bundle install && \
    chmod 0777 start.sh

CMD ["./start.sh"]
