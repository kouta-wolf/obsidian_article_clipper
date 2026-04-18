require 'minitest/autorun'
require_relative '../bin/obsidian_clipper'

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
    sample_path = "dummy_folder/sample_note"
    sample_content = "tags: #webclip #unread"

    uri = @clipper.build_uri(sample_path, sample_content)

    assert_match /^obsidian:\/\/new\?vault=my-notes/, uri
    assert_includes uri, "&file="
    encoded_path = CGI.escape(sample_path).gsub('+', '%20')
    assert_includes uri, "file=#{encoded_path}"
    encoded_content = CGI.escape(sample_content).gsub('+', '%20')
    assert_includes uri, "content=#{encoded_content}"
  end

  def test_fetch_title
    url = "https://qiita.com/about"
    title = @clipper.fetch_title(url)

    assert_includes title, "Qiita"
  end
end
