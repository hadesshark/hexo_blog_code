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

<br>

## [JavaScirpt 簡介](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014344991049250a2c80ec84cb4861bbd1d9b2c0c2850e000)

簡單來說就是 ECMAScript == JavaScript ，而 JavaScript 因為當初設計的時間因素，產生設計缺陷。

<br>

## [快速入門](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143449917624134f5c4695b524e81a581ab5a222b05ec000)

這一篇說明要如何使用 JavaScript 和怎麼編寫，瀏覽器也能編寫 JavaScript 。

> 我認為最好的方法還是安裝 Node.js 。

<br/>

### [基本語法](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143470025281435e4e03117a74438aaf98c4f7b30b307000)

有二個重點要注意：

* 語句結尾要加 `;` ，語句塊用 `{…}`。
* 注意大小寫。


<br>


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

<br>

### [字符串](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499203693072018f8878842a9b0011e3ff4e38b6b000)

多行字符串

```javascript
`這是一個
多行
字符串`;
```

上面行最新的 ES6 新增的一種多行字符串表示方法。

字符串是不可變的，如果對字符串的某個索引賦值，不會有任何錯誤，也沒有任何效果。



> 這一章重要的就兩點：
>
> * 多行字符串
> * 字符串不可變

<br>

### [數組](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143449921138898cdeb7fc2214dc08c6c67827758cd2f000)

`Array` 可變，越界訪問索引不會報錯，但不建議直接修改其大小。



`join` 它把當前 `Array` 每個元素都用指定字符串連接起來，返回連接後的字符串。

```javascript
var arr = ['A', 'B', 'C', 1, 2, 3];
arr.join('-'); // 'A-B-C-1-2-3'
```

如果 `Array` 的元素不是字符串，將自動轉換為字符串後再連接。



> 數組由於可變，所以有很多增加、刪除、插入的方法來調用。

<br>

### [對象（物件）](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143449922400335c44d4b8c904ff29a78fd4334347131000)

```javascript
var xiaoming = {
  name: '小明',
  birth: 1990,
  school: 'No.1 Middle School',
  height: 1.70,
  weight: 65,
  score: null
};
```

上面有幾點要注意：

* 用 `{...}` 表示對象（物件），其後要加 `;` 
* 最後一個鍵值不需要在未尾加 `,` 
* 屬性名必須是一個有效的變量名，如果不是請用 `''` 括起來

最後一點，在 JavaScript 使用上不能用 `xiaoming.屬性;` ，只能用 `xiaoming['屬性'];` 。



> 這一章還沒寫到繼承，算是簡單介紹物件架構。

<br>

### [條件判斷](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014345005693811782d9e338994ec19aa1c5325824bc15000)

> 主要就是 `if else` 。

<br>

### [循環](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434500620831b2aeb535f5e245c788493e9f4ff416c0000)

> 除了 for in 比較特別外，其他 `for` 、 ` while` ，其他語言都有。

<br>

### [Map 和 Set](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014345007434430758e3ac6e1b44b1865178e7aff9082e000)

`Map` 是一組鍵值對的結構，具快速查找地速度。 `Set` 和 `Map` 類似，但其 key 的集合不能重複。

> 比較少用的數據類型。

<br>

### [iterable](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143450082788640f82a480be8481a8ce8272951a40970000)

```javascript
'use strict';
var a = [1, 2, 3];
for (var x of a) {
  alert(x);
}
```

就是指 `array` 、 `map` 、 `set` ，都屬於 iterable 類型。

這裡有講到 `for in` 、 `for of` ，和 `forEach` 方法：

* `for ... in` 由於歷史遺留問題，是對物件屬性遍歷。一個 `array` 實際上是一個物件，它的每個元素的索引被視為一個屬性。
* 更好的方式是使用 `forEach` ，它接收一個函數，每次迭代就自動回調該函數。

```javascript
var a = ['A', 'B', 'C'];
a.forEach(function (element) {
  alert(element);
})
```

> 對函數式寫法怎麼看都覺得很怪。

<br>

## [函數](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014344992519683bcfa2e33760462fb5db8eb9430924be000)

JavaScript 的函數可以像變量一樣使用，具有非常強大的**抽象**能力。

> 新的大章節，對函數的介紹。

<br>

### [函數定義和調用](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143449926746982f181557d9b423f819e89709feabdb4000)



#### 定義函數

```javascript
function abs(x) {
  if (x >= 0) {
    return x;
  } else {
    return -x;
  }
}
```

如果沒有 `return` ，函數執行完會返回 `undefined` 。

