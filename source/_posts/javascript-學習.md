---
title: javascript 學習
date: 2017-03-22 19:51:16
tags:
  - JavaScript
categories:
  - 學習
---

這一篇文章主要是看 [廖雪峰 - JavaScript教程](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000) 的心得，文章結構會用其章篇照順序來寫。

<!--more-->

## [JavaScirpt 簡介](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014344991049250a2c80ec84cb4861bbd1d9b2c0c2850e000)

簡單來說就是 ECMAScript == JavaScript ，而 JavaScript 因為當初設計的時間因素，產生設計缺陷。



## [快速入門](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143449917624134f5c4695b524e81a581ab5a222b05ec000)

這一篇說明要如何使用 JavaScript 和怎麼編寫，瀏覽器也能編寫 JavaScript 。

> 我認為最好的方法還是安裝 Node.js 。



### [基本語法](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143470025281435e4e03117a74438aaf98c4f7b30b307000)

有二個重點要注意：

* 語句結尾要加 `;` ，語句塊用 `{…}`。
* 注意大小寫。



### [數據類型和變量](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499190108eec0bdf14e704a09935cd112e501e31a000)

對 Number 做比較時，相等運算符 `==` ，有兩種比較運算符：

* `==` 自動轉換數據類型再比較（比較怪異）
* `===` 不會轉換數據類型，數據類型不一致返回 `false` ，如果一致，再比較。



> 所以說用 `===` 比較好。

`NaN` 與其他值都不相等，包括它自己。唯一能判斷 `NaN` 的方法是 `isNaN()` 函數。

另外，浮點數相等比較，由於設計缺陷，過程中會產生誤差。

`null` 表示空值，和 `0` 以及空字符串 `''` 不同， `null` 就是空。

`undefined` 表未定義，通常用來判斷函數參數是否傳遞下有用。

如果變量沒有通過 `var` 申明就被使用，該變量就自動被申明為**全局變量**。為了修補這一缺陷， ECMA 推出了 strict 模式，未使用 `var` 申明變量就使用，將導致運行錯誤。

```javascript
'use strict';
```



> 數據類型這一章，把重點再整理如下：
>
> * 變數使用 `var` 申明。
> * 相等比較請用 `===` ，浮點數不要用相等比較。
> * `null` 為**空**， `undefined` 表**未定義**。



### [字符串](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499203693072018f8878842a9b0011e3ff4e38b6b000)

