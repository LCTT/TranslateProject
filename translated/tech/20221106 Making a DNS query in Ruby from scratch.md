[#]: subject: "Making a DNS query in Ruby from scratch"
[#]: via: "https://jvns.ca/blog/2022/11/06/making-a-dns-query-in-ruby-from-scratch/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "Drwhooooo"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

从零开始，运用 Ruby 语言创建一个 DNS 查询
======

大家好！

前段时间我写了一篇关于“[如何用 Go 语言建立一个简易的 DNS 解析器][1]”的帖子。

那篇帖子里我没写有关“如何生成以及解析 DNS 查询请求”的内容，因为我觉得这很无聊，不过一些伙计指出他们不知道如何解析和生成 DNS 查询请求，并且对此很感兴趣。

我开始好奇了——解析 DNS _能_花多大功夫？事实证明，编写一段 120 行精巧的Ruby语言代码组成的程序我们就可以做到，这并不是很困难。

所以，在这里有一个如何生成 DNS 查询请求以及如何解析DNS响应报文的速成教学！我们会用 Ruby 语言完成这项任务，主要是因为不久以后我将在一场 Ruby 语言大会上发表观点，而这篇博客帖的部分内容是为了那场谈话做准备的。:)

（我尽可能让代码在那些之前不知道 Ruby 语言的人们面前保持可读性，我也只用过非常基础的 Ruby 语言代码。）

最后，我们就能制作一个非常简易的 Ruby 版本的`dig`工具，能够查找域名，就像这样：

```

    $ ruby dig.rb example.com
    example.com    20314    A    93.184.216.34

```

整个大概 120 行左右，并没有 _那么_ 多。 （最终程序在这里，[dig.rb][2]，如果你想略过细则，单纯想去读代码的话。）

我们不会去实现之前帖中所说的“一个 DNS 解析器是如何运作的？”，因为我们已经做过了。

那么我们开始吧！

顺便提一嘴，我会试着去解释为什么如果你们想尽办法从头理解 DNS 查询是如何布局的，你们就能够自己去解决这一档子事儿。大多数情况下的答案是“搜索 Wireshark”以及“阅读 RFC 1035，即 DNS 的请求注解”。

### 步骤一：打开一个 UDP 套接字

我们需要切实发送我们的DNS查询，那么为了达成目的我们就需要打开一个 UDP 套接字。我们会将我们的 DNS 查询发送至 `8.8.8.8`,即 Google 服务器。

下面是用于建立与 `8.8.8.8` 的 UDP 联接，端口为 53(UDP 端口) 的代码。

```

    require 'socket'
    sock = UDPSocket.new

    sock.bind('0.0.0.0', 12345)
    sock.connect('8.8.8.8', 53)

```

##### 关于 UDP 的一个小贴士：

我不再多说更多关于 UDP 的内容了，但是我还是会说有关计算机网络基础知识中的“数据包”（数据包，即一个字节串），而在这个程序中我会教你们关于计算机网络里能做到的最简单的事情——传递一个数据包，并接收一个数据包作为响应。

所以 UDP 是一个传递数据包的最简单的方法。

这是发送 DNS 查询最寻常的方法，不过你还可以用 TCP 或者 DNS-over-HTTPS。

##### 步骤二：自 Wireshark 复制一个 DNS 查询

那么：要是我们都没法理解 DNS 是如何运作的但我们还是想尽快发送一个能运行的 DNS 查询。那么最简单的方式便是，粘过来个已经能够运行的来玩玩！只要确保我们的 UDP 连接运行正常就行。

所以这就是我们接下来要做的，运用 Wireshark （一个绝赞的数据包分析工具）

我之前的操作大致如下：

  1. 打开 Wireshark,点击 “capture” 按钮。
  2. （在搜索栏）输入 `udp.port == 53` 作为一个筛选条件，然后键盘点击 Enter。
  3. 在我的终端运行 `ping example.com`（用来生成一个 DNS 查询）。
  4. 点击 DNS 查询（显示“Standard query A example.com”）。
（“A”：查询类型；“example.com”：域名；“Standard query”：查询类型描述）
  5. 右键点击位于左下角面板上的“Domain Name System (query)”。
  6. 点击‘Copy’ ——> ‘as a hex stream’
7. 现在的话
`b96201000001000000000000076578616d706c6503636f6d0000010001`
就留存在了我后台的剪贴板上，之后会用在我的 Ruby 程序里。好欸！     



##### 步骤三：解析 16 进制数据流并发送 DNS 查询

现在我们能够发送我们的 DNS 查询到 `8.8.8.8` 了！就像这样，我们只需要再加 5 行代码：

```

    hex_string = "b96201000001000000000000076578616d706c6503636f6d0000010001"
    bytes = [hex_string].pack('H*')
    sock.send(bytes, 0)

    # get the reply
    reply, _ = sock.recvfrom(1024)
    puts reply.unpack('H*')

```

`[hex_string].pack('H*')` 意思就是将我们的 16 位字符串翻译成一个字节串。此时我们不知道这组数据到底是什么意思但是很快我们就会知道了。

我们还可以借此机会运用 `tcpdump` ，确认程序是否正常进行以及发送有效数据。我是这么做的：

  1. 在一个终端选项卡下执行 `sudo tcpdump -ni any port 53 and host 8.8.8.8` 语句
  2. 在另一个不同的终端指标卡下，运行[这个程序][3]（`ruby dns-1.rb`）



以下是输出结果：

```

    $ sudo tcpdump -ni any port 53 and host 8.8.8.8
    08:50:28.287440 IP 192.168.1.174.12345 > 8.8.8.8.53: 47458+ A? example.com. (29)
    08:50:28.312043 IP 8.8.8.8.53 > 192.168.1.174.12345: 47458 1/0/0 A 93.184.216.34 (45)

```

非常棒 —— 我们可以看到 DNS 请求（”这个 `example.com` 的 IP 地址在哪里？“）以及响应（“在93.184.216.34”）。所以一切运行正常。现在只需要（你懂的）—— 搞清我们是如何生成并解析这组数据的。

##### 步骤四：学一点点 DNS 查询是怎样布局的

现在我们有一个关于 `example.com` 的 DNS 查询，让我们了解它的含义。

下方是我们的查询（16 位进制格式）：

```

    b96201000001000000000000076578616d706c6503636f6d0000010001

```

如果你在 Wireshark 上搜索，你就能看见这个查询它由两部分组成：

  * **请求头** **the header**（`b96201000001000000000000`）
  * **语句本身** **the question**（`076578616d706c6503636f6d0000010001`）



##### 步骤五：制作请求头 the header

我们这一步的目标就是制作字节串 `b96201000001000000000000`（借助一个 Ruby 函数 而不是把它硬编码出来）
（硬编码（hardcode）：指在软件实现上，将输出或输入的相关参数（例如：路径、输出的形式或格式）直接以**常量**的方式撰写在源代码中，而非在运行期间由外界指定的设置、资源、数据或格式做出适当回应。）

那么：请求头是 12 个字节。那些个 12 字节到底意味着什么呢？如果你在 Wireshark 里看看（亦或者阅读 [RFC-1035][4]），你就能理解：它是由 6 个 2 字节大小的数字串联在一起组成的。

这六个数字与查询的 ID、标志、问题计数、回答资源记录数、权威名称服务器记录数、附加资源记录数在一个数据包内。

我们不需要在意这些都是些什么东西 —— 我们只需要把这六个数字输进去就行。

但所幸我们知道该输哪六位数，因为我们就是为了直观地生成字符串`b96201000001000000000000`。

所以这里有一个制作请求头的函数（注意：这里没有`return`，因为在Ruby语言里，如果处在函数最后一行是不需要写`return`语句的）：

```

    def make_question_header(query_id)
      # id, flags, num questions, num answers, num auth, num additional
      [query_id, 0x0100, 0x0001, 0x0000, 0x0000, 0x0000].pack('nnnnnn')
    end

```

上面内容非常的短，主要因为除了查询 ID ，其余所有内容都由我们硬编码写了出来。

##### 什么是 `nnnnnn`?

可能能想知道在`.pack('nnnnnn')`中的`nnnnnn`是个什么意思。那是一个向`.pack()`解释如何将那个 6 个数字组成的数据转换成一个字节串的一个格式字符串。

[`.pack` 的文件在这里][5]，其中描述了`n`的含义其实是“将其表示为‘16 位无符号，网络（大端序）字节序’”。
（大端序（Big-endian）：指将高位字节存储在低地址,低位字节存储在高地址的方式。）

16 比特等同于 2 字节，同时我们需要用网络字节序，因为这属于计算机网络范畴。我不会再去解释什么是字节序了（尽管我确实有[一本尝试去描述它的自制漫画][6]）

##### 测试请求头代码

让我们快速检测一下我们的 `make_question_header` 函数运行情况。

```

    puts make_question_header(0xb962) == ["b96201000001000000000000"].pack("H*")

```

这里运行后输出“true”的话，我们就赢了。

好了我们接着继续。

##### 步骤五：为域名进行编码

下一步我们需要生成**问题本身**（“`example.com` 的 IP 是什么？“）。这里有三个部分：

  * **域名**（比如说“example.com”）
  * **查询类型**（比如说”A“代表”IPv4**A**ddress“）
  * **查询类**（和第二条类似，1代表 **IN**（**IN**ternet））

以上三个中麻烦的就是域名，让我们写个函数对付这个。

`example.com` 以 16 进制被编码进一个 DNS 查询中，如`076578616d706c6503636f6d00`。这有什么含义吗？

如果我们把这些字节以 ASCII 值翻译出来，结果会是这样：

```

    076578616d706c6503636f6d00
     7 e x a m p l e 3 c o m 0

```

你看每一个片段（像`example`) 的前面都会显示它的长度（像`7`）。

