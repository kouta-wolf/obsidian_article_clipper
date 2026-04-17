require 'minitest/autorun'
require_relative '../obsidian_clipper'

class ObsidianClipperTest < Minitest::Test
  def setup
    @clipper = ObsidianClipper.new(vault: "my-notes") # vault名はダミー
  end

  def test_format_content
    url = "https://qiita.com/example"
    title = 'Qiitaの"すごい"記事'
    today = Date.today.strftime("%Y-%m-%d")
    
    expected = <<~TEXT.chomp
    ---
    title: "Qiitaの\\"すごい\\"記事"
    source: "https://qiita.com/example"
    author: 
    - Qiita
    created: #{today}
    tags:
      - webclip
      - unread
    ---
    # Qiitaの"すごい"記事
    TEXT

    assert_equal expected, @clipper.format_content(title, url)
  end

  def test_build_uri
    title = "Rubyの記事"
    content = "tags: #webclip #unread"

    uri = @clipper.build_uri("#{title}", content)

    assert_match /^obsidian:\/\/new\?vault=my-notes/, uri
    assert_includes uri, "name=later%2FRuby%E3%81%AE%E8%A8%98%E4%BA%8B"
  end

  def test_fetch_title
    url = "https://qiita.com/about"
    title = @clipper.fetch_title(url)

    assert_includes title, "Qiita"
  end
end
