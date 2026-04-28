# Base Image

FROM  node:22-alpine

# Working directory

WORKDIR /app

# Copy the code from your host to container

COPY . .

# Run the Dependencies

RUN npm install

# Expose the code

EXPOSE 5006

# Serve the application

CMD ["npm","start"]
