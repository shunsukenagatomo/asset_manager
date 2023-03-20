# asset_manager
- アセット管理ツール

## 必要要件
- docker

## 事前準備
- GitHubの自身のアクセストークンを `read:packages` の権限を付与した状態で取得し、.bash_profileなどに設定する
```
$ echo export GITHUB_ACCESS_TOKEN="xxxxxxxxxxxxx" >> ~/.bash_profile
$ echo export GITHUB_USERNAME="xxxxxxxx" >> ~/.bash_profile
```
- Docker for Macをインストールする
- Docker Composeをインストールする

## 環境構築
```
$ git clone git@github.com:shunsukenagatomo/asset_manager.git
$ cd asset_manager
$ make setup
$ make up
```
