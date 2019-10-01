[#]: collector: "lujun9972"
[#]: translator: "PsiACE"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11396-1.html"
[#]: subject: "Building a Messenger App: Schema"
[#]: via: "https://nicolasparada.netlify.com/posts/go-messenger-schema/"
[#]: author: "Nicolás Parada https://nicolasparada.netlify.com/"

构建一个即时消息应用（一）：模式
========

![](https://img.linux.net.cn/data/attachment/album/201909/27/211458n44f7jvp77lfxxm0.jpg)

这是一系列关于构建“即时消息”应用的新帖子。你应该对这类应用并不陌生。有了它们的帮助，我们才可以与朋友畅聊无忌。[Facebook Messenger][1]、[WhatsApp][2] 和 [Skype][3] 就是其中的几个例子。正如你所看到的那样，这些应用允许我们发送图片、传输视频、录制音频、以及和一大帮子人聊天等等。当然，我们的教程应用将会尽量保持简单，只在两个用户之间发送文本消息。

我们将会用 [CockroachDB][4] 作为 SQL 数据库，用 [Go][5] 作为后端语言，并且用 JavaScript 来制作 web 应用。

这是第一篇帖子，我们将会讲述数据库的设计。

```
CREATE TABLE users (
    id SERIAL NOT NULL PRIMARY KEY,
    username STRING NOT NULL UNIQUE,
    avatar_url STRING,
    github_id INT NOT NULL UNIQUE
);
```

显然，这个应用需要一些用户。我们这里采用社交登录的形式。由于我选用了 [GitHub][6]，所以这里需要保存一个对 GitHub 用户 ID 的引用。

```
CREATE TABLE conversations (
    id SERIAL NOT NULL PRIMARY KEY,
    last_message_id INT,
    INDEX (last_message_id DESC)
);
```

每个对话都会引用最近一条消息。每当我们输入一条新消息时，我们都会更新这个字段。我会在后面添加外键约束。

… 你可能会想，我们可以先对对话进行分组，然后再通过这样的方式获取最近一条消息。但这样做会使查询变得更加复杂。

```
CREATE TABLE participants (
    user_id INT NOT NULL REFERENCES users ON DELETE CASCADE,
    conversation_id INT NOT NULL REFERENCES conversations ON DELETE CASCADE,
    messages_read_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, conversation_id)
);
```

尽管之前我提到过对话只会在两个用户之间进行，但我们还是采用了允许向对话中添加多个参与者的设计。因此，在对话和用户之间有一个参与者表。

为了知道用户是否有未读消息，我们在消息表中添加了“读取时间”（`messages_read_at`）字段。每当用户在对话中读取消息时，我们都会更新它的值，这样一来，我们就可以将它与对话中最后一条消息的“创建时间”（`created_at`）字段进行比较。

```
CREATE TABLE messages (
    id SERIAL NOT NULL PRIMARY KEY,
    content STRING NOT NULL,
    user_id INT NOT NULL REFERENCES users ON DELETE CASCADE,
    conversation_id INT NOT NULL REFERENCES conversations ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    INDEX(created_at DESC)
);
```

尽管我们将消息表放在最后，但它在应用中相当重要。我们用它来保存对创建它的用户以及它所出现的对话的引用。而且还可以根据“创建时间”（`created_at`）来创建索引以完成对消息的排序。

```
ALTER TABLE conversations
ADD CONSTRAINT fk_last_message_id_ref_messages
FOREIGN KEY (last_message_id) REFERENCES messages ON DELETE SET NULL;
```

我在前面已经提到过这个外键约束了，不是吗:D

有这四张表就足够了。你也可以将这些查询保存到一个文件中，并将其通过管道传送到 Cockroach CLI。

首先，我们需要启动一个新节点：

```
cockroach start --insecure --host 127.0.0.1
```

然后创建数据库和这些表：

```
cockroach sql --insecure -e "CREATE DATABASE messenger"
cat schema.sql | cockroach sql --insecure -d messenger
```

这篇帖子就到这里。在接下来的部分中，我们将会介绍「登录」，敬请期待。

- [源代码][7]

---

via: https://nicolasparada.netlify.com/posts/go-messenger-schema/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[PsiACE](https://github.com/PsiACE)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://www.messenger.com/
[2]: https://www.whatsapp.com/
[3]: https://www.skype.com/
[4]: https://www.cockroachlabs.com/
[5]: https://golang.org/
[6]: https://github.com/
[7]: https://github.com/nicolasparada/go-messenger-demo
