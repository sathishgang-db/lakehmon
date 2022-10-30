# Install Operating system and dependencies
FROM cirrusci/flutter:3.3.0

RUN flutter config --enable-web \
    && sudo apt-get update \
    && sudo apt-get install -y chromium-browser \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && sudo apt-get install -y python3

# Enable flutter web
# RUN flutter channel stable
# RUN flutter upgrade
# RUN flutter config --enable-web


# Copy files to container and build
RUN sudo mkdir -p /app/

COPY . /app/
WORKDIR /app/web
# RUN sudo chown -R flutter:flutter /app/

# RUN flutter clean
# RUN flutter build web

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]