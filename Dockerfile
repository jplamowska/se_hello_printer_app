FROM python:2.7
WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /usr/src/hello-world-printer/
ADD hello_world/ /usr/src/hello_worl_printer/hello_world/

ADD main.py /usr/src/hello_world_printer/
RUN ls /usr/src/hello-world-printer

CMD PYTHONPATH=$PYTONPATH:/usr/src/hello_world_printer \FLASK_APP+helo_world flask run --host=0.0.0.0
