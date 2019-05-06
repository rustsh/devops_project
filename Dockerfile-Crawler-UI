FROM python:3.6-alpine

WORKDIR /opt/app/
COPY requirements.txt requirements-test.txt ./
RUN pip install --no-cache-dir -r requirements.txt &&  pip install --no-cache-dir -r requirements-test.txt
COPY . ./
ENV FLASK_APP=ui.py
EXPOSE 8000

CMD [ "/usr/local/bin/gunicorn", "--chdir" ,"ui","-b", "0.0.0.0", "ui:app"]
