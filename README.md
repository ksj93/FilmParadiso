# README

## 開発言語
* Ruby 2.6.5  
* Ruby on Rails 5.2.6

## 就職Termの技術
* devise gem
* フォロー機能
* メッセージ機能
* お気に入り機能

## カリキュラム外の技術
* tmdb-api gem (映画のデータベース)

## 実行手順
<pre>
<code>
$ git clone git@github.com:ksj93/FilmParadiso.git  
$ cd film_paradiso  
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
<img src="docs/ER図.PNG"  width="650" height="370">

## 画面遷移図
<img src="docs/画面遷移図.PNG"  width="700" height="250">
