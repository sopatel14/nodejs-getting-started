# ----------------------
# Stage 1: Builder
# ----------------------
FROM node:22 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# If you had build step (React/TS), it would go here
# RUN npm run build


# ----------------------
# Stage 2: Production image
# ----------------------
FROM node:22-alpine

WORKDIR /app

# Copy only necessary files
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app ./

# Security: non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 5006

CMD ["npm", "start"]
