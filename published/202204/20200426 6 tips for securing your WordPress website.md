[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14522-1.html)
[#]: subject: (6 tips for securing your WordPress website)
[#]: via: (https://opensource.com/article/20/4/wordpress-security)
[#]: author: (Lucy Carney https://opensource.com/users/lucy-carney)

保护 WordPress 网站的 6 个技巧
======

> 即使初学者也可以，并且应该采取这些步骤来保护他们的 WordPress 网站免受网络攻击。

![](https://img.linux.net.cn/data/attachment/album/202204/29/154648l33xt7xg6gk2nr8v.jpg)

WordPress 已经驱动了互联网 30% 的网站，它是世界上增长最快的 <ruby>内容管理系统<rt>content management system</rt></ruby>（CMS），而且不难看出原因：通过大量可用的定制化代码和插件、一流的 <ruby>搜索引擎优化<rt>Search Engine Optimization</rt></ruby>（SEO），以及在博客界超高的美誉度，WordPress 赢得了很高的知名度。

然而，随着知名度而来的，也带来一些不太好的关注。WordPress 是入侵者、恶意软件和网络攻击的常见目标，事实上，在 2019 年被黑客攻击的 CMS 中，WordPress [约占 90%][2]。

无论你是 WordPress 新用户或者有经验的开发者，这里有一些你可以采取的重要步骤来保护你的 WordPress 网站。以下 6 个关键技巧将帮助你起步。

### 1、选择可靠的托管主机

主机是所有网站无形的基础，没有它，你不能在线发布你的网站。但是主机的作用远不止起简单的托管你的网站，它也要对你的网站速度、性能和安全负责。

第一件要做的事情就是检查主机在它的套餐中是否包含 SSL 安全协议。

无论你是运行一个小博客或是一个大的在线商店，SSL 协议都是所有网站必需的安全功能。如果你正在进行线上交易，你还需要 [高级 SSL 数字证书][3] ，但是对大多数网站来说，基本免费的 SSL 证书就很好了。

其他需要注意安全功能包括以下几种：

  * 日常的自动离线网站备份
  * 恶意软件和杀毒软件扫描和删除
  * <ruby>分布式服务攻击<rt>Distributed denial of service</rt></ruby>（DDOS）保护
  * 实时网络监控
  * 高级防火墙保护

另外除了这些数字安全功能之外，你的主机供应商的 _物理_ 安全措施也是值得考虑的。这些包括用安全警卫、闭路监控和二次验证或生物识别来限制对数据中心的访问。

### 2、使用安全插件

保护你的网站安全最有效且容易的方法之一是安装一个安全插件，比如 [Sucuri][4]，它是一个 GPLv2 许可的开源软件。安全插件是非常重要的，因为它们能将安全管理自动化，这意味着你能够集中精力运行你的网站，而不是花大量的时间来与在线威胁作斗争。

这些插件探测、阻止恶意攻击，并提醒你需要注意的任何问题。简言之，它们持续在后台运行，保护你的网站，这意味着你不必保持 7 天 24 小时地保持清醒，与黑客、漏洞和其他数字垃圾斗争。

一个好的安全插件会免费提供给你所有必要的安全功能，但是一些高级功能需要付费订阅。举个例子，如果你想要解锁 [Sucuri 的网站防火墙][5] ，你就需要付费。开启 <ruby>网站应用防火墙<rt>web application firewall</rt></ruby>（WAF）阻挡常见的威胁，并为给你的网站添加一个额外的安全层，所以当选择安全插件的时候，寻找带有这个功能的插件是一个好的主意。

### 3、选择值得信任的插件和主题

WordPress 的快乐在于它是开源的，所以任何人、每个人都能提供他们开发的主题和插件。但当选择高质量的主题和插件时，这也抛出一些问题。

在挑选免费的主题或插件时，有一些设计较差，或者更糟糕的是，可能会隐藏恶意代码。

为了避免这种情况，始终从可靠的来源来获取免费主题和插件，比如 WordPress 主题库。阅读对它的评论，并研究查看开发者是否构建过其他的程序。

过时的或设计不良的主题和插件可以为攻击者进入你的网站留下“后门”或错误，这就是为什么选择时要谨慎。然而，你也应该提防无效或者破解的主题。这些已经黑客破坏了的高级主题被非法销售。你可能会购买一个无效的主题，它看起来没什么问题，但会通过隐藏的恶意代码破坏你的网站。

为了避免无效主题，不要被打折的价格所吸引，始终坚持可靠的主题商店，比如官方的 [WordPress 目录][6]。如果你在其它地方寻找，坚持选择大型且值得信任的商店，比如 [Themify][7] ，这个主题和插件商店自从 2010 年就已经在经营了。Themify 确保它的所有 WordPress 主题通过了 <ruby>[谷歌友好移动][8]<rt>Google Mobile-Friendly</rt></ruby> 测试，并在 [GNU 通用公共许可证][9] 下开源。

### 4、运行定期更新

这是 WordPress 的基本规则： 始终保持你的网站最新。然而，不是所有人都坚持了这个规则，只有 [43% 的 WordPress 网站][10] 运行的是最新版本。

问题是，当你的网站过期的时候，由于它在安全和性能修复方面落后的原因，容易受到故障、漏洞、入侵和崩溃的影响。过期的网站不能像更新的网站一样修复漏洞，攻击者能够分辨出哪些网站是过期的。这意味着他们能够依此来搜索最易受攻击的网站并袭击它们。

这就是为什么你始终要运行最新的 WordPress 版本的原因。为了保持网站安全处于最强的状态，你必须更新你的插件和主题，以及你的核心 WordPress 软件。

如果你选择一个受管理的 WordPress 托管套餐，你可能会发现你的供应商会为你检查并运行更新，以了解你的主机是否提供了软件和插件更新。如果没有，你可以安装一个开源插件管理器。比如 GPLv2 许可的 [Easy Updates Manager plugin][11] 作为替代品。

### 5、强化你的登录

除了通过仔细选择主题和安装安全插件来创建一个安全的 WordPress 网站外，你还需要防止未经授权的登录访问。

#### 密码保护

如果你在使用 [容易猜到的短语][12] 比如 “123456” 或 “qwerty” ，第一步要做的增强登录安全最简单的方法是更改你的密码。

尝试使用一个长的密码而不是一个单词，这样它们很难被破解。最好的方式是用一系列你容易记住且不相关的单词合并起来。

这里有一些其它的提示：

  * 绝不要重复使用密码
  * 密码不要包括像家庭成员的名字或者你喜欢的球队等明显的单词
  * 不要和任何人分享你的登录信息
  * 你的密码要包括大小写和数字来增加复杂程度
  * 不要在任何地方写下或者存储你的登录信息
  * 使用 [密码管理器][13]

#### 变更你的登录地址

将默认登录网址从标准格式 `yourdomain.com/wp-admin` 变更是一个好主意。这是因为黑客也知道这个缺省登录网址，所以不变更它会有被暴力破解的风险。

为避免这种情况，可以将登录网址变更为不同的网址。使用开源插件比如 GPLv2 许可的 [WPS Hide Login][14] 可以更加安全、快速和轻松的自定义登录地址。

#### 应用双因素认证

为了提供更多的保护，阻止未授权的登录和暴力破解，你应该添加双因素认证。这意味着即使有人 _确实_ 得到了你的登录信息，但是他们还需要一个直接发送到你的手机上的验证码，来获得对你的 WordPress 网站管理的权限。

添加双因素认证是非常容易的，只需要安装另一个插件，在 WordPress 插件目录搜索 “two-factor authentication” ，然后选择你要的插件。其中一个选择是 [Two Factor][15] ，这是一个流行的 GPLv2 许可的插件，已经有超过 10000 次安装。

#### 限制登录尝试

WordPress 可以让你多次猜测登录信息来帮助你登录。然而，这对黑客尝试获取未授权访问  WordPress 网站并发布恶意代码也是有帮助的。

为了应对暴力破解，安装一个插件来限制登录尝试，并设置你允许猜测的次数。

### 6、禁用文件编辑功能

这不是一个适合初学者的步骤，除非你是个自信的程序员，不要尝试它。并且一定要先备份你的网站。

那就是说，如果你真的想保护你的 WordPress 网站，禁用文件编辑功能 _是_ 一个重要的措施 。如果你不隐藏你的文件，它意味着任何人从管理后台都可以编辑你的主题和插件代码，如果入侵者进入，那就危险了。

为了拒绝未授权的访问，转到你的 `.htaccess` 文件并输入：

```
<Files wp-config.php>
order allow,deny
deny from all
</Files>
```

或者，要从你的 WordPress 管理后台直接删除主题和插件的编辑选项，可以添加编辑你的 `wp-config.php` 文件：

```
define( 'DISALLOW_FILE_EDIT', true );
```

保存并重新加载这个文件，插件和主题编辑器将会从你的 WordPress 管理后台菜单中消失，阻止任何人编辑你的主题或者插件代码，包括你自己。如果你需要恢复访问你的主题和插件代码，只需要删除你添加在 `wp-config.php` 文件中的代码即可。

无论你阻止未授权的访问，还是完全禁用文件编辑功能，采取行动保护你网站代码是很重要的。否则，不受欢迎的访问者编辑你的文件并添加新代码是很容易的。这意味着攻击者可以使用编辑器从你的 WordPress 站点来获取数据，或者甚至利用你的网站对其他站点发起攻击。

隐藏文件更容易的方式是利用安全插件来为你服务，比如 Sucuri 。

### WordPress 安全概要

WordPress 是一个优秀的开源平台，初学者和开发者都应该享受它，而不用担心成为攻击的受害者。遗憾的是，这些威胁不会很快消失，所以保持网站的安全至关重要。

利用以上措施，你可以创建一个更加健壮、更安全的保护水平的 WordPress 站点，并给自己带来更好的使用体验。

保持安全是一个持续的任务，而不是一次性的检查清单，所以一定要定期重温这些步骤，并在建立和使用你的CMS时保持警惕。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/wordpress-security

作者：[Lucy Carney][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

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
