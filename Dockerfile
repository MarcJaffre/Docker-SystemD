# Use an official Debian image as the base
FROM debian:latest

# Set the working directory to /app
WORKDIR /app

# Install the necessary packages
RUN apt-get update && \
    apt-get install -y novnc && \
    apt-get clean

# Expose the NoVNC port
EXPOSE 6080

# Run NoVNC when the container starts
CMD ["novnc", "--listen", "6080"]
