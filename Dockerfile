FROM java:8

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Create app directory
RUN mkdir -p /shimmer-app
WORKDIR /shimmer-app

# Bundle app source
COPY . /shimmer-app

EXPOSE 8083
CMD [ "./run-natively.sh" ]
