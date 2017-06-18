---
title: 關於 CI 的一些小小心得
date: 2017-06-18 15:09:44
tags:
  - CI
  - Jenkins
  - travis ci
  - coveralls
  - python
---

這一篇是關於 python 專案 ci 設定問題。最開始是從《Python 項目開發實戰》中關於 Jenkins 設定開始的。在第十章中知道可以輸出報告和顯示覆蓋率報告，但我僅想了解最後的結果，簡單來說就是在 github README.md 中顯示目前專案情況，而且不想透過本機上的 jenkins ，所以改用 travis ci 和 coveralls 。

travis ci 的部份比較簡單，在 .travis.xml 中寫上設定，如下：

```yaml
language: python
python:
  - "3.6"
# command to install dependencies
install:
  - pip install -r requirements.txt
# command to run tests
script:
  - py.test --cov=foo --cov-report=xml
after_success:
  - coveralls
```



專案是使用 `virtualenv -p python3` ，從中可以看出 `pip` 要安裝 `pytest` 、 `pytest-cov` 、`python-coveralls` ，最後要用 `pip freeze > ./requirements.txt` 就可以讓專案比較乾淨。 coveralls 我測試一段時間，才出現覆蓋率數值。在 README.rd 中只有寫下：

```markdown
[![Build Status](https://travis-ci.org/hadesshark/jenkins_test_python.svg?branch=master)](https://travis-ci.org/hadesshark/jenkins_test_python)
[![Coverage Status](https://coveralls.io/repos/github/hadesshark/jenkins_test_python/badge.svg?branch=master)](https://coveralls.io/github/hadesshark/jenkins_test_python?branch=master)
```

在 coveralls 和 travis ci 中的專案中有 markdown 可以只接下載，所以整個過程很好設定。



整個專案的過程是這樣的：

1. git push commit
2. travis ci build
3. coveralls coverage

我比較好奇的是如何讓 coveralls 有 coverage 這個部份，因為在 2 的設定中僅是在 after_success 寫下 coveralls 這個設定就產生覆蓋率，不像 coverage.py 一樣還要 `coverage run …` 所以感覺很奇怪。
