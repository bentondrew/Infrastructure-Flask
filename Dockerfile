FROM drewantech/python3:1.0.1
MAINTAINER Benton Drew <benton.s.drew@drewantech.com>
USER root
RUN apk add --no-cache ca-certificates wget gcc python3-dev musl-dev && \
  update-ca-certificates && \
  wget https://pypi.python.org/packages/dc/ca/c0ed9cc90c079085c698e284b672edbc1ffd6866b1830574095cbc5b7752/Flask-0.11.tar.gz#md5=89fbdcb04b7b96c5b24625ae299cf48b && \
  tar xvzf Flask-0.11.tar.gz && \
  cd Flask-0.11/ && \
  python3 setup.py install && \
  cd - && \
  rm -r Flask-0.11/ && \
  rm -r /tmp && \
  rm Flask-0.11.tar.gz && \
  apk del --no-cache ca-certificates wget gcc python3-dev musl-dev
ADD service/test_hello.py .
ENV FLASK_APP test_hello.py
USER python_user
CMD ["-m", "flask", "run"]
