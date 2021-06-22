[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12452-1.html)
[#]: subject: (Sending custom emails with Python)
[#]: via: (https://opensource.com/article/19/8/sending-custom-emails-python)
[#]: author: (Brian "bex" Exelbierd https://opensource.com/users/bexelbie)

使用 Mailmerge 发送定制邮件
======

> Mailmerge 是一个可以定制群发邮件的命令行程序，它可以处理简单和复杂的邮件。

![](https://img.linux.net.cn/data/attachment/album/202007/25/233710lqkvko0jdbh1jzul.jpg)

电子邮件还是生活的一部分，尽管有种种不足，它仍然是大多数人发送信息的最佳方式，尤其是在按队列将邮件发送给收件人的自动化方式中。

作为 [Fedora 社区行动和影响协调员][2]，我的工作之一就是给人们发送资助旅行相关的好消息，我经常通过电子邮件做这些事。这里，我将给你展示如何使用 [Mailmerge][3] 向一群人发送定制邮件的，Mailmerge 是一个可以处理简单和复杂的邮件的命令行程序。

### 安装 Mailmerge

在 Fedora 中，Mailmerge 已经打包可用，你可以通过在命令行中运行 `sudo dnf install python3-mailmerge` 来安装它。你还可以使用 `pip` 命令从 PyPi 中安装，具体可以参阅该项目的 [README][4]。

### 配置 Mailmerge

三个配置文件控制着 Mailmerge 的工作模式。运行 `mailmerge --sample`，将生成配置文件模板。这些文件包括：

  * `mailmerge_server.conf:` 这里保存着 SMTP 服务端邮件发送相关详细配置，但你的密码 *不* 在这里保存。
  * `mailmerge_database.csv:` 这里保存每封邮件的定制数据，包括收件人的电子邮件地址。
  * `mailmerge_template.txt:` 这里保存电子邮件的文本，文本中包含占位符，这些占位符会使用 `mailmerge_database.csv` 中的数据替换。

#### Server.conf

配置模板文件 `mailmerge_server.conf` 包含几个大家应该很熟悉的例子。如果你曾经往手机上添加过电子邮件或者设置过桌面电子邮件客户端，那你就应该看到过这些数据。需要提醒的是要记得把你的用户名更新到这个文件中，尤其是在你使用模板所提供的配置时。

#### Database.csv

`mailmerge_database.csv` 这个配置文件稍微有点复杂。最起码要将邮件接收者的电子邮件地址保存在这里，其它在电子邮件中任何需要替换的定制信息也要保存在这里。推荐在创建本文件的占位符列表时，同步编辑 `mailmerge_template.txt` 文件。我发现一个有效的做法是，使用电子表格软件录入这些数据，完成后导出为 CSV 文件。使用下面的示例文件:

```
email,name,number
myself@mydomain.com,"Myself",17
bob@bobdomain.com,"Bob",42
```

可以你向这两个人发送电子邮件，使用他们的名字并告诉他们一个数字。这个示例文件虽然不是特别有趣，但应用了一个重要的原则，那就是：始终让自己处于邮件接收列表的首位。这样你可以在向列表全员发送邮件之前，先给自己发送一个测试邮件，以验证邮件的效果是否如你预期。

任何包含半角逗号的值，都 **必须** 以半角双引号（`"`）封闭。如果恰好在半角双引号封闭的区域需要有一个半角双引号，那就在同一行中连续使用两个半角双引号。引号的规则比较有趣，去 [Python 3 中关于 CSV 的内容中][7] 一探究竟吧。

#### Template.txt

我的工作之一，就是为我们 Fedora 贡献者会议 [Flock][8] 发送与旅行基金有关的信息。通过简单的邮件告诉有关的人，他被选中为旅行基金支持的幸运者，以及相应基金支持的详细信息。与接收者相关的具体信息之一就是我们可以为他的旅行提供多少资助。下面是一份我的节略后的模板文件（为了简洁，已经移除大量的文本）：

```
$ cat mailmerge_template.txt
TO: {{Email}}
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd <bexelbie@redhat.com>


Hi {{Name}},


I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:


Travel Budget: {{Travel_Budget}}


<<snip>>
```

模板的起头定义了邮件的接收者、发送者和主题。在空行之后，是邮件的内容。该邮件需要从 `database.csv` 文件中获取接收者的 `Email` 、`Name` 和 `Travel_Budget` 。注意，上述这些占位符是由双大括弧（ `{{`、`}}` ）封闭的。相应的 `mailmerge_database.csv` 如下:

```
$ cat mailmerge_database.csv
Name,Email,Travel_Budget
Brian,bexelbie@redhat.com,1000
PersonA,persona@fedoraproject.org,1500
PèrsonB,personb@fedoraproject.org,500
```

注意，我把自己的信息放在了首条，这是为了测试方便。除了我，还有另外两个人的信息在文档中。列表中的第二个人 PèrsonB，他的名字中有一个包含变音符号的字母，Mailmerge 会对这类字母自动编码。

以上包含了模板的全部知识点：写上你自己的电子邮件信息，并编写好以双大括弧封闭的占位符。接下来创建用来提供前述占位符具体值的数据文件。现在测试一下电子邮件的效果。

### 测试并发送简单邮件

#### 试运行

测试从邮件的试运行开始，试运行就是讲邮件内容显示出来，所有的占位符都会被具体值取代。默认情况下，如果你运行不带参数的命令 `mailmerge`，它将对收件列表中的第一个人进行试运行:

```
$ mailmerge
>>> encoding ascii
>>> message 0
TO: bexelbie@redhat.com
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd <bexelbie@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Sat, 20 Jul 2019 18:17:15 -0000


Hi Brian,


I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:


Travel Budget: 1000


<<snip>>


>>> sent message 0 DRY RUN
>>> No attachments were sent with the emails.
>>> Limit was 1 messages.  To remove the limit, use the --no-limit option.
>>> This was a dry run.  To send messages, use the --no-dry-run option.
```

从试运行生成的邮件中（列表中的 `message 0` ，和计算机中很多计数场景一样，计数从 0 开始），可以看到我的名字及旅行预算是正确的。如果你想检视所有的邮件，运行 `mailmerge --no-limit`，告诉 Mailmerge 不要仅仅处理第一个收件人的信息。下面是第三个收件人邮件的试运行结果，用来测试特殊字符的编码：

```
>>> message 2
TO: personb@fedoraproject.org
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd <bexelbie@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jul 2019 18:22:48 -0000


Hi P=E8rsonB,
```

没有问题，`P=E8rsonB` 是 `PèrsonB` 的编码形式。

#### 发送测试信息

现在，运行 `mailmerge --no-dry-run`，Mailmerge 将向收件人列表中的第一个人发送电子邮件:

```
$ mailmerge --no-dry-run
>>> encoding ascii
>>> message 0
TO: bexelbie@redhat.com
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd <bexelbie@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Sat, 20 Jul 2019 18:25:45 -0000


Hi Brian,


I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:


Travel Budget: 1000


<<snip>>


>>> Read SMTP server configuration from mailmerge_server.conf
>>>   host = smtp.gmail.com
>>>   port = 587
>>>   username = bexelbie@redhat.com
>>>   security = STARTTLS
>>> password for bexelbie@redhat.com on smtp.gmail.com:
>>> sent message 0
>>> No attachments were sent with the emails.
>>> Limit was 1 messages.  To remove the limit, use the --no-limit option.
```

在倒数第 4 行，它将要求你输入你的密码。如果你使用的是双因素认证或者域控制登录，那就需要创建应用密码来绕过这些控制。如果你使用的是 Gmail 或者类似的系统，可以直接在界面上完成密码验证。如果不行的话，联系你的邮件系统管理员。上述这些操作不会影响邮件系统的安全性，但是仍然有必要采用复杂的安全性好的密码。

我在我的邮件收件箱中，看到了这封格式美观的测试邮件。如果测试邮件看起来没有问题，那就可以运行 `mailmerge --no-dry-run --no-limit` 发送所有的邮件了。

### 发送复杂邮件

只有充分了解了 [Jinja2 模板][12] ，你才可能充分领略 Mailmerge 真正的威力。在邮件模板中使用条件语句及附带附件，是很有用的。下面就是一个复杂邮件的模板及对应的数据文件：

```
$ cat mailmerge_template.txt
TO: {{Email}}
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd <bexelbie@redhat.com>
ATTACHMENT: attachments/{{File}}


Hi {{Name}},


I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:


Travel Budget: {{Travel_Budget}}
{% if Hotel == "Yes" -%}
Lodging: Lodging in the hotel Wednesday-Sunday (4 nights)
{%- endif %}


<<snip>>


$ cat mailmerge_database.csv
Name,Email,Travel_Budget,Hotel,File
Brian,bexelbie@redhat.com,1000,Yes,visa_bex.pdf
PersonA,persona@fedoraproject.org,1500,No,visa_person_a.pdf
PèrsonB,personb@fedoraproject.org,500,Yes,visa_person_b.pdf
```

在这个邮件中有两项新内容。首先是附件，我需要向参加国际旅行的人发送签证邀请信，帮助他们来 Flock，文件头的 `ATTACHMENT` 部分说明了要包含什么文件；为了保持我的文档目录清晰，我将所有需要作为附件的文档保存于附件子目录下。其次是包含了关于宾馆的条件信息，因为有些人的旅行资金包含了住宿费用，我需要对涉及住宿的人员诉及相关信息，而这是通过 `if` 判断实现的:

```
{% if Hotel == "Yes" -%}
Lodging: Lodging in the hotel Wednesday-Sunday (4 nights)
{%- endif %}
```

这和大多数编程语言中的 `if` 判断是一样的。Jinja2 实力非凡，可以实现多级判断。通过包含数据元素控制邮件内容，能大大简化相关的日常工作。空格的正确使用对邮件的易读性很重要。`if` 和 `endif` 语句中的短线（ `-` ）是 Jinja2 控制 [空白字符][13] 的一部分。这里面选项很多，所以还是要通过试验找到最适合自己的方式。

在上面的例子中，我在数据文件扩充了 `Hotel` 和 `File` 两个字段，这些字段的值控制着宾馆信息和附件文件名。另外，在上例中，我和 PèrsonB 有住宿资助，但 PersonA 没有。

对于简单邮件和复杂邮件而言，试运行及正式发送邮件的操作都是相同的。快去试试吧！

你还可以尝试在邮件头中使用条件判断（ `if` … `endif` ），比如你可以使发送给在数据库中的某人的邮件包含附件，或者改变对部分人改变发送人的信息。

### Mailmerge 的优点

Mailmerge 是用来批量发送定制邮件的简洁而高效的工具。每个人只接受到他需要的信息，其它额外的操作和细节都是透明的。

我还发现，即使是在发送简单的集团邮件时，相对于使用 CC 或者 BCC 向一组受众发送一封邮件，采用 Mailmerge 也是非常高效的。很多人使用了邮件过滤，那些不是直接发给他们的邮件，他们一律不会立刻处理。使用 Mailmerge 保证了每名接收者收到的就是自己的邮件。所有的信息会对接收者进行正确过滤，再也不会有人无意间回复到整个邮件组。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/sending-custom-emails-python

作者：[Brian "bex" Exelbierd][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bexelbie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://docs.fedoraproject.org/en-US/council/fcaic/
[3]: https://github.com/awdeorio/mailmerge
[4]: https://github.com/awdeorio/mailmerge#install
[5]: mailto:myself@mydomain.com
[6]: mailto:bob@bobdomain.com
[7]: https://docs.python.org/3/library/csv.html
[8]: https://flocktofedora.org/
[9]: mailto:bexelbie@redhat.com
[10]: mailto:persona@fedoraproject.org
[11]: mailto:personb@fedoraproject.org
[12]: http://jinja.pocoo.org/docs/latest/templates/
[13]: http://jinja.pocoo.org/docs/2.10/templates/#whitespace-control
