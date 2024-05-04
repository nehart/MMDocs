# Development of the CSS

This tutorial is designed for those who wish to contribute to the `MMDocs` development, with a particular focus on the CSS component.

## Clone the Repository

In order to work on the template, it is first necessary to clone this repository.

```text
git pull git@gitlab.ans.co.at:templates/mmdocs.git
```

```text
cd mmdocs
```

## Branches

The stable version of this project is located in the main branch. In order to conduct development work, a new branched should be created. There is no specific naming convention for the development branches.

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

The template used by the docker image is available in the directory `tmpl`.

```text
cd tmpl
```

The development server can be started with the following command.

```text
docker compose run --rm mkdocs serve --config-file "mkdev.yml" --watch "mkdocs.yml" --watch "mkdev.yml" --watch "mkbase.yml" --watch "./overrides_mkdocs_material/" --watch "./overrides_pdf/" 
```

This will provide a test site available on `http://127.0.0.1:8000/` that can be viewed with a browser.

If you want to alter the HTML source of the `material` theme, you need to extend the theme. Enable Material for MkDocs as usual in `mkdev.yml`, and create a new folder for overrides which you then reference using the custom_dir setting:

```text
theme:
  name: 'material'
  custom_dir: 'overrides_mkdocs_material'
```

The structure in the `overrides_mkdocs_material` directory must mirror the directory structure of the original theme, as any file in the `overrides_mkdocs_material` directory will replace the file with the same name which is part of the original theme. Besides, further assets may also be put in the `overrides_mkdocs_material` directory. The original theme is present in the `defaults_mkdocs_material` folder and is used by jinja2 to render then the final HTML files.

If you want to add some CSS files into the theme without specifieng them into `mkdocs.yml` you have to create a `main.html` file inside the `overrides_mkdocs_material` directory and then override the `styles` block. If you want still using the original block content and just add somethin before or after... you can use the `{{ super() }}` directive.

```text
{% extends "base.html" %}

[...]

{% block styles %}
  [...]
  {{ super() }}
  <link rel="stylesheet" href="{{ 'assets/katex/dist/katex.css' | url }}" />
  <link rel="stylesheet" href="{{ 'assets/stylesheets/EHARTnet.customFULLBROWSERWIDTH.css' | url }}" />
  <link rel="stylesheet" href="{{ 'EHARTnet.customHEADERTEXT.css' | url }}" />
  [...]
{% endblock %}

[...]
```

TBC...........

teh docker file is conf to copy ...

```text
vi ../dockerfile
```

```text
[...]

COPY tmpl/overrides_mkdocs_material/ /usr/local/lib/python3.12/site-packages/material/templates/

[...]
```

```text
cd ..
```

## Docker

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
