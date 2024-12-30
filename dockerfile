FROM fedora:41

RUN dnf -y update && dnf -y install \
    make \
    gcc \
    gcc-c++ \
    cmake

WORKDIR /app

COPY . .

RUN echo "1.0" && pwd && ls

RUN cmake -B build -S .

WORKDIR /app/build

RUN echo "2" && pwd && ls

RUN make

RUN echo "3" && pwd && ls

CMD ["./howdy"]
