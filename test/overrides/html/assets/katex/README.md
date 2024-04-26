# <img src="katex-logo-black.svg" width="130">

KaTeX is a fast and easy-to-use JavaScript library for TeX math rendering on the web. <a href="https://katex.org" target="_blank">[katex.org]</a>

 * It renders its math synchronously and doesn't need to reflow the page.
 * The layout is based on Donald Knuth's TeX, the gold standard for math typesetting.
 * KaTeX has no dependencies and can easily be bundled with your website resources.
 * It produces the same output regardless of browser or environment.
 * It is compatible with all major browsers.
 * KaTeX supports much (but not all) of LaTeX. See the [list of supported functions](https://katex.org/docs/supported.html).

See <https://katex.org> for additional details.

This project is hosted at <https://cdn.ans.co.at/katex>.

## Template

```code
<!DOCTYPE html>


<html>


    <head>
       <link rel="stylesheet" href="https://cdn.ans.co.at/katex/dist/katex.css">
       <script src="https://cdn.ans.co.at/katex/dist/katex.js"></script>
    </head>

    <body>
       <div>
           <p>In nec quam a [...] Donec eleifend egestas finibus.<br><br> 
           <span class="katex"> 

                \begin{aligned} 
                    a(x+b)^2 - ab^2 &= a(x^2 + 2bx + b^2) - ab^2 \\ 
                                    &= ax^2 + 2abx + ab^2 - ab^2 \\ 
                                    &= ax^2 + 2abx               \\
                \end{aligned}

           <span>
           <p>In nec quam a [...] Donec eleifend egestas finibus.<br><br> 
       </div>

       <script>
          document.addEventListener("DOMContentLoaded", function () {
             var element = document.querySelector(".katex");
             katex.render(element.textContent, element);
          });
       </script>
    </body>


</html>
```