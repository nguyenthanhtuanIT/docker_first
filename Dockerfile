FROM ubuntu:18.04
# Attached information
LABEL author.name="tuannt" \
    author.email="nguyenthanhtuan.15it@gmail.com"

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
ENV APP_PATH /venv
WORKDIR $APP_PATH

# Set the timezone.
ENV TZ=Asia/Ho_Chi_Minh
RUN set -x \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y nginx

RUN apt-get install php7.2

COPY start.sh /venv

RUN set -x \
    && chmod a+x /venv/*

ENTRYPOINT ["/venv/start.sh"]

EXPOSE 80
