FROM alpine:3

# kubectl installation
RUN VERSION=$(wget -q -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl && \
    chmod a+x /usr/local/bin/kubectl

# kubectl-oidc_login installation
ARG KUBELOGIN_VERSION="v1.20.0"
RUN wget -O /tmp/kubelogin_linux_amd64.zip https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip && \
    unzip /tmp/kubelogin_linux_amd64.zip kubelogin -d /tmp && \
    mv /tmp/kubelogin /usr/local/bin/kubectl-oidc_login && \
    chmod a+x /usr/local/bin/kubectl-oidc_login && \
    rm /tmp/kubelogin_linux_amd64.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [ "--help" ]
