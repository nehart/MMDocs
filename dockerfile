FROM registry.ans.co.at/docker/mkdocs/mkdocs:latest

#
# #################
# IMAGE INFORMATION
# #################
#

ENV MMDOCS_VERSION='V0.1.1'
ENV MMDOCS_BUILD_DATE='B2024042900'
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

COPY tmpl/overrides_mkdocs_material/ /usr/local/lib/python3.12/site-packages/material/templates/

COPY tmpl/pages/index.md /usr/local/share/mmdocs-tmpl/pages/index.md
COPY tmpl/pages/cover.png /usr/local/share/mmdocs-tmpl/pages/cover.png
COPY tmpl/pages/favicon.png /usr/local/share/mmdocs-tmpl/pages/favicon.png
COPY tmpl/pages/logo.svg /usr/local/share/mmdocs-tmpl/pages/logo.svg

COPY tmpl/overrides_pdf/cover.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/cover.scss
COPY tmpl/overrides_pdf/fonts.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/_fonts.scss
COPY tmpl/overrides_pdf/heading.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/_heading.scss
COPY tmpl/overrides_pdf/paging.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/_paging.scss
COPY tmpl/overrides_pdf/toc.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/_toc.scss

COPY tmpl/overrides_pdf/cover.html.j2 /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/templates/default_cover.html.j2
COPY tmpl/overrides_pdf/back_cover.html.j2 /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/templates/default_back_cover.html.j2

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