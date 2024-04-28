FROM registry.ans.co.at/docker/mkdocs/mkdocs:latest

#
# #################
# IMAGE INFORMATION
# #################
#

ENV MMDOCS_VERSION='V0.1.1'
ENV MMDOCS_BUILD_DATE='B2024042800'
ENV MMDOCS_IMAGE_MAINTAINER='Norbert EHART (norbert@ehart.net)'

#
# ####
# USER
# ####
#

USER 0:0

#
# #############
# COPY TEMPLATE
# #############
#

COPY tmpl/mkbase.yml /usr/local/share/mmdocs-tmpl/mkbase.yml
COPY tmpl/mkdocs.yml /usr/local/share/mmdocs-tmpl/mkdocs.yml
COPY tmpl/mkpdf.yml /usr/local/share/mmdocs-tmpl/mkpdf.yml

COPY tmpl/styles.scss /usr/local/share/mmdocs-tmpl/styles.scss
COPY tmpl/cover.html.j2 /usr/local/share/mmdocs-tmpl/cover.html.j2
COPY tmpl/back_cover.html.j2 /usr/local/share/mmdocs-tmpl/back_cover.html.j2
COPY tmpl/cover.png /usr/local/share/mmdocs-tmpl/cover.png


COPY tmpl/overrides/* /usr/local/lib/python3.12/site-packages/material/templates/

COPY tmpl/pages/index.md /usr/local/share/mmdocs-tmpl/pages/index.md
COPY tmpl/pages/pdf.md /usr/local/share/mmdocs-tmpl/pages/pdf.md

#
# ################
# ENTRYPOINT & CMD
# ################
#

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD [""]

#
#
#
#

WORKDIR /mnt/