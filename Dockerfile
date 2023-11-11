# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory to /code
WORKDIR /code

# Copy the current directory contents into the container at /code
COPY . /code/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y libpq-dev
RUN apt-get update && apt-get install -y postgresql-client
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

