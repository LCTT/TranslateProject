让我们做个简单的解释器（2）
======

在一本叫做 《高效思考的 5 要素》 的书中，作者 Burger 和 Starbird 讲述了一个关于他们如何研究 Tony Plog 的故事，一个举世闻名的交响曲名家，为一些有才华的演奏者开创了一个大师班。这些学生一开始演奏复杂的乐曲，他们演奏的非常好。然后他们被要求演奏非常基础简单的乐曲。当他们演奏这些乐曲时，与之前所演奏的相比，听起来非常幼稚。在他们结束演奏后，老师也演奏了同样的乐曲，但是听上去非常娴熟。差别令人震惊。Tony 解释道，精通简单符号可以让人更好的掌握复杂的部分。这个例子很清晰 - 要成为真正的名家，必须要掌握简单基础的思想。

故事中的例子明显不仅仅适用于音乐，而且适用于软件开发。这个故事告诉我们不要忽视繁琐工作中简单基础的概念的重要性，哪怕有时候这让人感觉是一种倒退。尽管熟练掌握一门工具或者框架非常重要，了解他们背后的原理也是极其重要的。正如 Palph Waldo Emerson 所说：

> “如果你只学习方法，你就会被方法束缚。但如果你知道原理，就可以发明自己的方法。”

有鉴于此，让我们再次深入了解解释器和编译器。

今天我会向你们展示一个全新的计算器，与 [第一部分][1] 相比，它可以做到：

  1. 处理输入字符串任意位置的空白符
  2. 识别输入字符串中的多位整数
  3. 做两个整数之间的减法（目前它仅能加减整数）


新版本计算器的源代码在这里，它可以做到上述的所有事情：
```
# 标记类型
# EOF (end-of-file 文件末尾) 标记是用来表示所有输入都解析完成
INTEGER, PLUS, MINUS, EOF = 'INTEGER', 'PLUS', 'MINUS', 'EOF'


class Token(object):
    def __init__(self, type, value):
        # token 类型: INTEGER, PLUS, MINUS, or EOF
        self.type = type
        # token 值: 非负整数值, '+', '-', 或无
        self.value = value

    def __str__(self):
        """String representation of the class instance.

        Examples:
            Token(INTEGER, 3)
            Token(PLUS '+')
        """
        return 'Token({type}, {value})'.format(
            type=self.type,
            value=repr(self.value)
        )

    def __repr__(self):
        return self.__str__()


class Interpreter(object):
    def __init__(self, text):
        # 客户端字符输入， 例如. "3 + 5", "12 - 5", 
        self.text = text
        # self.pos 是 self.text 的索引
        self.pos = 0
        # 当前标记实例
        self.current_token = None
        self.current_char = self.text[self.pos]

    def error(self):
        raise Exception('Error parsing input')

    def advance(self):
        """Advance the 'pos' pointer and set the 'current_char' variable."""
        self.pos += 1
        if self.pos > len(self.text) - 1:
            self.current_char = None  # Indicates end of input
        else:
            self.current_char = self.text[self.pos]

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()

    def integer(self):
        """Return a (multidigit) integer consumed from the input."""
        result = ''
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        return int(result)

    def get_next_token(self):
        """Lexical analyzer (also known as scanner or tokenizer)

        This method is responsible for breaking a sentence
        apart into tokens.
        """
        while self.current_char is not None:

            if self.current_char.isspace():
                self.skip_whitespace()
                continue

            if self.current_char.isdigit():
                return Token(INTEGER, self.integer())

            if self.current_char == '+':
                self.advance()
                return Token(PLUS, '+')

            if self.current_char == '-':
                self.advance()
                return Token(MINUS, '-')

            self.error()

        return Token(EOF, None)

    def eat(self, token_type):
        # 将当前的标记类型与传入的标记类型作比较，如果他们相匹配，就
        # “eat” 掉当前的标记并将下一个标记赋给 self.current_token，
        # 否则抛出一个异常
        if self.current_token.type == token_type:
            self.current_token = self.get_next_token()
        else:
            self.error()

    def expr(self):
        """Parser / Interpreter

        expr -> INTEGER PLUS INTEGER
        expr -> INTEGER MINUS INTEGER
        """
        # 将输入中的第一个标记设置成当前标记
        self.current_token = self.get_next_token()

        # 当前标记应该是一个整数
        left = self.current_token
        self.eat(INTEGER)

        # 当前标记应该是 ‘+’ 或 ‘-’
        op = self.current_token
        if op.type == PLUS:
            self.eat(PLUS)
        else:
            self.eat(MINUS)

        # 当前标记应该是一个整数
        right = self.current_token
        self.eat(INTEGER)
        # 在上述函数调用后，self.current_token 就被设为 EOF 标记

        # 这时要么是成功地找到 INTEGER PLUS INTEGER，要么是 INTEGER MINUS INTEGER
        # 序列的标记，并且这个方法可以仅仅返回两个整数的加或减的结果，就能高效解释客户端的输入
        if op.type == PLUS:
            result = left.value + right.value
        else:
            result = left.value - right.value
        return result


def main():
    while True:
        try:
            # To run under Python3 replace 'raw_input' call
            # with 'input'
            text = raw_input('calc> ')
        except EOFError:
            break
        if not text:
            continue
        interpreter = Interpreter(text)
        result = interpreter.expr()
        print(result)


if __name__ == '__main__':
    main()
```

