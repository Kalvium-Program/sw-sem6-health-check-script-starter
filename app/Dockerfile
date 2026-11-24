FROM node:22-bookworm-slim
WORKDIR /app
COPY package.json ./
COPY events.js server.js ./
COPY test ./test
USER node
EXPOSE 3000
CMD ["node", "server.js"]
