# V0.0.1-B2024042600 // `Configuration File`

There are now 2 configuration files `mkbase.yml` and `mkdocs.yml`. The objective is to consolidate all general settings in `mkbase.yml` (theme settings, used plugins and extensions, additional CSS and JavaScript) and to have the site-specific settings in `mkdocs.yml` (logo, favicon, site_name, site_url, site_author, navigation, etc.). It is also important to note that the file `mkdocs.yml` inherits the file `mkbase.yml`. Accordingly, the sole file that the user is required to manage is the `mkdocs.yml` file.

## `mkbase.yml`

```{ .text linenums="1" }
site_name: '<EDITME>'
site_url: 'https://<EDITME>'


site_author: '<EDITME>'
copyright: 'Written by <br> &ensp;<EDITME> (<EDITME>@<EDITME>.<EDITME>)'


docs_dir: 'pages'
site_dir: 'public'


theme:
  name: 'material'
  logo: 'assets/images/logo.svg'
  favicon: 'assets/images/favicon.png'
  custom_dir: 'overrides/html'
  features:
    - 'navigation.sections'
  palette:
    - scheme: 'default'
      primary: 'blue'
      accent: 'green'
      toggle:
        icon: 'material/brightness-7'
        name: 'Dark Mode'
    - scheme: 'slate'
      primary: 'brown'
      accent: 'green'
      toggle:
        icon: 'material/brightness-4'
        name: 'Light Mode'


nav:
  - 'Introduction': './index.md'


extra:
  generator: false


markdown_extensions:
  - attr_list
  - md_in_html
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - pymdownx.highlight
  - pymdownx.keys
  - pymdownx.blocks.admonition
  - pymdownx.blocks.details
  - pymdownx.blocks.html
  - pymdownx.blocks.tab
  - tables
  - meta
  - pymdownx.tasklist:
      clickable_checkbox: false
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.tabbed:
      alternate_style: true
```

## `mkdocs.yml`

```{ .text linenums="1" }
INHERIT: './mkbase.yml'


theme:
  logo: 'assets/images/logo.svg'
  favicon: 'assets/images/favicon.png'


site_name: '<EDITME>'
site_url: 'https://<EDITME>'


site_author: '<EDITME>'
copyright: 'Written by <br> &ensp;<EDITME> (<EDITME>@<EDITME>.<EDITME>)'


nav:
  - 'Introduction': './index.md'
```

# V0.0.1-B2024042600 // `Introducing Extra CSS`

In the file `mkbase.yml`, an additional CSS file (`./overrides/html/stylesheets/EHARTnet.2024042501.css`) was added.

```{ .text linenums="80" }
extra_css:
  - assets/stylesheets/EHARTnet.2024042501.css
```

# V0.0.1-B2024042600 // `TOC on right side removed`

The table of contents block on the right side was removed via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-sidebar--secondary:not([hidden]) {
    display: none;
  }
}
```

# V0.0.1-B2024042600 // `Introducing KaTeX and MathJax Support`

In order to enable KaTeX and MathJax support, the following libraries was added.

* `./overrides/html/katex/`
* `./overrides/html/mathjax-3/`

This has also required a change in `mkbase.yml`.

```{ .text linenums="50"}
markdown_extensions:
```

```{ .text linenums="70" hl_lines="1-5"}
  - markdown_katex:
      no_inline_svg: False
      insert_fonts_css: True
  - pymdownx.arithmatex:
      generic: true
```

```{ .text linenums="80" hl_lines="2 5-8"}
extra_css:
  - assets/katex/dist/katex.css
  - assets/stylesheets/EHARTnet.2024042501.css

extra_javascript:
  - assets/katex/dist/katex.js
  - assets/katex/dist/contrib/auto-render.js
  - assets/mathjax-3/es5/tex-mml-chtml.js
```

# V0.0.1-B2024042600 // `Extend to full browser `

The complete browser WIDTH is used. via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-grid {
    margin-left: 0mm;
    margin-right: 0mm;
    max-width: 100%;
    }
}
```

