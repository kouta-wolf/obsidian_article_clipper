require_relative 'obsidian_clipper'

clipper = ObsidianClipper.new(vault: 'obsidian')

puts "クリップしたいURLを入力してね >> "
url = gets.chomp

puts "タイトルを取得中..."
title = clipper.fetch_title(url)
puts "Title: #{title}"

content = clipper.format_content(title, url)
uri = clipper.build_uri("#{title}", content)

puts "Obsidianに送信しています..."

if RUBY_PLATFORM.include?("darwin") 
  puts "darwin: #{uri}"
  system("open '#{uri}'")
elsif File.exist?("/proc/version") && File.read("/proc/version").downcase.include?("microsoft") 
  system("powershell.exe -Command \"Start-Process '#{uri}'\"")
elsif RUBY_PLATFORM.include?("mingw")
  puts "mingw: #{uri}"
  system("start \"\" \"#{uri}\"")
else
  puts "対応していないOSです。URIを表示します:"
  puts uri
end
