require 'sinatra'
require_relative 'obsidian_clipper'

# Windows側（ブラウザ）からアクセスできるように設定
set :bind, '0.0.0.0'
set :port, 4567

clipper = ObsidianClipper.new(vault: 'obsidian')

get '/clip' do
  url = params[:url]
  return "URLが見つかりません" if url.nil? || url.empty?

  begin
    puts "URLを受信: #{url}"
    title = clipper.fetch_title(url)
    safe_title = clipper.sanitize_filename(title)
    file_path = "06_clippings/#{safe_title}"
    content = clipper.format_content(title, url)
    uri = clipper.build_uri(file_path, content)

    # 前回の「HTMLブリッジ」のコードを使ってリダイレクト用HTMLを返す
    # (直接 redirect uri を使うと、ブラウザがURIをブロックすることがあるため)
    <<~HTML
      <html>
        <body>
          <p>Obsidianへ送信中: #{title}</p>
          <script>
            window.location.href = '#{uri}';
            setTimeout(() => { window.close(); }, 1500);
          </script>
        </body>
      </html>
    HTML
  rescue => e
    "エラーが発生しました: #{e.message}"
  end
end

clip?url=https%3A%2F%2Fqiita.com%2FNoripy%2Fitems%2F9852f0c6e734c35b4190:1 Launched external handler for 'obsidian://new?vault=obsidian&file=06_clippings%2FRails%E3%81%AE%E9%AB%98%E5%BA%A6%E3%81%AA%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BDgem%20%60ransack%60%20%E3%82%92%E5%AD%A6%E3%81%B6%20-Gem%20-%20Qiita&content=---%0Atitle%3A%20%22Rails%E3%81%AE%E9%AB%98%E5%BA%A6%E3%81%AA%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BDgem%20%60ransack%60%20%E3%82%92%E5%AD%A6%E3%81%B6%20%23Gem%20-%20Qiita%22%0Asource%3A%20%22https%3A%2F%2Fqiita.com%2FNoripy%2Fitems%2F9852f0c6e734c35b4190%22%0Aauthor%3A%20%0A-%20Qiita%0Acreated%3A%202026-04-15%0Atags%3A%0A%20%20-%20webclip%0A%20%20-%20unread%0A---%0A%23%20Rails%E3%81%AE%E9%AB%98%E5%BA%A6%E3%81%AA%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BDgem%20%60ransack%60%20%E3%82%92%E5%AD%A6%E3%81%B6%20%23Gem%20-%20Qiita'.
clip?url=https%3A%2F%2Fqiita.com%2FNoripy%2Fitems%2F9852f0c6e734c35b4190:6 Scripts may close only the windows that were opened by them.
（匿名） @ clip?url=https%3A%2F%2Fqiita.com%2FNoripy%2Fitems%2F9852f0c6e734c35b4190:6
setTimeout
（匿名） @ clip?url=https%3A%2F%2Fqiita.com%2FNoripy%2Fitems%2F9852f0c6e734c35b4190:6
