FROM python:3.7.3-stretch

#work dir
WORKDIR /app

#copy source code
COPY . hello.py /app/

RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.pyton.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "hello.py"]
