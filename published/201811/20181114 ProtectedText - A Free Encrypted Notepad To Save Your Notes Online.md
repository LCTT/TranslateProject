ProtectedText：一个免费的在线加密笔记
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/protected-text-720x340.png)

记录笔记是我们每个人必备的重要技能，它可以帮助我们把自己听到、读到、学到的内容长期地保留下来，也有很多的应用和工具都能让我们更好地记录笔记。下面我要介绍一个叫做 **ProtectedText** 的应用，这是一个可以将你的笔记在线上保存起来的免费的加密笔记。它是一个免费的 web 服务，在上面记录文本以后，它将会对文本进行加密，只需要一台支持连接到互联网并且拥有 web 浏览器的设备，就可以访问到记录的内容。

ProtectedText 不会向你询问任何个人信息，也不会保存任何密码，没有广告，没有 Cookies，更没有用户跟踪和注册流程。除了拥有密码能够解密文本的人，任何人都无法查看到笔记的内容。而且，使用前不需要在网站上注册账号，写完笔记之后，直接关闭浏览器，你的笔记也就保存好了。

### 在加密笔记本上记录笔记

访问 <https://www.protectedtext.com/> 这个链接，就可以打开 ProtectedText 页面了（LCTT 译注：如果访问不了，你知道的）。这个时候你将进入网站主页，接下来需要在页面上的输入框输入一个你想用的名称，或者在地址栏后面直接加上想用的名称。这个名称是一个自定义的名称（例如 <https://www.protectedtext.com/mysite>），是你查看自己保存的笔记的专有入口。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-1.png)

如果你选用的名称还没有被占用，你就会看到下图中的提示信息。点击 “Create” 键就可以创建你的个人笔记页了。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-2.png)

至此你已经创建好了你自己的笔记页面，可以开始记录笔记了。目前每个笔记页的最大容量是每页 750000+ 个字符。

ProtectedText 使用 AES 算法对你的笔记内容进行加密和解密，而计算散列则使用了 SHA512 算法。

笔记记录完毕以后，点击顶部的 “Save” 键保存。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-3.png)

按下保存键之后，ProtectedText 会提示你输入密码以加密你的笔记内容。按照它的要求输入两次密码，然后点击 “Save” 键。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-4.png)

尽管 ProtectedText 对你使用的密码没有太多要求，但毕竟密码总是一寸长一寸强，所以还是最好使用长且复杂的密码（用到数字和特殊字符）以避免暴力破解。由于 ProtectedText 不会保存你的密码，一旦密码丢失，密码和笔记内容就都找不回来了。因此，请牢记你的密码，或者使用诸如 [Buttercup][3]、[KeeWeb][4] 这样的密码管理器来存储你的密码。

在使用其它设备时，可以通过访问之前创建的 URL 就可以访问你的笔记了。届时会出现如下的提示信息，只需要输入正确的密码，就可以查看和编辑你的笔记。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-5.png)

一般情况下，只有知道密码的人才能正常访问笔记的内容。如果你希望将自己的笔记公开，只需要以 <https://www.protectedtext.com/yourSite?yourPassword> 的形式访问就可以了，ProtectedText 将会自动使用 `yourPassword` 字符串解密你的笔记。

ProtectedText 还有配套的 [Android 应用][6] 可以让你在移动设备上进行同步笔记、离线工作、备份笔记、锁定/解锁笔记等等操作。

**优点**

  * 简单、易用、快速、免费
  * ProtectedText.com 的客户端代码可以在[这里][7]免费获取，如果你想了解它的底层实现，可以自行学习它的源代码
  * 存储的内容没有到期时间，只要你愿意，笔记内容可以一直保存在服务器上
  * 可以让你的数据限制为私有或公开开放

**缺点**

  * 尽管客户端代码是公开的，但服务端代码并没有公开，因此你无法自行搭建一个类似的服务。如果你不信任这个网站，请不要使用。
  * 由于网站不存储你的任何个人信息，包括你的密码，因此如果你丢失了密码，数据将永远无法恢复。网站方还声称他们并不清楚谁拥有了哪些数据，所以一定要牢记密码。


如果你想通过一种简单的方式将笔记保存到线上，并且需要在不需要安装任何工具的情况下访问，那么 ProtectedText 会是一个好的选择。如果你还知道其它类似的应用程序，欢迎在评论区留言！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/protectedtext-a-free-encrypted-notepad-to-save-your-notes-online/

作者：[SK][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-4.png
[3]: https://www.ostechnix.com/buttercup-a-free-secure-and-cross-platform-password-manager/
[4]: https://www.ostechnix.com/keeweb-an-open-source-cross-platform-password-manager/
[5]: http://www.ostechnix.com/wp-content/uploads/2018/11/Protected-Text-5.png
[6]: https://play.google.com/store/apps/details?id=com.protectedtext.android
[7]: https://www.protectedtext.com/js/main.js

