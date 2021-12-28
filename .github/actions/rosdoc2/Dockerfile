FROM python:3

# install apt packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    sudo \
    doxygen \
    graphviz

COPY . .

CMD [ "bash", "-c", "/main.sh"]
