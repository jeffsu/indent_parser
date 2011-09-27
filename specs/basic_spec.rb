require "./lib/indent_parser"

describe IndentParser do
  describe "#parse" do
    it "parses basic format" do
      root = IndentParser.parse("foo\n  bar")
      foo = root.first
      foo.content.should == 'foo'
      foo[0].content.should == 'bar'
    end
  end
end
