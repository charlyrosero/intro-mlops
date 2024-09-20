# Set the base image to use
FROM python:3.9.15-slim-buster

# Set working directory
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends build-essential

# Copy of our app's requirements file
COPY api/requirements.txt .

# Update pip and install the dependencies in one step to reduce layers
RUN python -m pip install --upgrade pip \
    && pip install  -r requirements.txt


# Copy of folders and files required to run our application
COPY api/ ./api
COPY model/model.pkl ./model/model.pkl
COPY initializer.sh .

# Grant execution permissions to the initializer file
RUN chmod +x initializer.sh

# Ensure gunicorn is in PATH
ENV PATH="/usr/local/bin:${PATH}"

# Expose port 8000 since it is the default used by FastAPI
EXPOSE 8000

# Entry point to start the application
#ENTRYPOINT ["./initializer.sh"]

CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0"]
