## アプリケーション名	
my note

## アプリケーション概要	
メモの作成。  
登録済のメモのタイトルと同じ単語が本文中にある場合、該当する単語が自動で該当ページへのハイパーリンク化される。



## 利用方法	
・トップページでタイトルと本文を記入し、保存ボタンを押すとメモが登録される。

・サイドバーに表示されているメモのタイトルをクリックするとメモの詳細ページへ移動する。

・編集、削除は詳細ページから行う。

・マークダウン記法で入力


## アプリケーションを作成した背景	
自分自身がメモの整理が苦手なため、wikiのようにメモ同士を関連付けて簡単に整理できるようにしたかったため。
本文の入力や編集の際に、なるべくマークダウンでリンクを入力する手間を省きたかったので登録済のタイトルと同じ単語が本文中にある場合は自動でリンクとなるようにした。

## 洗い出した要件	
[要件定義シート](https://docs.google.com/spreadsheets/d/1A4wel3upo-q7Et_sOtHgaoOnjhXK_01_jtdcFmcznqQ/edit#gid=1708663434)


## データベース設計	
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | text       | null: false                    |
| text   | text       | null: false, limit: 4294967295 |


## 画面遷移図	
[![Image from Gyazo](https://i.gyazo.com/3cc8a7a4d0c6cb56734a5c37168ef87c.png)](https://gyazo.com/3cc8a7a4d0c6cb56734a5c37168ef87c)

## 開発環境	
【言語】　Ruby

【OS】　MacOS Monterey

【DB】　mysql2 

## ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/matsukano/my_note.git  
% cd my_note  
% bundle install  
% yarn install  

## 工夫したポイント
自動URL追加機能は本来ハイパーリンクで表示させたかったが、実装が難しかったためURLを追加することで対応した。
