FROM node:16-alpine AS build

WORKDIR /usr/src/app

COPY ./app/package*.json ./
RUN npm install

# Second stage for the actual runtime
FROM node:16-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules ./node_modules
COPY ./app .

FROM node:16-alpine

# Install AWS CLI
RUN apk --update add \
    python3 \
    py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install awscli
    RUN aws --version
    RUN echo $PATH
    RUN pip3 install --upgrade awscli



EXPOSE 3000
CMD ["npm", "start"]

