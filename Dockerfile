# start from base

FROM ubuntu:18.04
LABEL maintainer="Your Name <youremailaddress@provider.com>"

RUN yum update -y && \
    yum install -y python-pip python-dev
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /web
RUN pip install -r requirements.txt
COPY . /web
CMD [ "python3", "./web/app.py" ]
