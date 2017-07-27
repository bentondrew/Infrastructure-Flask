FROM drewantech/python3:2.0.0
MAINTAINER Benton Drew <benton.s.drew@drewantech.com>
USER root
RUN pip3 install Flask
ADD service/server.py .
ENV FLASK_APP server.py
USER python_user
ENTRYPOINT ["python3", "-m", "flask", "run"]
CMD ["--host=127.0.0.2", "--port=5001"]
