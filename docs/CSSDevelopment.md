# CSS Development Tutorial

This tutorial was created by Norbert EHART (norbert@ehart.net) in 2024 under the CC-BY license and is intended to provide information to those working on the `MMDocs` project (with a particular focus on the CSS components).

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
docker compose run --rm --user $(id -u):$(id -g) mkdocs serve --config-file "mkdev.yml" 
```

This will provide a test site that can be accessed via the URL `http://127.0.0.1:8000/`.

By default, the live-reloading feature is enabled, which means that upon the occurrence of a change in the templates, the website will reload automatically and display the updated content immediately.

The `MMDocs` image is configured by default to utilize the `material` theme, which is intended to be exclusively used. If alterations to the HTML source of the `material` theme are desired, the theme must be overridden by using the `custom_dir` option in the `mkdev.yml` configuration file. This should be already in place.

```text
[...]

theme:
  custom_dir: 'overrides'

[...]
```

The structure of the `overrides` directory must mirror exactly the directory structure of the original theme. Any file in the `overrides` directory will replace the file with the same name that is part of the original theme. Furthermore, additional assets may also be placed in the `overrides` directory. The original theme files are available for reference in the `../src` folder.

The CSS files are located in the directory `./overrides/assets/stylesheets`, and they are organized into distinct categories based on their functionalities. The following list provides some examples.

```text
[...]

./overrides/assets/stylesheets/EHARTnet.customCOLORS.css
./overrides/assets/stylesheets/EHARTnet.customFULLBROWSERWIDTH.css
./overrides/assets/stylesheets/EHARTnet.customMDCONTENT.css
./overrides/assets/stylesheets/EHARTnet.customNAV.css
./overrides/assets/stylesheets/EHARTnet.noTOC.css

[...]
```

In the event that it becomes necessary to introduce some new CSS files to the theme without specifying them in the `mkdocs.yml` configuration file, it is necessary to create the `main.html` file within the `overrides` directory and then override the `styles` block. If the intention is to use the original block content while simply adding CSS files before or after, it is possible to use the `{{ super() }}` directive. This provides users with the option of using their own CSS files in addition with the `extra_css` option in the `mkdocs.yml` configuration file. This should also already be in place. The only remaining step is to insert the lines that have been idenitfied as being necessary.

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

The process of modifying or inserting additional CSS content may now begin.

```text
[...]
```

The `dockerfile` is prepared to replace all content in the original `material` theme template with the content in `overrides`. This eliminates the need for users to have the `overrides` directory locally present.

Following the completion of the development process, it is imperative to conduct a localised test.

```text
cd ..
```

```text
docker build --no-cache --file dockerfile --tag registry.ans.co.at/templates/mmdocs/mmdocs:latest .
```

```text
rm -rf test; mkdir test; cd test
```

```text
cp ../compose.yml .
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs bash
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs sh
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs init
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs serve
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs build
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs update
```

```text
docker compose run --rm --user $(id -u):$(id -g) mmdocs clean
```

```text
cd ..; rm -rf test
```

```text
docker image prune --all --force
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

After merging a development branch into the main branch, a new tag associated with the build date must be created. The build date must follow the format `YYYYMMDDXX`. The tag is also used to initiate a pipeline that generates the docker image in the container registry along with a new release.

```text
git tag -a V1.3.1-B2024012100 -m ""
```

```text
git push --tags
```

## Documentation

It is essential that any changes made are documented accordingly to ensure accuracy and consistency.

  * https://gitlab.ans.co.at/templates/mmdocs/-/blob/main/docs/CSSDevelopment.md
