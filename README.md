Simple Indentation Parser
-------------------------

IndentParser will parse python style indented text.  Let's assume you have some text:

    foo1
      bar
      baz
    foo2
    
Coding example:

    root = IndentParser.parse("foo\n  bar")

    # accessing root elements
    first_element = root.first
    first_element.content # foo

    # accessing children
    first_element[0].content # bar
    first_element.children.first #bar
