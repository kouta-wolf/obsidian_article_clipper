## このアプリについて

- obsidianユーザー向けに『後で読む』記事を貯めるためのcuiアプリ

## 使用環境

- ruby 3.3.10
- cgi 0.4.2
- nokogiri 1.19.2
- obsidian (WSL環境のみ確認)

## デモ動画

- GUIでの動作が可能になった際に作成します

## セットアップ

### 必要な環境

- Ruby 3.0以上
- WSL / macOS

### インストール

ターミナルで以下のコマンドを実行して、必要なライブラリをインストールしてください。

```bash
gem install nokogiri
```

## 使い方

- main.rbのコメントを参照して自分のobsidianのvault名とpathにしてください
- main.rbを起動し、画面に従いURLを入力することでプロパティ値が入ったobsidianの新規noteが作られます

## おすすめの使い方

- obsidianのベースかDataviewで一覧で見られるようにすると良いかもしれません

## 現状未完成

- mac、linuxの環境は検証していません。
- chromiumエンジン以外のブラウザは検証していません

## 今後の実装予定

- [ ] mac、linux、win単体で機能
- [x] オプションでvault名とpathの変更方法

## LICENCE

- This project is licensed under the MIT License, see the LICENSE.txt file for details
