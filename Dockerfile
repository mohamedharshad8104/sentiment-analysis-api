# Use official lightweight Python image
FROM public.ecr.aws/docker/library/python:3.10-slim

# Set work directory inside container
WORKDIR /app

# Copy dependency list first and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flask_cors

# Copy the rest of the application
COPY . .

# Expose the Flask port
EXPOSE 5000

# Start the app
CMD ["python", "-m", "app.app"]
