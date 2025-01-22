# Start from a minimal Node.js 18 (Alpine) base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json first to leverage Docker layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm i --production

# Copy the rest of the application files
COPY . .

# Define the port the app listens on (matching your code's default of 8080)
EXPOSE 8080

# Set environment variable for the port (optional; your code already defaults to 8080)
ENV PORT=8080

# Command to start the application
CMD ["npm", "start"]
