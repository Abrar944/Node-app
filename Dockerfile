FROM node:16-alpine

# Install AWS CLI and Docker CLI dependencies
RUN apk --update add \
    python3 \
    py3-pip \
    docker \
    && pip3 install --upgrade pip \
    && pip3 install awscli

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the application code
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]


