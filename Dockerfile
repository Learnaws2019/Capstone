# step1
FROM nginx:stable

#step2
COP ./index.html /usr/share/nginx/html/index.html

#FROM python:3.7.3-stretch
## Step 1:
# Create a working directory
#WORKDIR /app
## Step 2:
# Copy source code to working directory
#COP . app.py /app/
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt
## Step 4:
# Expose port 80
#EXPOSE 80
## Step 5:
# Run app.py at container launch
#CMD ["python","app.py"]