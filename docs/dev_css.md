# Development of the CSS

This tutorial is designed for those who wish to contribute to the `MMDocs` image development, with a particular focus on the CSS components.

Norbert EHART (norbert@ehart.net) created this tutorial in 2024 and it is licensed under the CC-BY license.

## Clone the Repository

In order to work on the `MMDocs` image, it is first necessary to clone this repository.

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

## CSS Development

This image uses a template that is available in the directory `tmpl`.

```text
cd tmpl
```

The development server can be started via the following command.

```text
docker compose run --rm mkdocs serve --config-file "mkdev.yml" --watch "mkdocs.yml" --watch "mkdev.yml" --watch "mkbase.yml" --watch "./overrides_mkdocs_material/" --watch "./overrides_pdf/" 
```

This will provide a test site that can be accessed via the URL `http://127.0.0.1:8000/`.

By default, the live-reloading feature is enabled, which means that upon the occurrence of a change in the templates, the website will reload automatically and display the updated content immediately.

The `MMDocs` image is configured by default to utilize the `material` theme, which is intended to be exclusively used. If alterations to the HTML source of the `material` theme are desired, the theme must be overridden by using the `custom_dir` settings in the `mkdev.yml` configuration file. This should be already in place.

```text
[...]

theme:
  custom_dir: 'overrides_mkdocs_material'

[...]
```

The structure of the `overrides_mkdocs_material` directory must mirror exactly the directory structure of the original theme. Any file in the `overrides_mkdocs_material` directory will replace the file with the same name that is part of the original theme. Furthermore, additional assets may also be placed in the `overrides_mkdocs_material` directory. The original theme files are present in the `../src/mkdocs_material` folder.

In the event that it becomes necessary to add some CSS files to the theme without specifying them in the `mkdocs.yml` configuration file, it is necessary to create the `main.html` file within the `overrides_mkdocs_material` directory and then override the `styles` block. If the intention is to use the original block content while simply adding CSS files before or after, it is possible to use the `{{ super() }}` directive. This provides users with the option of using their own CSS files in addition with the `extra_css` directive in the `mkdocs.yml` configuration file.

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

The CSS files are located in the directory `./overrides_mkdocs_material/assets/stylesheets/`, and they are organized into distinct categories based on their functionalities. The following list provides some examples.

```text
[...]

./overrides_mkdocs_material/assets/stylesheets/EHARTnet.customCOLORS.css
./overrides_mkdocs_material/assets/stylesheets/EHARTnet.customFULLBROWSERWIDTH.css
./overrides_mkdocs_material/assets/stylesheets/EHARTnet.customMDCONTENT.css
./overrides_mkdocs_material/assets/stylesheets/EHARTnet.customNAV.css
./overrides_mkdocs_material/assets/stylesheets/EHARTnet.noTOC.css

[...]
```

The `../dockerfile` is prepared to replace all content in the original `material` theme template with the content in `overrides_mkdocs_material`. This eliminates the need for users to have the `overrides_mkdocs_material` directory locally present.

```text
[...]

COPY tmpl/overrides_mkdocs_material/ /usr/local/lib/python3.12/site-packages/material/templates/

[...]
```

The process of modifying or inserting additional CSS content may now begin.

```text
[...]
```

## Docker Image Testing

Following the completion of the development process, it is imperative to conduct a localised testing of the Docker image.

```text
cd ..
```

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
