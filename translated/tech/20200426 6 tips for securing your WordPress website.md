[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 tips for securing your WordPress website)
[#]: via: (https://opensource.com/article/20/4/wordpress-security)
[#]: author: (Lucy Carney https://opensource.com/users/lucy-carney)

保护 WordPress 网站的 6 个提示
======
即使初学者也可以并且应该采取这些步骤来保护他们的 WordPress 网站免受网络攻击。

![A lock on the side of a building][1]

已经驱动了互联网 30% 的网站，不难看出， WordPress 是世界上增长最快的 <ruby>CMS<rt>内容管理系统</rt></ruby>。通过大量可用的定制化代码和插件，顶级的 <ruby>SEO<rt>搜索引擎优化</rt></ruby> ，和一个在博客界超高的美誉度，WordPress 确实赢得了它的流行度。

然而，随着流行度而来的，还有些不太吸引人的注意。WordPress 是入侵者，恶意软件和网络攻击的常规目标，事实上，在2019年，WordPress 遭受了大约 [<ruby>CMS<rt>内容管理系统</rt></ruby> 平台 90% 的黑客攻击][2].

无论你是 WordPress 新用户或者有经验的开发者，这里有一些你可以采取的重要步骤来保护你的 WordPress 网站。以下 6 个关键提示将帮助你开始。


### 1\. 选择可靠的托管主机

主机是所有网站无形的基础，没有它，你不能在线发布你的网站。但是主机比起简单的托管你的网站还能做的更多。它也要对你的网站速度，性能和安全负责。

第一件要做的事情就是检查主机在它的套餐中是否包含 SSL 安全协议。

无论你是运行一个小博客或是一个大的在线商店，SSL 协议都是所有网站必需的安全功能。如果你正在进行线上交易，你还需要 [高级 SSL 数字证书][3] ，但是对大多数网站来说，基本免费的 SSL 协议就很好了。


其他的安全功能包括以下几种：

  * 日常的自动离线网站备份
  * 恶意软件和杀毒软件扫描和删除
  * <ruby>DDOS<rt>分布式服务攻击</rt></ruby>保护
  * 实时网络检测
  * 高级防火墙保护


另外除了这些数字安全功能之外，你的主机供应商的 _物理_ 安全措施也是值得考虑的。这些包括安全警卫，<ruby>CCTV<rt>闭路电视</rt></ruby>和二次验证或生物识别来限制对数据中心的访问。

### 2\. 使用安全插件

保护你的网站安全最有效且容易的方法之一是安装一个安全插件，比如 [Sucuri][4] 这样的具有 GPLv2 许可项目的开源软件，安全插件是非常重要的，因为他们能自动化管理安全，这意味着你能够集中精力运行好你的网站而不是花大量的时间来与在线网站的威胁作斗争。

这些插件探测到并阻止恶意攻击并关于这些问题警告你来获取你的注意。简言之，它们持续在后台运行保护你的网站，意味着你不必保持7天24小时保持清醒与黑客，漏洞和其他数字垃圾斗争。

一个好的安全插件会免费提供给你所有必要的安全功能，但是一些高级功能区要付费订阅。举个例子，如果你想要解锁 [Sucuri 的网站防火墙l][5] ，你需要付费。开启 <ruby>WAF<rt>网络程序防火墙</rt></ruby> 阻挡常规威胁然后给你的网站加入一个额外的安全层，所以当选择安全插件的时候，寻找这个功能是一个好的主意。

### 3\. 选择值得信任的插件和主题

WordPress 的快乐在于它是开源的，所以任何人，每个人都能加入他们开发的主题和插件。当选择高质量的主题和插件时，这也抛出一些问题。

在加入免费主题或插件时，有一些是设计较为差的或者糟糕的，可能会隐藏恶意代码。

为了避免这种情况，始终从可靠的来源来获取免费主题和插件，比如 WordPress 主题库。阅读评论并研究查看开发者是否编译了一些其他的程序。

过期和设计较差的主题和插件可能留有 "后门" 对袭击者开放或者存在进入你网站的漏洞，这就是为什么选择时要谨慎。然而，你也应该提防无效或者被破解的主题。这些高级主题已经被黑客重新编译并非法销售。你可能会相信买一个无效的主题，它看起来没什么问题，但会通过隐藏的恶意代码破坏你的网站。

为了避免无效主题，不要被打折的价格所吸引，始终坚持可靠的主题商店，比如官方的 [WordPress 目录][6]。如果你要找其他的主题，坚持找大的且信任的商店，比如 [Themify][7] ，自从 2010 年，这个主题和插件商店就已经在经营了。Themify 确保它的所有 WordPress 主题通过 [<ruby>Google Mobile-Friendly<rt>谷歌友好移动</rt></ruby>][8] 测试和 [<ruby>GNU<rt>通用公共许可证</rt></ruby>][9]。

### 4\. 运行日常更新

这是 WordPress 的基本规则： _始终保持你的网站最新._ 然而，不是所有人都坚持了这个规则，只有 [43% 的 WordPress 网站][10] 是运行的最新版本。

问题是当你的网站过期的时候，由于它在安全和性能修复方面的原因，故障，漏洞，入侵和破坏会变得更加容易出现。过期的网站不能修复漏洞，而更新过的可以，攻击者能够分辨出哪些网站是过期的。这意味着他们能够依此来搜索最易受攻击的网站并袭击它们。

这就是为什么你始终要运行最新的 WordPress 版本的原因。为了保持网站安全是最强的，你必须更新你的插件和主题以及你的核心 WordPress 软件。

如果你选择一个可管理的 WordPress 托管套餐，你可能会发现你的提供商会检查并运行你的主机是否提供的软件 _和_ 插件更新。如果没有，你可以安装一个开源插件管理器。比如 GPLv2 许可的 [Easy Updates Manager plugin][11] 作为替代品。

### 5\. 强化你的登录


除了通过仔细选择主题和安装安全插件来创建一个安全的 WordPress 网站外，你还需要防止未经授权的登录访问。

#### 密码保护

如果你在使用 [容易猜到的短语][12] 比如 "123456" 或 "qwerty" ，第一步要做的增强登录安全最简单的方法是更改你特定的密码。

尝试使用一个长密码段而不是一个单词，这样他们很难破解。最好的方式是用一系列你容易记住且不相关的单词合并加强。

这里有一些其它的提示：

  * Never reuse passwords 绝不要重复使用密码
  * 密码不要包括像家庭成员的名字或者你喜欢的球队等明显的单词
  * 不要和任何人分享你的登录信息
  * 你的密码段要包括大小写和数字来增加复杂程度
  * 不要在任何地方写下或者存储你的登录信息
  * 使用 [密码管理器][13]



#### 变更你的登录地址

将标准格式的默认登录网址变更是一个好的主意：yourdomain.com/wp-admin。 这是因为黑客知道这是缺省登录网址，所以不变更会有暴力破解的风险。

为避免这种情况，变更登录网址到和以前有些不同。使用开源插件比如 GPLv2 许可的 [WPS Hide Login][14] 会更加安全，快速和轻松的自定义登录地址。


#### 应用二次验证

对于额外阻止未授权的登录和暴力破解，你应该添加二次验证。这意味着即使有人 _确实_ 访问到你的登录信息，但是他们还需要一个直接发送到你手机的验证码来获得存取 WordPress 网站管理的权限。

添加二次验证是非常容易的，简单的安装另一个插件，在 WordPress 插件目录搜索 "二次验证" ，然后选择你要的插件。一个选择是  [Two Factor][15] ，这是比较火的  GPLv2 许可的插件，已经超过 10000 安装次数。


#### 限制登录尝试

WordPress 通过让你多次猜你的登录信息来尝试帮助你登录。然而，这对黑客尝试获取未授权访问 WordPress网站释放恶意代码也是有帮助的。

为了应对暴力破解，安装插件来限制登录尝试并设置你要允许猜解的次数。

### 6\. 禁用文件编辑功能

这不是对初学者友好的步骤，所以不要尝试除非你是个自信的码农并且一直优先备份你的网站。

那就是说，如果关于保护你的 WordPress 网站是认真的，禁用文件编辑功能 _是_ 一个重要的措施 。如果你不隐藏你的文件，它意味着任何人从管理员区域都可以编辑你的主题和插件代码，如果入侵者进入，那就危险了。

为了拒绝未授权的访问，转到你的 **wp-config.php** 文件并打开：


```
&lt;Files wp-config.php&gt;
order allow,deny
deny from all
&lt;/Files&gt;
```

或者，从你的 WordPress 管理区直接删除主题和插件的编辑选项，通过添加编辑你的 **wp-config.php** 文件：


```
`define( 'DISALLOW_FILE_EDIT', true );`
```

一旦你保存并重新加载这个文件，插件和主题编辑器将会从你的 WordPress 管理区菜单中消失，阻止任何人编辑你的主题或者插件代码，包括你自己 **.** 当你禁用编辑的状态下，需要恢复访问你的主题和插件代码的时候，只需要删除你添加在 **wp-config.php** 文件中的代码即可。

无论你阻止未授权的访问还是总的禁用文件编辑功能，采取保护你网站代码的行动是重要的。否则，不受欢迎的访问者编辑你的文件并添加新代码是很容易的。这意味着袭击者可以使用编辑器从你的 WordPress 站点来获取数据或者甚至利用你的网站对其他站点发起攻击。

隐藏文件更容易的方式是利用安全插件来为你服务，比如 Sucuri 。

### WordPress 安全概要

WordPress是一个优秀的开源平台，初学者和开发者都应该享受它，而不用担心成为攻击的受害者。遗憾的是，这些威胁不会去任何地方，保持网站的安全性至关重要。

利用以上措施，你可以创建一个更加强壮，更高安全保护级别的 WordPress 站点并确保给自己带来更好的使用体验。

保持安全是一个持续的任务而不是一次性的检查清单，所以当搭建和使用 <ruby>CMS<rt>内容管理系统</rt></ruby> 时，一定要在日常中回顾这些步骤并保持警惕。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/wordpress-security

作者：[Lucy Carney][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lucy-carney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://cyberforces.com/en/wordpress-most-hacked-cms
[3]: https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority
[4]: https://wordpress.org/plugins/sucuri-scanner/
[5]: https://sucuri.net/website-firewall/
[6]: https://wordpress.org/themes/
[7]: https://themify.me/
[8]: https://developers.google.com/search/mobile-sites/
[9]: http://www.gnu.org/licenses/gpl.html
[10]: https://wordpress.org/about/stats/
[11]: https://wordpress.org/plugins/stops-core-theme-and-plugin-updates/
[12]: https://www.forbes.com/sites/kateoflahertyuk/2019/04/21/these-are-the-worlds-most-hacked-passwords-is-yours-on-the-list/#4f157c2f289c
[13]: https://opensource.com/article/16/12/password-managers
[14]: https://wordpress.org/plugins/wps-hide-login/
[15]: https://en-gb.wordpress.org/plugins/two-factor/
