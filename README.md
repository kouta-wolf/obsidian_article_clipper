## このアプリについて
- obsidianユーザー向けに『後で読む』記事を貯めるためのcuiアプリ

## 使用環境
- ruby 3.3.10
- cgi 0.4.2
- nokogiri 1.19.2
- obsidian (win環境のみ確認)

## Use
- main.rbのコメントを参照してobsidianのvault名とpathを変更してください
- main.rbを起動し、画面に従いURLを入力することでプロパティ値が入ったobsidianの新規noteが作られる
- ブックマークレットを使用する場合はapp.rbをsinatraサーバーで起動して`javascript:location.href='http://localhost:4567/clip?url=%27+encodeURIComponent(location.href);`をブックマークに入れてください

## おすすめの使い方
- obsidianのベースかDataviewで一覧で見られるようにすると良いかもしれません

## 非対応
- mac、linuxの環境は検証していません。一応対応させるためAIに記載してもらっていますが動作確認はできていません。
- choroniumエンジン以外のブラウザは検証していません


