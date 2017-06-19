---
title: 學習 ssh 相關知識
date: 2017-06-19 15:34:36
tags:
  - CI
  - travis ci
  - hexo
---

今天 travis ci 連接 github 終於成功了！
測試用 ssh 和 github api token 最後用 token 方法才成功，以下是配置過程：
（一）github 新增 Persional access tokens

（二）在電腦上用 travis

```shell
gem install ruby
gem install travis
travis login
# traivs_token　用 github 設定的名稱， <token> 用後來產生的明碼
travis encrypt 'travis_token=<token>' --add
```

上面輸入完後，會在 `.travis.yml` 增加：

```yaml
env:  
  global:  
    secure: xxxxxxxxxx  
```



（三）設定 .travis.yml

```yaml
language: node_js
node_js: stable
script:
- npm install
- hexo cl
after_success:
- git config --global user.name "hadesshark"
- git config --global user.email "hades_shark@hotmal.com"
# sed 這一段話很重要
- sed -i'' "/^ *repo/s~github\.com~${travis_token}@github.com~" _config.yml
- hexo deploy -g
env:
  global:
    secure: XXXXXXXXXXXXXX
```



另外比較重要的設定就是 `_config.yml` ：

```yaml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repository: https://github.com/<username>/<username>.github.io.git
  branch: master
```



關於 `sed -i'' "/^ *repo/s~github\.com~${travis_token}@github.com~"` 中有兩點很重要：

（一）`travis_token` 這個名稱要用 github 的名稱

（二）`.travis.yml` 和 `_config.yml` 要用上面的設定 