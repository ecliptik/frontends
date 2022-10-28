# Use LTS Node.js slim image
FROM node:14.17-slim

# Video support dependency
RUN apt-get update && apt-get install -y ffmpeg wget git

# Install NPM dependencies and copy the project
WORKDIR /teddit
RUN git clone --depth=1 https://codeberg.org/teddit/teddit.git .
RUN npm install --no-optional
RUN cp ./config.js.template ./config.js

RUN find ./static/ -type d -exec chmod -R 777 {} \;

CMD npm start
