# Use an official Nginx base image
FROM nginx:latest

# Copy our app into the Nginx web root
COPY app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
