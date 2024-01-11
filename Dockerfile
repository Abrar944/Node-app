FROM node:16-alpine AS build

WORKDIR /usr/src/app

COPY ./app/package*.json ./
RUN npm install

# Second stage for the actual runtime
FROM node:16-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules ./node_modules
COPY ./app .

EXPOSE 3000
CMD ["npm", "start"]