下面是有关将`example`翻译成`7 e x a m p l e 3 c o m 0`的Ruby 代码：

```

    def encode_domain_name(domain)
      domain
        .split(".")
        .map { |x| x.length.chr + x }
        .join + "\0"
    end

```

另外，为结束生成问题本身这一环节，我们只需要在域名结尾追加上它（查询）的类型和类。

##### 步骤六：编写 `make_dns_query`

下面是制作一个 DNS 查询的最终函数：

```

    def make_dns_query(domain, type)
      query_id = rand(65535)
      header = make_question_header(query_id)
      question =  encode_domain_name(domain) + [type, 1].pack('nn')
      header + question
    end

```

[这是目前我们写的所有代码的文件链接dns-2.rb][7] —— 目前仅29行。

##### 接下来是 解析 的阶段

现在我尝试去解析一个 DNS 查询，我们到了个硬核的部分：解析。同样的，我们会将其分成不同部分：

  * 解析一个 DNS 的请求头
  * 解析一个 DNS 的名称
  * 解析一个 DNS 的记录



这几个部分中最难的（可能跟你想的不一样）就是：”解析一个 DNS 的名称“。

##### 步骤七：解析 DNS 的请求头

让我们先从最简单的部分开始。我们之前已经讲过关于它那六个数字是如何串联在一起的了。

