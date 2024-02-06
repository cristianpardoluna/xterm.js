FROM node:16-bookworm
WORKDIR /app
COPY package.json /app
RUN apt update && \
    apt install -y libc6 sshpass telnet
COPY yarn.lock /app
RUN yarn install
COPY . /app
RUN yarn setup
CMD yarn start
