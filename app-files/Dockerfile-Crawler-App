FROM python:3.6-alpine

WORKDIR /opt/app/
COPY requirements.txt requirements-test.txt ./
RUN pip install --no-cache-dir -r requirements.txt &&  pip install --no-cache-dir -r requirements-test.txt
COPY . ./

ENV CHECK_INTERVAL 10
ENV EXCLUDE_URLS '.*github.com'
EXPOSE 8000

CMD ["python", "-u", "crawler/crawler.py", "https://vitkhab.github.io/search_engine_test_site/"]
