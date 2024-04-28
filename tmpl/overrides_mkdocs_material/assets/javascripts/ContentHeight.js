// width and height in pixels,

let MainBox = document.querySelector('main.md-main');
var MainBoxHeight = MainBox.clientHeight;
var MainBoxActualHeight = MainBoxHeight-78

//console.log({ MainBoxActualHeight });

let Content = document.querySelector('article.md-content__inner');
var ContentHeight = Content.clientHeight;

//console.log({ ContentHeight });

// var hua = document.getElementsByClassName("md-content__inner");
// //hua.style.marginBottom = "400px";
// haha = hua[0]
// //console.log({ haha });

// haha.style.marginBottom = "800px";

var hua = document.getElementsByClassName("md-content__inner")[0];
//hua.style.marginBottom = "800px";

if (window.matchMedia("screen").matches == true) {
    if (ContentHeight <= MainBoxActualHeight) {
        fill = MainBoxHeight - ContentHeight
        hua.style.marginBottom = fill-1+"px";
    }
}

//
// fill out the content article if article content (markdown content is smaller than the actual browser height)
// otherwise the right side (content) is not filled completely with the different color!
//