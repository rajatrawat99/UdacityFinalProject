FROM python:3.7.3-stretch

#work dir
WORKDIR /app

#copy source code
COPY . hello.py /app/

# hadolint ignore=DL3013
RUN pip install --upgrade pip --disable-pip-version-check &&\
    pip install --trusted-host pypi.pyton.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "hello.py"]