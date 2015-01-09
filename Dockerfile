# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python3 && pyvenv "NEWPROJ"

ADD . /srv/NEWPROJ/NEWPROJ
RUN cd "NEWPROJ" && source bin/activate && pip3 install -r "NEWPROJ/requirements.txt"


EXPOSE 8000
CMD source /srv/NEWPROJ/bin/activate && \
 /srv/NEWPROJ/NEWPROJ/manage.py runserver 0.0.0.0:8000
