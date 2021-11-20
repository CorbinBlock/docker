FROM     alpine:3.14
LABEL    authors="Corbin <williamcorbinblock@gmail.com>"


# Install Dependencies

RUN     apk --no-cache add --update bash curl git python3 wget lynx openssh tree vim

# Create Python environment

# RUN  cd ~ \
#     git clone git@github.com:dataquestio/analytics_pipeline.git

 RUN  python3 -m venv ~/analytics_pipeline/venv
