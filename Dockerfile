# Stage 1: Compile the source code in a build image
FROM gcc:12.2 AS builder

# Create a working directory
WORKDIR /app

# Copy the source file
COPY hello.cpp .

# Install FastCGI Dev
RUN apt-get update && apt-get install -y libfcgi-dev && rm -rf /var/lib/apt/lists/*

# Compile the program
RUN g++ hello.cpp -o hello.cgi -lfcgi

# Stage 2: Set up the Nginx server with FastCGI in a lighter image
FROM debian:bookworm-slim

# Install Nginx and fcgiwrap
RUN apt-get update && apt-get install -y nginx fcgiwrap && rm -rf /var/lib/apt/lists/*

# Copy the compiled binary from the build stage
COPY --from=builder /app/hello.cgi /usr/lib/cgi-bin/

# Copy Nginx configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY fcgiwrap.conf /etc/default/fcgiwrap

# Expose port 80
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
