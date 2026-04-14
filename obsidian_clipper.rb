require 'cgi'
require 'open-uri'
require 'nokogiri'

class ObsidianClipper
  def initialize(vault:)
    @vault = vault
  end

  def format_content(title, url)
    <<~TEXT.chomp
    # #{title}

    tags: #clip #later
    url: #{url}

    - [ ] 読む
    TEXT
  end

  def build_uri(name, content)
    encoded_name = CGI.escape(name)
    encoded_content = CGI.escape(content)

    "obsidian://new?vault=#{@vault}&file=06_clippings%2F#{encoded_name}&content=#{encoded_content}"
  end

  def fetch_title(url)
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    doc.title
  end
end
