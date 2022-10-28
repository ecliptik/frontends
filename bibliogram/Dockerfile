FROM node:14-bullseye
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    python3 \
    make \
    g++ \
    graphicsmagick

RUN git clone --depth=1 https://git.sr.ht/~cadence/bibliogram .
RUN npm install

COPY ./config.js .

CMD ["npm", "start"]
