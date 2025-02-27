FROM node:20-alpine as base
WORKDIR /app
COPY package*.json ./

FROM base as development
COPY .env.development .env
ENV NODE_ENV=development
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as builder
COPY .env.production .env
ENV NODE_ENV=production
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine as production
COPY --from=builder /app/dist /usr/share/nginx/html
COPY --from=builder /app/.env.production /usr/share/nginx/html/.env
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 