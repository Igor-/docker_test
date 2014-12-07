# Образ, взятый за основу
FROM ubuntu

# установка curl, nodejs
RUN apt-get update -q
RUN apt-get install -qy curl
RUN apt-get install -qy nodejs

# установка RVM, Ruby и Bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.5"
RUN /bin/bash -l -c "rvm use 2.1.5 --default"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# скрипт запуска приложения и добавление прав на его выполнение
ADD config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# добавление проекта в директорию /app
ADD ./ /application
WORKDIR /application

RUN /bin/bash -l -c "bundle install"

# открытие порта для доступа из хоста
EXPOSE 80

# запуск приложения
ENTRYPOINT /usr/bin/start-server
