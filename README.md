## このアプリについて

- obsidianユーザー向けに『後で読む』記事を貯めるためのcuiアプリ

## 使用環境

- ruby 3.3.10
- cgi 0.4.2
- nokogiri 1.19.2
- obsidian (win環境のみ確認)

## デモ動画

- GUIでの動作が可能になった際に作成します

## 使い方

- main.rbのコメントを参照して自分のobsidianのvault名とpathにしてください
- main.rbを起動し、画面に従いURLを入力することでプロパティ値が入ったobsidianの新規noteが作られます
- ブックマークレットを使用する場合はapp.rbをsinatraサーバーで起動して下記のブックマークレットを作成してください
```
javascript:location.href='http://localhost:4567/clip?url=%27+encodeURIComponent(location.href);
```

## おすすめの使い方

- obsidianのベースかDataviewで一覧で見られるようにすると良いかもしれません

## 現状未完成

- mac、linuxの環境は検証していません。
- chromiumエンジン以外のブラウザは検証していません

## 今後の実装予定

- [ ] GUIでの動作の追加
- [ ] Sinatraを使わない方法
- [ ] mac、linux、win単体での機能
- [ ] オプションでvault名とpathの変更方法
- [ ] obsidianへの自動設定
- [ ] obsidianかブラウザへのプラグイン化

## LICENCE

- This project is licensed under the MIT License, see the LICENSE.txt file for details
