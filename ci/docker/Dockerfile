FROM ruby:2.5.0-stretch

RUN cd opt && \
  curl -o factor.tgz http://downloads.factorcode.org/linux-x86-64/factor-linux-x86-64-2018-01-25-01-49.tar.gz && \
  tar -xvf factor.tgz && \
  rm factor.tgz

ENV PATH="/opt/factor:${PATH}"

CMD ["/opt/factor/factor"]
