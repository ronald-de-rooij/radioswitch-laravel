FROM ubuntu:20.04
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#RUN export PATH=$PATH:/usr/local/bin