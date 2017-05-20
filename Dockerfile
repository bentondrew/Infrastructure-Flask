FROM drewantech/python3:1.1.1
MAINTAINER Benton Drew <benton.s.drew@drewantech.com>
USER root
RUN apk add --no-cache ca-certificates wget gcc python3-dev musl-dev && \
  update-ca-certificates && \
  wget https://pypi.python.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123/Flask-0.12.2.tar.gz#md5=97278dfdafda98ba7902e890b0289177 && \
  tar xvzf Flask-0.12.2.tar.gz && \
  cd Flask-0.12.2/ && \
  python3 setup.py install && \
  cd - && \
  rm -r Flask-0.12.2/ && \
  rm -r /tmp && \
  rm Flask-0.12.2.tar.gz && \
  apk del --no-cache ca-certificates wget gcc python3-dev musl-dev
ADD service/test_hello.py .
ENV FLASK_APP test_hello.py
USER python_user
ENTRYPOINT ["python3", "-m", "flask", "run"]
CMD ["--host=127.0.0.2", "--port=5001"]