# V0.0.1-B2024042600 // `Horiz spacing left title`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  [dir=ltr] .md-header__title {
    margin-left: 0mm;
  }
}
```

# V0.0.1-B2024042600 // `NO PADDING ON THE TOP OF THE SITE`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {

    .md-main__inner {
      margin-top: 0mm;
    }
    
    .md-content__inner:before {
      height: 2.6mm;
    }
    
}
```

# V0.0.1-B2024042600 // `SPACING FROM THE RIGHT SIDE TO THE CONTENT FRAME`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
[dir=ltr] .md-sidebar--secondary:not([hidden])~.md-content>.md-content__inner, [dir=rtl] .md-sidebar--primary:not([hidden])~.md-content>.md-content__inner {
    margin-right: 5.3mm
}
```

# V0.0.1-B2024042600 // `SPACING FROM THE LEFT SIDE TO THE CONTENT FRAME`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
[dir=ltr] .md-sidebar--secondary:not([hidden])~.md-content>.md-content__inner, [dir=rtl] .md-sidebar--primary:not([hidden])~.md-content>.md-content__inner {
    margin-left: 5.3mm
}
```

# V0.0.1-B2024042600 // `HOTIZONTAL SPACE ON SUBSECTION IN THE NAV MENU`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  [dir=ltr] .md-nav__item--section>.md-nav {
    margin-left: 1mm;
  }
}
```

# V0.0.1-B2024042600 // `COLOR OF MD-CONTENT`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {

  [data-md-color-scheme=slate][data-md-color-primary=brown] {
    --md-EHARTnet-content: #343131;
  }

  [data-md-color-scheme=default][data-md-color-primary=blue] {
    --md-default-bg-color: #d6c2c2;
    --md-EHARTnet-content: #ffffff;
  }

  .md-content {
    background: var(--md-EHARTnet-content);
  }

}
```

# V0.0.1-B2024042600 // `EXTEND WIDTH OF NAVIGATION`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-sidebar {
    min-width: 100mm;
  }
}
```

# V0.0.1-B2024042600 // `NO PADDING ON TOP OF NAVIGATION`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-sidebar {
    padding: 5mm 0;
  }
}
```






# V0.0.1-B2024042600 // `HEADING (Level - H1)`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {

  .md-typeset h1 {
    font-size: 2em;
    font-weight: bold;
    line-height: 1.3;
    margin-bottom: -10mm;
  }

  .md-typeset h1::after {
    display: inline-block;
    content: "";
    position: relative;
    border-top: .3rem solid black;
    width: 100%;
    transform: translateY(-1rem);
  }
  
}
```

# V0.0.1-B2024042600 // `HEADING (Level - H2)`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {

  .md-typeset h2 {
    font-size: 1.5625em;
    font-weight: bold;
    line-height: 1.4;
    margin: 10mm 0 -12mm 0;
  }

  .md-typeset h2::after {
    display: inline-block;
    content: "";
    position: relative;
    border-top: .1rem solid black;
    width: 100%;
    transform: translateY(-1rem);
  }
  
}
```

# V0.0.1-B2024042600 // `HEADING (Level - H3)`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-typeset h3 {
    font-size: 1.15em;
    font-weight: bold;
    letter-spacing: -.01em;
    line-height: 1.5;
    margin: 5mm 0 -5mm 0;
  }
}
```

# V0.0.1-B2024042600 // `HEADING (Level - H4)`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
  .md-typeset h4 {
    font-size: 1.15em;
    font-weight: bold;
    letter-spacing: -.01em;
    line-height: 1.5;
    margin: 5mm 0 -5mm 0;
  }
}
```

# V0.0.1-B2024042600 // `ADJUST VERTICAL SPACING AFTER A TABLE`

via the file `./overrides/html/stylesheets/EHARTnet.2024042501.css`.

```{ .text linenums="1" }
@media screen {
    .md-typeset__scrollwrap {
      margin-bottom: -1em;
    }
}
```