FROM     alpine:3.14
LABEL    authors="Corbin <williamcorbinblock@gmail.com>"


# Install Dependencies

RUN     apk --no-cache add --update bash curl git python3 wget lynx openssh tree vim

# Create Python environment
<<<<<<< HEAD
RUN  python3 -m venv /analytics_pipeline/venv

COPY setup_venv.sh count_browsers.py count_visitors.py log_generator.py README.md requirements.txt store_logs.py /analytics_pipeline/
=======

# RUN  cd ~ \
#     git clone git@github.com:dataquestio/analytics_pipeline.git

 RUN  python3 -m venv ~/analytics_pipeline/venv
>>>>>>> 854de62eec8f538acc1c0a672be0b504ef284171
