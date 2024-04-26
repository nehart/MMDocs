# Release Notes

This document describes all the changes that has been done for the `MkDocs` template.

## TMPL-B2024042503

* This release is based on the `python:3.12.3-bookworm` image.
* The working directory has been altered to `/mnt`. This implies that the `MkDocs` documentation directory must be mounted into this directory when the Docker container is executed.
* The entrypoint script has been introduced in order to support this Docker image with GitLab CICD.