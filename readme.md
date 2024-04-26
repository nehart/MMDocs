# Material for `MkDocs`

MkDocs is an open-source documentation generator used to create beautiful and user-friendly documentation websites from plain text files. It simplifies the process of crafting and maintaining documentation, making it an ideal tool for developers, writers, and project managers who want to create well-organized and visually appealing documentation for their projects or products. <a href="https://chat.openai.com/" target="_blank">[openai.com]</a>

This template repository is intended for those who wish to use the MkDocs Material Theme.

It uses a modified `CSS`, and it has been enhanced with the `KaTeX` and `MathJax` JavaScript Library, along with the enabling of several additional extensions. The installation is completely performed through a Docker image, and it is fully compatible with the MkDocs Docker image that is available on <a href="https://gitlab.ans.co.at/docker/mkdocs/container_registry/25" target="_blank">https://gitlab.ans.co.at</a>.

To begin, it is necessary to create a `compose.yml` file within the MkDocs documentation folder. The file should contain the following content.

```text
services:

    mkdocs:
      image: registry.ans.co.at/docker/mkdocs/mkdocs:latest
      restart: 'no'
      pull_policy: 'always'
      network_mode: 'host'
      logging:
        driver: 'journald'
      volumes:
        - './:/mnt'
        - '/etc/timezone:/etc/timezone:ro'
        - '/etc/localtime:/etc/localtime:ro'

    mmdocs:
      image: registry.ans.co.at/templates/mmdocs/mmdocs:latest
      restart: 'no'
      pull_policy: 'always'
      logging:
        driver: 'journald'
      volumes:
        - './:/mnt'
        - '/etc/timezone:/etc/timezone:ro'
        - '/etc/localtime:/etc/localtime:ro'
```

The installation of all the necessary files for MkDocs is performed via the following command.

```text
docker compose run --rm mmdocs init
```

Once you have that, you're ready to start writing your documentation.

```text
docker compose run --rm mkdocs serve
```

```text
docker compose run --rm mkdocs build
```

Norbert EHART (norbert@ehart.net) created this project in 2024 and it is licensed under the CC-BY license.

## Clone the Repository

In order to work on the template, you must first clone this repository.

```text
git pull git@gitlab.ans.co.at:templates/mmdocs.git
```

```text
cd mmdocs
```

## Branches

The stable version of this project is located in the main branch. For development purposes, a new branch should be created. There is no specific naming convention for the development branches.

```text
git branch fix_issue_122
```

```text
git switch fix_issue_122
```

```text
git push --set-upstream origin fix_issue_122
```

## Development

It is important to consider the following files and folders when developing the template.

| Path              | Description                                                                           |
|:------------------|:--------------------------------------------------------------------------------------|
| `./tmpl`          | This folder contains all the materials necessary for the MkDocs project.              |             
| `./dockerfile`    | This file contains the build instructions for creating the Docker image.              |
| `./entrypoint.sh` | This file serves as a starting point for the Docker container when it is initialized. |

Following the completion of the development process, it is imperative to conduct a localised testing of the Docker image.

```text
docker build --no-cache -f dockerfile -t registry.ans.co.at/templates/mmdocs/mmdocs:latest .
```

```text
cd test
```

```text
docker compose run --rm mmdocs bash
```

```text
docker compose run --rm mmdocs sh
```

```text
docker compose run --rm mmdocs init
```

```text
docker compose run --rm mkdocs serve --config-file mkdocs.yml
```

```text
docker compose run --rm mkdocs build --config-file mkdocs.yml
```

```text
docker compose run --rm mkdocs build --config-file mkpdf.yml
```

```text
docker compose run --rm mmdocs clean
```

```text
cd ..
```

## Documentation

When changes are made, we need to make sure that we document those changes when we release a new version.

```text
cd changelog
```

```text
vi pages/index.md
```

```text
docker compose run --rm mkdocs build --config-file mkpdf.yml
```

```text
cd ..
```

## Pushing the Changes

After completing your changes, you can push them to the current branch.

```text
git pull
```

```text
git add .
```

```text
git commit -a -m "."
```

```text
git push
```

Then, you can switch back to the main branch.

```text
git switch main
```

Once the development process is finished, the development branch must be merged into the master branch, and then deleted. The development branch should only be merged if it has been successfully tested.

## Tags and Releases

After merging a development branch into the main branch, a new tag associated with the version number must be created. Tags should follow the format `V{MAJOR_VERSION}.{MINOR_VERSION}.{PATCH_VERSION}-B{BUILD_DATE}` (for example V1.3.1-B2024012100). Tags are also used to trigger a CI/CD pipeline via the `.gitlab-ci.yml` file. Once a new tag is created, the pipeline starts and generates the docker image in the container registry, along with a new release.

```text
git tag -a V1.3.1-B2024012100 -m ""
```

```text
git push --tags
```
