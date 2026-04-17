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
