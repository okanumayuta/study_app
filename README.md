# アプリ名
Memo Randum

# 概要
備忘録としてプログラミングに関する知識を振り返る事ができるアプリケーションです。  
実行したい処理を記述する際に、素早く確認できるようにユーザーは言語とフレームワーク、処理の記述内容を投稿しユーザー独自のチートシートとして活用します。  
投稿した内容は一覧表示され、検索機能を用いる事で条件にあった投稿を抽出し閲覧する事ができます。

# 本番環境
https://study-36774.herokuapp.com/

* ログイン情報  
  * メールアドレス : bbb@icloud.com  
  * パスワード : abc123  

# 制作背景
オリジナルアプリケーション作成にあたり、コードの記述やCLIでの実行で記述内容の誤りや手順の漏れがあり実行内容の確認を何度も検索していました。  
web検索では検索したい事柄に対して多くの情報を提供している反面、情報量の多さから条件にあった内容を探し出す事に時間がかかってしまいます。  
そこでユーザーが頻繁に確認する内容や、今後も確認するであろう処理を記録として残し、素早く参照できるアプリが必要と考えた為です。

# DEMO
## トップページ
[![Image from Gyazo](https://i.gyazo.com/0466a12484e1b73535723bc91c623cbe.png)](https://gyazo.com/0466a12484e1b73535723bc91c623cbe)

## 詳細表示
[![Image from Gyazo](https://i.gyazo.com/53276fa0fd0c8a057e1bdaa839d93042.png)](https://gyazo.com/53276fa0fd0c8a057e1bdaa839d93042)

## 検索結果一覧表示
[![Image from Gyazo](https://i.gyazo.com/336faace4451949d37ca3e1fc6a6df4b.gif)](https://gyazo.com/336faace4451949d37ca3e1fc6a6df4b)

# DB設計
## users テーブル

| Column              | Type                        | Options                  |
|---------------------|-----------------------------|--------------------------|
| name                | string                      |                          |
| email               | string                      | null: false, unique: true|
| encrypted_password  | string                      | null: false              |

* Association
  * has_many :studies

## studies テーブル

| Column                | Type                        | Options                        |
|-----------------------|-----------------------------|--------------------------------|
| title                 | string                      |                                |
| language              | string                      |                                |
| user                  | reference                   | null: false, foreign_key: true |
| framework             | string                      |                                |
| content               | text                        |                                |

* Association
  * belongs_to :user

