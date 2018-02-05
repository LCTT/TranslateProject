Sessions 与 Cookies – 用户登录的原理是什么?
======
Facebook, Gmail, Twitter 是我们每天都会用的网站. 它们的共同点在于都需要你登录进去后才能做进一步的操作. 只有你通过认证并登录后才能在 twitter 发推, 在 Facebook 上评论,以及在 Gmail上处理电子邮件.

 [![gmail, facebook login page](http://www.theitstuff.com/wp-content/uploads/2017/10/Untitled-design-1.jpg)][1] 

那么登录的原理是什么? 网站是如何认证的? 它怎么知道是哪个用户从哪儿登录进来的? 下面我们来对这些问题进行一一解答.

### 用户登录的原理是什么?

每次你在网站的登录页面中输入用户名和密码时, 这些信息都会发送到服务器. 服务器随后会将你的密码与服务器中的密码进行验证. 如果两者不匹配, 则你会得到一个错误密码的提示. 如果两则匹配, 则成功登录.

### 登陆时发生了什么?

登录后, web 服务器会初始化一个 session 并在你的浏览器中设置一个 cookie 变量. 该 cookie 变量用于作为新建 session 的一个引用. 搞晕了? 让我们说的再简单一点.

### 会话的原理是什么?

服务器在用户名和密码都正确的情况下会初始化一个 session. Sessions 的定义很复杂，你可以把它理解为 `关系的开始`.

 [![session beginning of a relationship or partnership](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-9.png)][2] 

认证通过后, 服务器就开始跟你展开一段关系了. 由于服务器不能象我们人类一样看东西, 它会在我们的浏览器中设置一个 cookie 来将我们的关系从其他人与服务器的关系标识出来.

### 什么是 Cookie?

cookie 是网站在你的浏览器中存储的一小段数据. 你应该已经见过他们了.

 [![theitstuff official facebook page cookies](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-1-4.png)][3] 

当你登录后，服务器为你创建一段关系或者说一个 session, 然后将唯一标识这个 session 的 session id 以 cookie 的形式存储在你的浏览器中.

### 什么意思?

所有这些东西存在的原因在于识别出你来，这样当你写评论或者发推时, 服务器能知道是谁在发评论，是谁在发推.

当你登录后, 会产生一个包含 session id 的 cookie. 这样, 这个 session id 就被赋予了那个输入正确用户名和密码的人了.

 [![facebook cookies in web browser](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-2-3-e1508926255472.png)][4] 

也就是说， session id 被赋予给了拥有这个账户的人了. 之后，所有在网站上产生的行为, 服务器都能通过他们的 session id 来判断是由谁发起的.

### 如何让我保持登录状态?

session 有一定的时间限制. 这一点与现实生活中不一样，现实生活中的关系可以在不见面的情况下持续很长一段时间, 而 session 具有时间限制. 你必须要不断地通过一些动作来告诉服务器你还在线. 否则的话，服务器会关掉这个 session，而你会被登出.

 [![websites keep me logged in option](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-3-3-e1508926314117.png)][5] 

不过在某些网站上可以启用 `保持登录（Keep me logged in）`, 这样服务器会将另一个唯一变量以 cookie 的形式保存到我们的浏览器中. 这个唯一变量会通过与服务器上的变量进行对比来实现自动登录. 若有人盗取了这个唯一标识(我们称之为 cookie stealing), 他们就能访问你的账户了.

### 结论

我们讨论了登录系统的工作原理以及网站是如何进行认证的. 我们还学到了什么是 sessions 和 cookies,以及它们在登录机制中的作用.

我们希望你们以及理解了用户登录的工作原理, 如有疑问, 欢迎提问.

--------------------------------------------------------------------------------

via: http://www.theitstuff.com/sessions-cookies-user-login-work

作者：[Rishabh Kandari][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com/author/reevkandari
[1]:http://www.theitstuff.com/wp-content/uploads/2017/10/Untitled-design-1.jpg
[2]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-9.png
[3]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-1-4.png
[4]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-2-3-e1508926255472.png
[5]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-3-3-e1508926314117.png
