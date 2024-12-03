# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /kaur_samanpreet_ui_garden_build_checks

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source files
COPY . .

# Build the component library and the Storybook static site
RUN npm run rollup && npm run build-storybook

# Install a simple HTTP server globally for serving static content
RUN npm install -g http-server

# Expose port 8018 for the HTTP server
EXPOSE 8018

# The default command to run when starting the container
CMD ["http-server", "storybook-static", "-p", "8018"]
