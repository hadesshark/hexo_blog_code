---
title: Shell 學習
date: 2017-03-11 17:50:29
tags:
  - Shell
categories:
  - 學習
---



就是學習 Shell 的一篇文章。



<!--more-->



## 1. 為何學習和 Shell 基礎

簡單來說就是想偷賴。 Shell 是指令碼語言，由解譯器讀取程式碼並且執行其中的敘述。當初 Bourne Shell 用於管理工作的自動化。 bill Joy 開發 C Shell ，但速度慢；之後又出現了許多 Shell 。

Shell 又稱命令直譯器，目前大都使用 Brian Fox 撰寫的 bash 。下面是一個 shell 程式。

{% include_code ex1-1.sh lang:shell /shell/chapter1/ex1-1.sh %}



寫成指令稿比較方便使用（需要改成可執行）。



常用參數：

| 參數   | 說明                  |
| ---- | ------------------- |
| $n   | 第 n 個參數             |
| $0   | 當前指令稿（這是目前執行程式）     |
| $#   | 命令列參數個數（目前沒用過）      |
| $*   | 傳回所有參數的值（目前沒用過）[一串] |
| $@   | 同上[一個一個]            |
| $_   | 上一個執行的指令後的參數（很有用）   |

ps：

* 其他參數（特別的）需要括號（單、雙引號）。
* 沒有 `$10` （應該說 `$10` 會取到 `$1`的值，之後會加上一個 `0` 字串，所以正確寫法要寫成 `${10}` ）



下面的指令稿為 `$#` 和 `$@` 的例子：

{% include_code ex1-1.sh lang:shell /shell/chapter1/ex1-3.sh %}



執行 `./ex1-3.sh a "b c"，結果為：

```sh
2 parameters
a b c
```



介紹 `ls -l` 指令後的 `-l` 判斷：

{% include_code ex1-1.sh lang:shell /shell/chapter1/ex1-4.sh %}



上面這個指令搞不太了解 `$OPTIND` 為何不同，且而對於 `while getopts ":pq:" optname` ，雙引號中的意思不太清楚，書上有寫到：

1. 第一個 `:` 忽略錯誤訊息
2. 第二個代表選項需要一個值



{% include_code ex1-1.sh lang:shell /shell/chapter1/ex1-5.sh %}

介由指定解譯器，讓程式不僅僅限於 bash 。



變數在設定值時，不可以空隔，下面是範例：

```shell
v1 = "abc"  # 不正確的寫法
v1="abc"  # ok!
```

