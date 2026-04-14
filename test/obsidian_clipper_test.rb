require 'minitest/autorun'
require_relative '../obsidian_clipper'

class ObsidianClipperTest < Minitest::Test
  def setup
    @clipper = ObsidianClipper.new(vault: "my-notes") # vault名はダミー
  end

  def test_format_content
    url = "https://qiita.com/example"
    title = "Qiitaの記事"
    
    expected = <<~TEXT.chomp
      # Qiitaの記事

      tags: #clip #later
      url: https://qiita.com/example

      - [ ] 読む
    TEXT

    assert_equal expected, @clipper.format_content(title, url)
  end

  def test_build_uri
    title = "Rubyの記事"
    content = "tags: #later"

    uri = @clipper.build_uri("later/#{title}", content)

    assert_match /^obsidian:\/\/new\?vault=my-notes/, uri
    assert_includes uri, "name=later%2FRuby%E3%81%AE%E8%A8%98%E4%BA%8B"
  end

  def test_fetch_title
    url = "https://qiita.com/about"
    title = @clipper.fetch_title(url)

    assert_includes title, "Qiita"
  end
end
