# Use the official PostgreSQL 15 image as the base image
FROM postgres:15

# Set environment variables
# ENV POSTGRES_USER=${DB_USER}
# ENV POSTGRES_PASSWORD=${DB_PASSWORD}

# Copy the init.sql script to the /docker-entrypoint-initdb.d/ directory
COPY init.sql /docker-entrypoint-initdb.d/