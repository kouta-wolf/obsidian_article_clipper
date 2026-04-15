require 'cgi'
require 'date'
require 'open-uri'
require 'nokogiri'

class ObsidianClipper
  def initialize(vault:)
    @vault = vault
  end

  def format_content(title, url)
    safe_title = title.gsub('"', '\"')
    today = Date.today.strftime("%Y-%m-%d")
    author = detect_author(url)
    <<~TEXT.chomp
    ---
    title: "#{safe_title}"
    source: "#{url}"
    author: "#{author}"
    created: #{today}
    tags:
      - webclip
      - unread
    ---
    # #{title}
    TEXT
  end

  def sanitize_filename(title)
    title.gsub(/[\\\/:\*\?"<>|#]/, '-')
  end

  def build_uri(file_path, content)
    encoded_path = CGI.escape(file_path).gsub('+', '%20')
    encoded_content = CGI.escape(content).gsub('+', '%20')

    "obsidian://new?vault=#{@vault}&file=#{encoded_path}&content=#{encoded_content}"
  end

  def fetch_title(url)
    opt = { "User-Agent" => "Mozilla/5.0" }
    html = URI.open(url, opt).read
    doc = Nokogiri::HTML.parse(html)
    doc.title
  end


private

  def detect_author(url)
    if url.include?("qiita.com")
      "Qiita"
    elsif url.include?("zenn.dev")
      "Zenn"
    else
      "Web"
    end
  end
end
