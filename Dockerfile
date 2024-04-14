# Use a specific version of Python on Alpine for reproducibility. 
FROM python:3.11.9-alpine3.19

# Set the working directory inside the container. 
WORKDIR /app

# Set the environment variable for the port. 
ENV PORT=5000

# Copy the Python requirements file and main application file into the container. 
COPY ["app.py", "requirements.txt", "./"]

# Install dependencies, including any necessary system packages. 
# Note: Add system dependencies required by your Python packages here. 
# RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev && \
#     pip install -r requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application's source code into the container
COPY . .

# Specify the command to run the application. 
# Ensure that Flask uses the port defined in the environment variable. 
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port", "5000"]

# Optional: Add a health check (uncomment the following line to enable). 
# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
#   CMD curl -f http://localhost:$PORT/ || exit 1