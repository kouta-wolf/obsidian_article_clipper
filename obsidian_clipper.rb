require 'cgi'

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

    "obsidian://new?vault=#{@vault}&name=#{encoded_name}&content=#{encoded_content}"
  end
end
