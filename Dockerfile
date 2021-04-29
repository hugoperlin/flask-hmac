FROM ubuntu:20.04

RUN apt-get update -y && apt-get install --no-install-recommends -y -q \
        build-essential \
        python3 \
        python3-dev \
        python3-pip \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /src/
ADD . /src/

RUN pip3 install pytest pytest-cov pytest-pep8 pytest-flakes
RUN pip3 install -e .[develop]

CMD ["python3"]
