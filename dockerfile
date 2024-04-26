FROM debian:bookworm-slim

#
# #################
# IMAGE INFORMATION
# #################
#

ENV MMDOCS_VERSION='V0.0.1'
ENV MMDOCS_BUILD_DATE='B2024042600'
ENV MMDOCS_IMAGE_MAINTAINER='Norbert EHART (norbert@ehart.net)'

#
# ################
# ENTRYPOINT & CMD
# ################
#

#COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/entrypoint.sh
#
#ENTRYPOINT ["entrypoint.sh"]
#CMD [""]
