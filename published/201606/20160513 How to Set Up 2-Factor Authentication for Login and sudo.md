如何为登录和 sudo 设置双因子认证
==========================================================

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/auth_crop.png?itok=z_cdYZZf)

安全就是一切。我们生活的当今世界，数据具有令人难以置信的价值，而你也一直处于数据丢失的风险之中。因此，你必须想尽办法保证你桌面系统和服务器中数据的安全。结果，管理员和用户就会创建极其复杂的密码、使用密码管理器甚至其它更复杂的东西。但是，如果我告诉你你可以只需要一步，至多两步就能登录到你的 Linux 服务器或桌面系统中呢？多亏了 [Google 身份验证器][2]，现在你可以做到了。并且，配置也极其简单。

我会给你简要介绍为登录和 sudo 设置双因子认证的步骤。我基于 Ubuntu 16.04 桌面系统进行介绍，但这些步骤也适用于其它服务器。为了实现双因子认证，我会使用 Google 身份验证器。

这里有个非常重要的警告：一旦你设置了认证，没有一个从认证器中获得的由 6 个数字组成的验证码你就不可能登录账户（或者执行 sudo 命令）。这也给你增加了一步额外的操作，因此如果你不想每次登录到 Linux 服务器（或者使用 sudo）的时候都要拿出你的智能手机，这个方案就不适合你。但你也要记住，这额外的一个步骤也给你带来一层其它方法无法给予的保护。

话不多说，开始吧。

### 安装必要的组件

安装 Google 身份验证器（Google Authenticator），首先要解决两个问题。一是安装智能机应用。下面是如何从 Google 应用商店安装的方法：

1. 在你的安卓设备中打开 Google 应用商店
2. 搜索 google 身份验证器
3. 找到并点击有 Google Inc. 标识的应用
4. 点击安装
5. 点击“接受”
6. 等待安装完成

接下来，我们继续在你的 Linux 机器上安装这个认证器。步骤如下：

1. 打开一个终端窗口
2. 输入命令 sudo apt-get install google-authenticator
3. 输入你的 sudo 密码并敲击回车
4. 如果有弹窗提示，输入 y 并敲击回车
5. 等待安装完成

接下来配置使用 google-authenticator 进行登录。

### 配置

要为登录和 sudo 添加双因子认证只需要编辑一个文件，即 /etc/pam.d/common-auth。打开并找到如下一行：

```
auth    [success=1 default=ignore]      pam_unix.so nullok_secure
```

在这行上面添加：

```
auth required pam_google_authenticator.so
```

保存并关闭文件。

下一步就是为系统中的每个用户设置 google-authenticator（否则他们就不能登录了）。为了简单起见，我们假设你的系统中有两个用户：jack 和 olivia。首先为 jack 设置（我们假设这是我们一直使用的账户）。

打开一个终端窗口并输入命令 google-authenticator。之后会问你一系列的问题（每个问题你都应该用 y 回答）。问题包括：

* 是否允许更新你的 "/home/jlwallen/.google_authenticator" 文件 (y/n) y
* 是否禁止多个用户使用同一个认证令牌？这会限制你每 30 秒内只能登录一次，但能增加你注意到甚至防止中间人攻击的可能 (y/n)
* 默认情况下令牌时长为 30 秒即可，为了补偿客户端和服务器之间可能出现的时间偏差，我们允许使用当前时间之前或之后的其它令牌。如果你无法进行时间同步，你可以把这个时间窗口由默认的 1:30 分钟增加到 4 分钟。是否希望如此 (y/n)
* 如果你尝试登录的计算机没有针对暴力破解进行加固，你可以为验证模块启用速率限制。默认情况下，限制攻击者每 30 秒不能尝试登陆超过 3 次。是否启用速率限制 (y/n)

一旦完成了问题回答，你就会看到你的密钥、验证码以及 5 个紧急刮码（emergency scratch code）。把这些刮码打印出来并保存。你可以在无法使用手机的时候使用它们（每个刮码仅限使用一次）。密钥用于你在 Google 身份验证器上设置账户，验证码是你能当下就能够立即使用（如果需要）的一次性验证码。

### 设置应用

现在你已经配置好了用户 jack。在设置用户 olivia 之前，你需要在 Google 身份验证器应用上为 jack 添加账户（LCTT 译注：实际操作情形中，是为 jack 的手机上安装的该应用创建一个账户）。在打开应用，点击“菜单”按钮（右上角三个竖排点）。点击“添加账户”然后点击“输入提供的密钥”。在下一个窗口（图1），你需要输入你运行 google-authenticator 应用时提供的 16 个数字的密钥。给账户取个名字（以便你记住这用于哪个账户），然后点击“添加”。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/auth_a.png?itok=xSMkd-Mf)

*图1: 在 Google Authenticator 应用上新建账户*

（LCTT 译注：Google 身份验证器也可以扫描你在服务器上设置时显示的二维码，而不用手工输入密钥）

添加完账户之后，你就会看到一个 6 个数字的密码，你每次登录或者使用 sudo 的时候都会需要这个密码。

最后，在系统上设置其它账户。正如之前提到的，我们会设置一个叫 olivia 的账户。步骤如下：

1. 打开一个终端窗口
2. 输入命令 sudo su olivia
3. 在智能机上打开 Google 身份验证器
4. 在终端窗口（图2）中输入（应用提供的） 6 位数字验证码并敲击回车
5. 输入你的 sudo 密码并敲击回车
6. 以新用户输入命令 google-authenticator，回答问题并记录生成的密钥和验证码。

成功为 olivia 用户设置好之后，用 google-authenticator 命令，在 Google 身份验证器应用上根据用户信息（和之前为第一个用户添加账户相同）添加一个新的账户。现在你在 Google 身份验证器应用上就会有 jack 和 olivia 两个账户了。（LCTT 译注：在实际操作情形中，通常是为 jack 和 olivia 两个人的手机分别设置。）

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/auth_b.png?itok=FH36V1r0)

*图2: 为 sudo 输入 6位数字验证码*

好了，就是这些。每次你尝试登录系统（或者使用 sudo） 的时候，在你输入用户密码之前，都会要求你输入提供的 6 位数字验证码。现在你的 Linux 机器就比添加双因子认证之前安全多了。虽然有些人会认为这非常麻烦，我仍然推荐使用，尤其是那些保存了敏感数据的机器。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/how-set-2-factor-authentication-login-and-sudo

作者：[JACK WALLEN][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

[a]: https://www.linux.com/users/jlwallen
[1]: https://www.linux.com/licenses/category/used-permission
[2]: https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2

