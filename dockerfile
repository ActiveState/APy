
# Copyright (c) 2018 ActiveState Software Inc.
# Released under the BSD-3 license. See LICENSE file for details.

FROM centos:7

WORKDIR /var/tmp

COPY ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834.tar.gz .

# Required for ML libs and numpy to work
RUN yum -y install libgomp
RUN yum -y install libgfortran
RUN yum -y install unixODBC
RUN yum -y install libX11
RUN yum -y install glibc.i686
RUN yum -y install gcc
RUN yum -y install git

RUN tar xf ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834.tar.gz

WORKDIR /var/tmp/ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834

RUN ./install.sh --install-dir /opt/ActivePython-3.6

RUN echo export PATH=/opt/ActivePython-3.6/bin:\$PATH > /etc/profile.d/pythonpath.sh

#cleanup
RUN rm -rf /var/tmp/ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834.tar.gz
RUN rm -rf /var/tmp/ActivePython-3.6.0.3600-linux-x86_64-glibc-2.3.6-401834

ENV PATH /opt/ActivePython-3.6/bin:$PATH

RUN cd /usr/local/bin \
	&& ln -s /opt/ActivePython-3.6/bin/python3 python \
    && ln -s /opt/ActivePython-3.6/bin/pip3 pip

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
RUN git clone --branch v0.1 --recursive https://github.com/daniel-kukiela/nmt-chatbot.git /code/nmt-chatbot/

WORKDIR ~
