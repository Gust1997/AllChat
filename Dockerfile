FROM debian:bullseye-slim

# Environment variable for Python
ENV PYTHONUNBUFFERED 1

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    postgresql \
    postgresql-contrib \
    nodejs \
    npm \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up a non-root user
RUN useradd -ms /bin/bash gustavo

RUN mkdir -p /var/lib/postgresql/data \
    && chown -R postgres:postgres /var/lib/postgresql/data


# Copy application files
WORKDIR /app
COPY . /app

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Node.js dependencies and build
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Copy PostgreSQL configuration files
COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

# Make the start script executable
RUN chmod +x /app/start.sh

# Expose ports
EXPOSE 8000
EXPOSE 5432

# Set the entrypoint to the start script
CMD ["/app/start.sh"]