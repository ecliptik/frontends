FROM nimlang/nim:1.6.6-regular AS nim
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /src/nitter

RUN apt-get update && apt-get install -y \
  libsass-dev \
  pcre2-utils \
  build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

#Clone repo
RUN git clone --depth=1 https://github.com/zedeus/nitter.git .

#Intall deps
RUN nimble install -y --depsOnly

#Build app
RUN nimble build -d:danger -d:lto -d:strip \
    && nimble scss \
    && nimble md

FROM public.ecr.aws/debian/debian:bullseye-slim AS run
WORKDIR /src/
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  pcre2-utils \
  ca-certificates

#Copy artifaces from base
COPY --from=nim /src/nitter/nitter ./
COPY --from=nim /src/nitter/nitter.example.conf ./nitter.conf
COPY --from=nim /src/nitter/public ./public

EXPOSE 8080
CMD ./nitter
