require_relative 'obsidian_clipper'

clipper = ObsidianClipper.new(vault: 'obsidian')

puts "クリップしたいURLを入力してね >> "
url = gets.chomp

puts "タイトルを取得中..."
title = clipper.fetch_title(url)
puts "Title: #{title}"

safe_title = clipper.sanitize_filename(title)
file_path = "06_clippings/#{safe_title}"

content = clipper.format_content(title, url)
uri = clipper.build_uri(file_path, content) 

puts "Obsidianに送信しています..."

if RUBY_PLATFORM.include?("darwin") 
  puts "darwin: #{uri}"
  system("open '#{uri}'")
elsif File.exist?("/proc/version") && File.read("/proc/version").downcase.include?("microsoft")
  puts uri
  js_uri = uri.gsub("'", "\\'")
  html_content = <<~HTML
    <html>
      <head><meta charset="UTF-8"></head>
      <body>
        <p>Obsidianを起動しています...</p>
        <script>
          window.location.href = '#{js_uri}';
          setTimeout(() => { window.close(); }, 1000);
        </script>
      </body>
    </html>
  HTML
  File.write("obsidian_bridge.html", html_content)
  win_path = `wslpath -w "$(pwd)/obsidian_bridge.html"`.chomp
  system("explorer.exe", win_path)
elsif RUBY_PLATFORM.include?("mingw")
  puts "mingw: #{uri}"
  system("explorer.exe \"#{uri}\"")
else
  puts "対応していないOSです。URIを表示します:"
  puts uri
end
