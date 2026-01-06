FROM node:24-alpine

WORKDIR /usr/src/app

# Copy package files and install dependencies as root
COPY package*.json ./
RUN npm ci --omit=dev

# Copy rest of the app
COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
