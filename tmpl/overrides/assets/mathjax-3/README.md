# MathJax 3

MathJax is an open-source JavaScript display engine for LaTeX, MathML, and
AsciiMath notation that works in all modern browsers. It was designed with
the goal of consolidating the recent advances in web technologies into a
single, definitive, math-on-the-web platform supporting the major browsers
and operating systems. It requires no setup on the part of the user (no
plugins to download or software to install), so the page author can write
web documents that include mathematics and be confident that users will be
able to view it naturally and easily. Simply include MathJax and some
mathematics in a web page, and MathJax does the rest. <a href="https://github.com/mathjax/MathJax" target="_blank">[github.com]</a>

Some of the main features of MathJax are. <a href="https://github.com/mathjax/MathJax" target="_blank">[github.com]</a>

- High-quality display of LaTeX, MathML, and AsciiMath notation in HTML pages
- Supported in most browsers with no plug-ins, extra fonts, or special
  setup for the reader
- Easy for authors, flexible for publishers, extensible for developers
- Supports math accessibility, cut-and-paste interoperability, and other
  advanced functionality
- Powerful API for integration with other web applications

See <http://www.mathjax.org> for additional details.

This project is hosted at <https://cdn.ans.co.at/mathjax-3>.

## Template

```code
<!DOCTYPE html>


<html>


    <head>
        <script type="text/javascript" async src="https://cdn.ans.co.at/mathjax-3/es5/tex-mml-chtml.js"> </script>
    </head>

    <body>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing. Nullam fringilla ullamcorper \(E=mc^2\) hasellus pharetra mauris urna.</p>
        <p>Morbi a turpis orci. [...] scelerisque. Ut id orci nibh.</p>
        <p>$$ F = G \frac{{m_1 m_2}}{{r^2}} $$</p>
    </body>


</html>
```