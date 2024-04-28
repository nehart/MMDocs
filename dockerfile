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

COPY tmpl/styles.scss styles.scss
COPY tmpl/cover.html.j2 /usr/local/share/mmdocs-tmpl/cover.html.j2
COPY tmpl/back_cover.html.j2 /usr/local/share/mmdocs-tmpl/back_cover.html.j2
COPY tmpl/cover.png /usr/local/share/mmdocs-tmpl/cover.png


COPY tmpl/overrides/* /usr/local/lib/python3.12/site-packages/material/templates/

COPY tmpl/pages/index.md /usr/local/share/mmdocs-tmpl/pages/index.md
COPY tmpl/pages/pdf.md /usr/local/share/mmdocs-tmpl/pages/pdf.md

COPY tmpl/overrides_pdf/cover.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/cover.scss
COPY tmpl/overrides_pdf/_fonts.scss /usr/local/lib/python3.12/site-packages/mkdocs_with_pdf/styles/_fonts.scss
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