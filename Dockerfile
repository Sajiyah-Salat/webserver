# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json from the webserver directory
COPY webserver/package*.json ./

# Install app dependencies
RUN npm install

# Copy the source code from the webserver directory
COPY webserver .

# Expose the new port
EXPOSE 3000

# Define the command to run the app
CMD ["node", "app.js"]
