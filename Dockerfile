ARG VERSION=stable
FROM ghcr.io/ovrclk/akash:$VERSION

EXPOSE 8080
EXPOSE 26656
EXPOSE 26657
EXPOSE 1317
EXPOSE 9090

ENV AKASH_NETWORK=mainnet
ENV BOOTSTRAP=1

# Install Akash
RUN apt-get update && apt-get install -y curl wget tar

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

WORKDIR /root/.akash

CMD akash start
