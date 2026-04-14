class ObsidianClipper
  def initialize(vault:)
    @vault = vault
  end

  def format_content(title, url)
    <<~TEXT.chomp
    tags: #clip #later
    url: #{url}

    - [ ] 読む
    TEXT
  end
end
