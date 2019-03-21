load "html_decode.rb"
require 'test/unit'
class TestHtmlDecoding < Test::Unit::TestCase
  def test_first
    assert_equal(%q[Cat <says> "Meow" M&M's], Html.new.htmlDecode('Cat &lt;says&gt; &quot;Meow&quot; M&amp;M&apos;s'))   
  end
end     