把上面的代码保存到 calc2.py 文件中，或者直接从 [GitHub][2] 上下载。试着运行它。看看它是不是正常工作：它应该能够处理输入中任意位置的空白符；能够接受多位的整数，并且能够对两个整数做减法和加法。

这是我在自己的笔记本上运行的示例：
```
$ python calc2.py
calc> 27 + 3
30
calc> 27 - 7
20
calc>
```

与 [第一部分][1] 的版本相比，主要的代码改动有：

  1. get_next_token 方法重写了很多。增加指针位置的逻辑之前是放在一个单独的方法中。
  2. 增加了一些方法：skip_whitespace 用于忽略空白字符，integer 用于处理输入字符的多位整数。
  3. expr 方法修改成了可以识别 “整数 -> 减号 -> 整数” 词组和 “整数 -> 加号 -> 整数” 词组。在成功识别相应的词组后，这个方法现在可以解释加法和减法。

[第一部分][1] 中你学到了两个重要的概念，叫做 **标记** 和 **词法分析**。现在我想谈一谈 **词法**， **解析**，和**解析器**。

你已经知道标记。但是为了让我详细的讨论标记，我需要谈一谈词法。词法是什么？**词法** 是一个标记中的字符序列。在下图中你可以看到一些关于标记的例子，还好这可以让它们之间的关系变得清晰：

![][3]

现在还记得我们的朋友，expr 方法吗？我之前说过，这是数学表达式实际被解释的地方。但是你要先识别这个表达式有哪些词组才能解释它，比如它是加法还是减法。expr 方法最重要的工作是：它从 get_next_token 方法中得到流，并找出标记流的结构然后解释已经识别出的词组，产生数学表达式的结果。

在标记流中找出结构的过程，或者换种说法，识别标记流中的词组的过程就叫 **解析**。解释器或者编译器中执行这个任务的部分就叫做 **解析器**。

现在你知道 expr 方法就是你的解释器的部分，**解析** 和 **解释** 都在这里发生 - expr 方法首先尝试识别（**解析**）标记流里的 “整数 -> 加法 -> 整数” 或者 “整数 -> 减法 -> 整数” 词组，成功识别后 （**解析**） 其中一个词组，这个方法就开始解释它，返回两个整数的和或差。

又到了练习的时间。

![][4]

  1. 扩展这个计算器，让它能够计算两个整数的乘法
  2. 扩展这个计算器，让它能够计算两个整数的除法
  3. 修改代码，让它能够解释包含了任意数量的加法和减法的表达式，比如 “9 - 5 + 3 + 11”



**检验你的理解：**

  1. 词法是什么？
  2. 找出标记流结构的过程叫什么，或者换种说法，识别标记流中一个词组的过程叫什么？
  3. 解释器（编译器）执行解析的部分叫什么？


希望你喜欢今天的内容。在该系列的下一篇文章里你就能扩展计算器从而处理更多复杂的算术表达式。敬请期待。

--------------------------------------------------------------------------------

via: https://ruslanspivak.com/lsbasi-part2/

作者：[Ruslan Spivak][a]
译者：[BriFuture](https://github.com/BriFuture)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ruslanspivak.com
[1]:http://ruslanspivak.com/lsbasi-part1/ (Part 1)
[2]:https://github.com/rspivak/lsbasi/blob/master/part2/calc2.py
[3]:https://ruslanspivak.com/lsbasi-part2/lsbasi_part2_lexemes.png
[4]:https://ruslanspivak.com/lsbasi-part2/lsbasi_part2_exercises.png
