FROM ocaml/opam2

RUN sudo apt update -y --fix-missing \
    && sudo apt upgrade -y

# https://qiita.com/oshuya/items/dd0faa707c5baf54249d#ocaml%E3%82%92%E4%BD%BF%E3%81%84%E3%82%84%E3%81%99%E3%81%8F%E3%81%99%E3%82%8B
RUN sudo apt install -y --no-install-recommends rlwrap
RUN echo 'alias ocaml="rlwrap ocaml"' >> ~/.bashrc

WORKDIR /usr/src/source
