---
title: D3.js 學習心得
date: 2017-03-30 18:42:30
tags:
  - d3.js
  - JavaScript
categories:
  - 學習
---

今天想說用 Go.js 寫視覺化，但卻有水印。雖然 D3.js 沒辦法在文章中寫入，但寫成普通網頁卻很簡單，而且文章也很多，所以就用 D3.js 。

<!-- more -->

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
</head>
<body>
  <script>
    var dataset = [5, 10, 15, 20, 25];

    d3.select("body").selectAll("p")
        .data(dataset)
        .enter()
        .append("p")
        .text(function(d) { return d;});
  </script>
</body>
</html>
```

<img src="D3-js-學習心得/first.png" height="300px" />

截圖有點不方便（還要調整大小，而且要用 html 標籤）。

重點回歸繪圖：

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
  <style>
    div.bar {
      display: inline-block;
      width: 20px;
      height: 75px;
      background-color: teal;
      margin-right: 2px;
    }
  </style>
</head>
<body>
  <script>
    var dataset = [5, 10, 15, 20, 25];

    d3.select("body").selectAll("div")
        .data(dataset)
        .enter()
        .append("div")
        .attr("class", "bar")
        .style("height", function(d) {
          var barHeight = d * 5;
          return barHeight + "px";
        });
  </script>
</body>
</html>
```

<img src="D3-js-學習心得/2.png" height="200px"/>

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <script type="text/javascript" src="d3.min.js"></script>
  <style>
    div.bar {
      display: inline-block;
      width: 20px;
      height: 75px;
      background-color: teal;
      margin-right: 2px;
    }
  </style>
</head>
<body>
  <script>
    var dataset = [5, 10, 13, 19, 21, 25, 22, 18, 15, 13, 11, 12, 15, 20, 18, 17, 16, 18, 23, 25];

    var w = 500;
    var h = 100;
    var barPadding = 1;

    var svg = d3.select("body")
                .append("svg")
                .attr("width", w)
                .attr("height", h);

    svg.selectAll("rect")
       .data(dataset)
       .enter()
       .append("rect")
       .attr("x", function(d, i) {
         return i * (w / dataset.length);
       })
       .attr("height", function(d) {
         return d * 4;
       })
       .attr("y", function(d) {
         return h - d * 4;
       })
       .attr("width", w / dataset.length - barPadding)
       .attr("fill", function(d) {
         return "rgb(0, 0, " + (d * 10) + ")";
       });

    svg.selectAll("text")
       .data(dataset)
       .enter()
       .append("text")
       .text(function(d) {
         return d;
       })
       .attr("x", function(d, i) {
         return i * (w / dataset.length) + (w / dataset.length - barPadding) / 2;
       })
       .attr("y", function(d) {
         return h - (d * 4) + 14;
       })
       .attr("font-family", "sans-serif")
       .attr("font-size", "11px")
       .attr("fill", "white")
       .attr("text-anchor", "middle");
  </script>
</body>
</html>

```

<img src="D3-js-學習心得/3.png" height="200px" width="70%"/>

原圖有壓縮。