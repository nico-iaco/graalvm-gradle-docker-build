FROM ghcr.io/graalvm/graalvm-ce:ol9-java17-22
WORKDIR /app


# For SDKMAN to work we need unzip & zip
RUN microdnf install -y unzip zip

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install gradle; \
    # Install GraalVM Native Image
    gu install native-image;

RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && gradle --version

RUN native-image --version
