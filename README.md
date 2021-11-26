# README

## 開発言語
* Ruby 2.6.5  
* Ruby on Rails 5.2.6

## 就職Termの技術
* gem devise (ログインとユーザー管理)
* gem devise-i18n (ログインとユーザー管理)
* gem rexml (ログインとユーザー管理)
* gem rails_admin (ログインとユーザー管理)
* gem cancancan (ログインとユーザー管理)
* フォロー機能
* メッセージ機能
* お気に入り機能
* コメント機能(優先度:低)

## カリキュラム外の技術
*  gem tmdb-api (映画のデータベース)

## 実行手順
<pre>
<code>
$ git clone git@github.com:ksj93/FilmParadiso.git  
$ cd FilmParadiso  
$ bundle install  
$ rails db:create db:migrate  
$ rails s (vagrantの場合はrails s -b 0.0.0.0)  
</code>
</pre>

## カタログ設計&テーブル定義書
https://docs.google.com/spreadsheets/d/12gIhYh5kRHpARted4n98zccuEwbHlNVeSzEoT_gQ92Y/edit?usp=sharing

## ワイヤーフレーム
https://drive.google.com/file/d/1uVG-Ze9m3uh4YvbrFRxYL9fxX7vXd9oF/view?usp=sharing

## ER図
![ER図](https://user-images.githubusercontent.com/89897866/143575501-33859356-7022-42d2-93c7-359727cce2a1.png)


## 画面遷移図
![画面遷移図](https://user-images.githubusercontent.com/89897866/143575506-c2a1d194-e555-4bcb-9237-86b070859731.png)