那么我们现在要做的就是：

  * 读其首部 12 个字节
  * 将其转换成一个由 6 个数字组成的数组
  * 将这六个数字归于一个类中方便使用



以下是具体进行工作的 Ruby 代码：

```

    class DNSHeader
      attr_reader :id, :flags, :num_questions, :num_answers, :num_auth, :num_additional
      def initialize(buf)
        hdr = buf.read(12)
        @id, @flags, @num_questions, @num_answers, @num_auth, @num_additional = hdr.unpack('nnnnnn')
      end
    end

```

注： `attr_reader` 是 Ruby 里的内容意思是”使这些直接变量像方法一样易用“。所以我们可以调用`header.flags`来查看`@flags`变量。

我们也可以借助`DNSheader(buf)`调用这个，也不差。

让我们往最难的那一步挪挪：解析一个域名。

##### 步骤八：解析一个域名

首先，让我们写其中的一部分：

```

    def read_domain_name_wrong(buf)
      domain = []
      loop do
        len = buf.read(1).unpack('C')[0]
        break if len == 0
        domain << buf.read(len)
      end
      domain.join('.')
    end

```

这里会重复读取一个字节的数据，然后直到读取到长度为0的数据之前，会将长度数据存在一个字符串内。

这里运行正常的话，我们就能在我们的 DNS 响应头第一次看见一个域名（`example.com`）。

##### 关于域名方面的麻烦：压缩！

但当 `example.com` 第二次出现的时候，我们的运行出现了问题 —— 在 Wireshark 中，它报告上显示输出的域的值为含糊不清的2个字节的`c00c`。

这种情况就是所谓的 **DNS 域名压缩**，并且如果我们想再解析其它的响应我们就要先把这个实现完。


