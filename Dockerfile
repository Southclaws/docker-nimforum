FROM nimlang/nim

ARG VERSION=2.0.0

WORKDIR /nimforum

RUN apt update && apt install -y libsass-dev sqlite3 && \
    wget https://github.com/nim-lang/nimforum/releases/download/v${VERSION}/nimforum_${VERSION}_linux.tar.xz && \
    tar -xf nimforum_${VERSION}_linux.tar.xz && \
    rm nimforum_${VERSION}_linux.tar.xz && \
    mv nimforum_${VERSION}_linux/* . && \
    rm -rf nimforum_${VERSION}_linux

ADD run.sh /nimforum/run.sh

VOLUME [ "/nimforum/shared" ]

ENTRYPOINT [ "/nimforum/run.sh" ]
