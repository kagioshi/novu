# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml (or package-lock.json) to the container
COPY package.json pnpm-lock.yaml ./

# Install dependencies using pnpm
RUN npm install -g pnpm && pnpm install

# Copy the rest of the application files to the container
COPY . .

# Build the Next.js application
RUN pnpm build

# Expose the port that the application will run on
EXPOSE 3000

# Start the Next.js application
CMD ["pnpm", "start"]