这个索性没有**那——么**难。这里 `c00c` 的含义就是：

  * 前两个比特（`0b11.....`）意思是”前面有 DNS 域名压缩！”
  * 而余下的14比特是一个整型。这种情况下的整数为`12`（`0x0c`），意思是”返回至数据包中的第12个字节处，使用在那里找的域名“


如果你想阅读更多有关 DNS 域名压缩之类的内容。我找到了相关更容易让你理解这方面内容的文章：[关于 DNS RFC 的释义][8]。

##### 步骤九：实现 DNS 域名压缩

下面我们需要我们的 `read_domain_name` 有一个更复杂的版本。

如下所示：

```

      domain = []
      loop do
        len = buf.read(1).unpack('C')[0]
        break if len == 0
        if len & 0b11000000 == 0b11000000
          # weird case: DNS compression!
          second_byte = buf.read(1).unpack('C')[0]
          offset = ((len & 0x3f) << 8) + second_byte
          old_pos = buf.pos
          buf.pos = offset
          domain << read_domain_name(buf)
          buf.pos = old_pos
          break
        else
          # normal case
          domain << buf.read(len)
        end
      end
      domain.join('.')

```
这里具体是这么个情况：

  * 如果前两个比特为`0b11` ,那么我们就需要做 DNS 域名压缩。那么：
    * 读取第二个字节并用一点儿算法将其转化为偏移量。

    * 在缓冲区保存当前位置。

    * 在我们计算偏移量的位置上读取域名

    * 在缓冲区存储我们的位置。


可能看起来很乱，但是这是解析 DNS 响应的部分中最难的一处了，我们快搞定了！

##### 一个关于 DNS 压缩的漏洞

有些人可能会说，有恶意行为者可以借助这个代码，通过一个带 DNS 压缩条目的 DNS 响应指向这个响应本身，这样 `read_domain_name` 就会陷入无限循环。我才不会改进它（这个代码已经够复杂了好吗！）但一个真正的 DNS 解析器确实会更巧妙地处理它。比如，这里有个[能够避免在 miekg/dns 中陷入无限循环的代码][9]。

##### 步骤十：解析一个 DNS 查询

你可能在想：”为什么我们需要解析一个 DNS 查询？这是一个响应啊！”

但每一个 DNS 响应有它原本自己的查询，所以我们有必要去解析它。

这是解析 DNS 查询的代码：

```

    class DNSQuery
      attr_reader :domain, :type, :cls
      def initialize(buf)
        @domain = read_domain_name(buf)
        @type, @cls = buf.read(4).unpack('nn')
      end
    end

```

内容不是太多：类型和类各占2个字节。

##### 步骤十一：解析一个 DNS 记录

最让人兴奋的部分 —— DNS 记录是我们的查询数据存放的地方！即这个“rdata 区域”（“记录数据字段”）就是我们会在 DNS 查询对应的响应中获得的 IP 地址所驻留的地方。

代码如下：

```

    class DNSRecord
      attr_reader :name, :type, :class, :ttl, :rdlength, :rdata
      def initialize(buf)
        @name = read_domain_name(buf)
        @type, @class, @ttl, @rdlength = buf.read(10).unpack('nnNn')
        @rdata = buf.read(@rdlength)
      end

```

我们还需要让这个 `rdata` 区域更加可读。记录数据字段的实际用途取决于记录类型 —— 比如一个“A”记录就是一个四个字节的 IP 地址，而一个“CNAME”记录则是一个域名。

所以下面的代码可以让请求数据更可读：
```

      def read_rdata(buf, length)
        @type_name = TYPES[@type] || @type
        if @type_name == "CNAME" or @type_name == "NS"
          read_domain_name(buf)
        elsif @type_name == "A"
          buf.read(length).unpack('C*').join('.')
        else
          buf.read(length)
        end
      end

```

这个函数使用了 `TYPES` 这个哈希表将一个记录类型映射为一个更可读的名称：

```

    TYPES = {
      1 => "A",
      2 => "NS",
      5 => "CNAME",
      # there are a lot more but we don't need them for this example
    }

```

`read.rdata` 中最有趣的一部分可能就是这一行`buf.read(length).unpack('C*').join('.')` —— 像是在说：”嘿！有个 IP 地址4个字节，就将它转换成一组四个数字组成的数组，然后数字互相之间用‘ . ’联个谊吧。”

