# Icons and Emojis

A major feature of Material for MkDocs is the ability to use more than ten thousand icons and thousands of emoticons in your project documentation with literally no additional effort. This lines in the `mkdocs.yml` configuration file enables the use of icons and emojis by using simple shortcodes. <a href="https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/#search" target="_blank">[squidfunk.github.io]</a>

/// admonition |
    type: note

```{ .text .copy linenums="102" hl_lines="1-7" }
markdown_extensions:

  - attr_list

  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
```

///

The shortcodes can be discovered through the search form below. <a href="https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/#search" target="_blank">[squidfunk.github.io]</a>

/// admonition |
    type: tip

<div class="mdx-iconsearch" data-mdx-component="iconsearch">
  <input
    class="md-input md-input--stretch mdx-iconsearch__input"
    placeholder="Search the icon and emoji database"
    data-mdx-component="iconsearch-query"
  />
  <div class="mdx-iconsearch-result" data-mdx-component="iconsearch-result">
    <div class="mdx-iconsearch-result__meta"></div>
    <ol class="mdx-iconsearch-result__list"></ol>
  </div>
</div>

///

Icons and Emojis can be integrated in Markdown by putting the shortcode of the emoji between two colons. <a href="https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/#search" target="_blank">[squidfunk.github.io]</a>

/// admonition |
    type: tip

    ## Content

    &nbsp; :material-hand-pointing-right: [The Fundamentals of MkDocs](./the_fundamentals_of_mkdocs/the_fundamentals_of_mkdocs.md) <br>

    &nbsp; :material-hand-pointing-right: [The Docker Image](./docker/the_docker_image.md) <br>
    
///