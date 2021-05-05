# start from base

FROM ubuntu:18.04
RUN yum update -y && \
    yum install -y python3-pip python-dev
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /web/requirements.txt
WORKDIR /web
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt
COPY . /web
CMD [ "python3", "./web/app.py" ]
