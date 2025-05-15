# Create your Dockerfile
FROM --platform=linux/amd64 python:3.9-slim

# Set the working directory
WORKDIR /app

# Install system dependencies required for psycopg
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["gunicorn", "-w", "1", "-b", "0.0.0.0:5000", "app.run:app"]
