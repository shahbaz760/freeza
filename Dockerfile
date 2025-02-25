# Step 1: Build the React app
FROM node:20 AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the React app
COPY . .

# Build the React app for production

# Step 2: Set up the backend (Node.js app)
FROM node:20 AS backend

# Set working directory
WORKDIR /app

# Copy the package.json and install dependencies for the backend
COPY package.json package-lock.json ./
RUN npm install

# Copy the backend code
COPY . .

# Copy the built React app from the previous step

# Expose the backend API port
EXPOSE 3000

# Command to run the backend server
CMD ["npm", "start"]

