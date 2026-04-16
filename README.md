## このアプリについて
- obsidianユーザー向けに『後で読む』記事を貯めるためのcuiアプリ

## 使用環境
- ruby 3.3.10
- cgi 0.4.2
- nokogiri 1.19.2
- obsidian (win環境のみ確認)

## Use
- main.rbのコメントを参照して自分のobsidianのvault名とpathにしてください
- main.rbを起動し、画面に従いURLを入力することでプロパティ値が入ったobsidianの新規noteが作られます
- ブックマークレットを使用する場合はapp.rbをsinatraサーバーで起動して下記のブックマークレットを作成してください
```
javascript:location.href='http://localhost:4567/clip?url=%27+encodeURIComponent(location.href);
```

## おすすめの使い方
- obsidianのベースかDataviewで一覧で見られるようにすると良いかもしれません

## 非対応
- mac、linuxの環境は検証していません。一応対応させるためAIに記載してもらっていますが動作確認はできていません。
- chromiumエンジン以外のブラウザは検証していません

## LICENCE
- This project is licensed under the MIT License, see the LICENSE.txt file for details
