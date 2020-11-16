FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y

# OS Tools that are useful
RUN apt install curl -y
RUN apt install vim -y

# Python requirements
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip3 install boto3

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# The rust install creates this entry in .profile, but that is not run by docker
RUN echo 'export PATH=$HOME/.cargo/bin:$PATH' >> $HOME/.bashrc