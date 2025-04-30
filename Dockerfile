# Stage 1: Use the official Nginx image based on Alpine Linux as a base
# Alpine is used for its small size
FROM nginx:stable-alpine

# Set the working directory where Nginx serves files from by default
WORKDIR /usr/share/nginx/html

# Remove the default Nginx welcome page
RUN rm -f index.html

# Copy the static HTML, CSS, and JavaScript files from your repository
# into the Nginx directory inside the container.
# Assumes this Dockerfile is placed in the root of your Tick_Tac_Toe repository checkout.
COPY index.html .
COPY style.css .
COPY script.js .

# Expose port 80 (the default HTTP port Nginx listens on)
EXPOSE 80

# The base Nginx image already has a CMD or ENTRYPOINT to start Nginx
# in the foreground, so we don't need to specify one here.
# Default CMD is typically: ["nginx", "-g", "daemon off;"]
