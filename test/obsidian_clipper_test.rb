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
      tags: #clip #later
      url: https://qiita.com/example

      - [ ] 読む
    TEXT

    assert_equal expected, @clipper.format_content(title, url)
  end
end
