# Material for `MkDocs`

MkDocs is an open-source documentation generator used to create beautiful and user-friendly documentation websites from plain text files. It simplifies the process of crafting and maintaining documentation, making it an ideal tool for developers, writers, and project managers who want to create well-organized and visually appealing documentation for their projects or products. <a href="https://chat.openai.com/" target="_blank">[openai.com]</a>

This template repository is intended for those who wish to use the MkDocs Material Theme.

It uses a modified `CSS`, and it has been enhanced with the `KaTeX` and `MathJax` JavaScript Library, along with the enabling of several additional extensions. The installation is completely performed through a Docker image, and it is fully compatible with the MkDocs Docker image that is available on <a href="https://gitlab.ans.co.at/docker/mkdocs/container_registry/25" target="_blank">[https://gitlab.ans.co.at]</a>.

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

There is a detailed tutorial available on <a href="https://nehart.ans.co.at/writing/mkdocs/TMPL_MMDOCs/" target="_blank">[https://nehart.ans.co.at/writing]</a>.

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

## Development (Theme)

The development server can be started with the following command.

```text
cd tmpl
```

```text
docker compose run --rm mkdocs serve --config-file "mkdev.yml" --watch "mkdocs.yml" --watch "mkdev.yml" --watch "mkbase.yml" --watch "./overrides_mkdocs_material/"
```

This will provide a test site available on `http://127.0.0.1:8000/` that can be viewed with a browser.

If you want to alter the HTML source (e.g. add or remove some parts), you can extend the theme. Enable Material for MkDocs as usual in `mkdocs.yml`, and create a new folder for overrides which you then reference using the custom_dir setting:

```text
theme:
  name: 'material'
  custom_dir: 'overrides/html'
```

The structure in the 'overrides/html' directory must mirror the directory structure of the original theme, as any file in the 'overrides/html' directory will replace the file with the same name which is part of the original theme. Besides, further assets may also be put in the 'overrides/html' directory. The original theme is present in the `defauls/html` folder and is used by jinja2 to render then the final HTML files.

For example, if you want to add some CSS files into the theme without specifieng them into `mkdocs.yml` you have to create a `main.html` file inside the `overrides/html` directory and then override the `styles` block. If you want still using the original block content and just add somethin before or after... you can use the `{{ super() }}` directive.

```text
{% extends "base.html" %}

{% block styles %}
  {{ super() }}
  <link rel="stylesheet" href="{{ 'assets/katex/dist/katex.css' | url }}" />
  <link rel="stylesheet" href="{{ 'assets/stylesheets/EHARTnet.2024042501.css' | url }}" />
{% endblock %}
```

If you want to add some CSS files into the theme without specifieng them into `mkdocs.yml` you have to create a `main.html` file inside the `overrides/html` directory and then override the `scripts` block.

```text
{% extends "base.html" %}

{% block styles %}
  {{ super() }}
  <link rel="stylesheet" href="{{ 'assets/katex/dist/katex.css' | url }}" />
  <link rel="stylesheet" href="{{ 'assets/stylesheets/EHARTnet.2024042501.css' | url }}" />
{% endblock %}

{% block scripts %}
  <script src="{{ 'assets/katex/dist/katex.js' | url }}"></script>
  <script src="{{ 'assets/katex/dist/contrib/auto-render.js' | url }}"></script>
  <script src="{{ 'assets/mathjax-3/es5/tex-mml-chtml.js' | url }}"></script>
  <script src="{{ 'assets/javascripts/custom.2292dd96.min.js' | url }}"></script>
  {{ super() }}
  <script src="{{ 'assets/javascripts/ContentHeight.js' | url }}"></script>
{% endblock %}
```

TBC...........

```text
docker compose run --rm mmdocs serve --config-file "mkdev.yml"
```

```text
docker compose run --rm mmdocs build --config-file "mkdev.yml"
```

```text
cd ..
```

## Development (Image)

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
docker compose run --rm mmdocs serve --config-file mkdocs.yml
```

```text
docker compose run --rm mmdocs build --config-file mkdocs.yml
```

```text
docker compose run --rm mmdocs build --config-file mkpdf.yml
```

```text
docker compose run --rm mmdocs update
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