由於 JavaScript 函數也是物件，上述定義的 `abs()` 函數實際上是一個函數物件，而函數名  `abs` 可以視為指向該函數的變量。因此，第二種定義函數的方式如下：

```javascript
var abs = function (x) {
  if (x >= 0) {
    return x;
  } else {
  	return -x;
  }
}; // ; 很重要
```

上述為一個匿名函數，它沒有函數名。但是，這個匿名函賦值給了變量 `abs` ，所以，通過變量 `abs` 就可以調用該函數。

JavaScript 允許傳入任意個參數而不影響調用。

`arguments` 一個函數內部起作用，而永遠指向函數傳入的所有參數。

> 這章中 functional language 的原故，會覺得匿名函數很醜，所以要先了解後，再回來看才比較了解內容。

<br>

### [變量作用域](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014344993159773a464f34e1724700a6d5dd9e235ceb7c000)

JavaScript 默認有一個全局對象 `window` ，全局作用域的變量實際上被綁定到 `window` 的一個屬性。



ES6 引入 `let` 替代 `var` 申明一個塊級作用域的變量。

過去通常用全部大寫的變量來表示常量，但 ES6 引入 `const` 來定義常量。



> 這一章，要注意的就是函數裡的變量作用域問題，其他部份就和其它語言一樣。

<br>



### [方法](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014345005399057070809cfaa347dfb7207900cfd116fb000)

在物件中綁定函數（稱為方法）：

```javascript
var xiaoming = {
  name: '小明',
  birth: 1990,
  age: function () {
    var y = new Date().getFullYear();
    return y - this.birth;
  }
};

xiaoming.age;
xiaoming.age();
age(); // NaN
var fn = xiaoming.age;
fn(); // NaN
```

上面中最重要的就是 `this` 這個變量，它始終指向當前對象。

> 我個人認為是指向調用當前對象。

比較好的方法是先把它給其其變數：

```javascript
'use strict';

var xiaoming = {
  name: '小明',
  birth: 1990,
  age: function () {
    var that = this;
    function getAgeFromBirth() {
      var y = new Date().getFullYear();
      return y - that.birth;
    }
    return getAgeFromBirth();
  }
};

xiaoming.age();
```

另外就是 `apply` ：

```javascript
function getAge() {
  var y = new Date().getFullYear();
  return y - this.birth;
}

var xiaoming = {
  name: '小明',
  birth: 1990,
  age: getAge
};

xiaoming.age();
getAge.apple(xiaoming, []);
```

還有就是 `call()`。



> 這一章不知道在講什麼，對新手最不友善的一章。

<br>

### [高階函數](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499355829ead974e550644e2ebd9fd8bb1b0dd721000)

JavaScript 函數都指向某個變量。即然變量可以指向函數，函數的參數能接收變量，那麼一個函數就可以收另一個函數作為參數。

> 也就是函數的本質。（wik 上有）



```javascript
function add(x, y, f) {
  return f(x) + f(y);
}

add(-5, 6, Math.abs);
```



> 簡單來說就是讓函數越來越直覺可寫。

<br>

#### [map / reduce](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001435119854495d29b9b3d7028477a96ed74db95032675000)

```javascript
function pow(x) {
  return x * x;
}
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
arr.map(pow);
```



```javascript
var f = function (x) {
  return x * x;
};

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var result = [];
for (var i = 0; i < arr.length; i++) {
  result.push(f(arr[i]));
}
```



> 照我上一章所講的，高階函數更加直覺，而且把運算規則抽象化了。



```javascript
var arr = [1, 3, 5, 7, 9];
arr.reduce(function (x, y) {
  return x + y;
}); // 25
```

求積的練習題參考答案：

```javascript
'use strict';

function product(arr) {
  return arr.reduce(function (x, y) { 
    return x * y;
  });
}
```



> 算是很方便的函數。 python 雖然也有一樣的函數，感覺沒有那麼好用（直觀）。

下面是 python 的寫法：

```python
a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
def fn(x):
    return x * x
[item for item in map(fn, a)] # [1, 4, 9, 16, 25, 36, 49, 64, 81]
```

<br>

#### [filter](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014351219769203e3fbe1ed611475db3d439393add8997000)

```javascript
var arr = [1, 2, 4, 5, 6, 9, 10, 15];
var r = arr.filter(function (x) {
  return x % 2 !== 0;
});
r; // [1, 5, 9, 15]
```

>也是很方便的函數。

<br>

#### [sort](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014351226817991a9c08f1ec0a45c99b9209bcfc71b8f6000)

> 一個不能亂用的函數。