##### 解析 DNS 响应的收尾工作

现在我们正式准备好解析 DNS 响应了！

工作代码如下所示：

```

    class DNSResponse
      attr_reader :header, :queries, :answers, :authorities, :additionals
      def initialize(bytes)
        buf = StringIO.new(bytes)
        @header = DNSHeader.new(buf)
        @queries = (1..@header.num_questions).map { DNSQuery.new(buf) }
        @answers = (1..@header.num_answers).map { DNSRecord.new(buf) }
        @authorities = (1..@header.num_auth).map { DNSRecord.new(buf) }
        @additionals = (1..@header.num_additional).map { DNSRecord.new(buf) }
      end
    end

```

这里大部分内容就是在调用之前我们写过的其他函数来协助解析 DNS 响应。

如果`@header.num_answers` 的值为2，代码会使用了`(1..@header.num_answers).map` 这个巧妙的结构创建一个包含两个 DNS 记录的数组。（在 Ruby 中可能有些魔幻，但我就是觉得有趣，但愿不会影响可读性。）

我们可以把这段代码整合进我们的主函数中，就像这样：

```

    sock.send(make_dns_query("example.com", 1), 0) # 1 is "A", for IP address
    reply, _ = sock.recvfrom(1024)
    response = DNSResponse.new(reply) # parse the response!!!
    puts response.answers[0]

```

尽管输出结果看起来有点辣眼睛（类似于`#<DNSRecord:0x00000001368e3118>`）所以我们需要编写一些好看的输出代码，提升它的可读性。

##### 步骤十三：对于我们输出的 DNS 记录进行美化

我们需要向 DNS 记录增加一个 `.to_s` 区域从而让它有一个更良好的字符串展示方式。而者只是做为一行方法的代码在 `DNSRecord` 中存在。

```

      def to_s
        "#{@name}\t\t#{@ttl}\t#{@type_name}\t#{@parsed_rdata}"
      end

```

你可能也注意到了我忽略了 DNS 记录中的`class`区域。那是因为它通常都比较同质化（很多都为代表”internet“的 IN）所以我觉得它是个冗余。虽然很多 DNS 工具（像真正的 `dig`）会输出 class。

##### 大功告成！

这是我们最终的主函数：

```

    def main
      # connect to google dns
      sock = UDPSocket.new
      sock.bind('0.0.0.0', 12345)
      sock.connect('8.8.8.8', 53)

      # send query
      domain = ARGV[0]
      sock.send(make_dns_query(domain, 1), 0)

      # receive & parse response
      reply, _ = sock.recvfrom(1024)
      response = DNSResponse.new(reply)
      response.answers.each do |record|
        puts record
      end

```

我不觉得我们还能再补充什么 —— 我们连接、发送一个查询、输出每一个回答，然后退出。完事儿！

```

    $ ruby dig.rb example.com
    example.com   18608   A   93.184.216.34

```

你可以在这里查看最终程序：[dig.rb][2]。可以根据你的喜好给它增加更多特性，就比如说：

  * 为其他查询类型添加美化输出。
  * 输出 DNS 响应时增加“授权”和“可追加”的选项
  * 重试
  * 确保我们看到的 DNS 响应和我们发送查询的响应（ ID 信息必须是对的上的！）



另外如果我再本帖出现了什么错误，就[在推特和我聊聊][10]。（我写的比较赶所以可能还是会有些错误）

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/11/06/making-a-dns-query-in-ruby-from-scratch/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
[2]: https://gist.github.com/jvns/1e5838a53520e45969687e2f90199770
[3]: https://gist.github.com/jvns/aa202b1edd97ae261715c806b2ba7d39
[4]: https://datatracker.ietf.org/doc/html/rfc1035#section-4.1.1
[5]: https://ruby-doc.org/core-3.0.0/Array.html#method-i-pack
[6]: https://wizardzines.com/comics/little-endian/
[7]: https://gist.github.com/jvns/3587ea0b4a2a6c20dcfd8bf653fc11d9
[8]: https://datatracker.ietf.org/doc/html/rfc1035#section-4.1.4
[9]: https://link.zhihu.com/?target=https%3A//github.com/miekg/dns/blob/b3dfea07155dbe4baafd90792c67b85a3bf5be23/msg.go%23L430-L435
[10]: https://twitter.com/b0rk
