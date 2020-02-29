[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11709-1.html)
[#]: subject: (How To Set Password Complexity On Linux?)
[#]: via: (https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 如何设置密码复杂度？
======

对于 Linux 系统管理员来说，用户管理是最重要的事之一。这涉及到很多因素，实现强密码策略是用户管理的其中一个方面。移步后面的 URL 查看如何 [在 Linux 上生成一个强密码][1]。它会限制系统未授权的用户的访问。

所有人都知道 Linux 的默认策略很安全，然而我们还是要做一些微调，这样才更安全。弱密码有安全隐患，因此，请特别注意。移步后面的 URL 查看生成的强密码的[密码长度和分值][2]。本文将教你在 Linux 中如何实现最安全的策略。

在大多数 Linux 系统中，我们可以用 PAM（<ruby>可插拔认证模块<rt>pluggable authentication module</rt></ruby>）来加强密码策略。在下面的路径可以找到这个文件。

- 在红帽系列的系统中，路径：`/etc/pam.d/system-auth`。
- Debian 系列的系统中，路径：`/etc/pam.d/common-password`。

关于默认的密码过期时间，可以在 `/etc/login.defs` 文件中查看详细信息。

为了更好理解，我摘取了文件的部分内容：

```
# vi /etc/login.defs

PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_MIN_LEN    5
PASS_WARN_AGE   7
```

详细解释:

* `PASS_MAX_DAYS`：一个密码可使用的最大天数。
* `PASS_MIN_DAYS`：两次密码修改之间最小的间隔天数。
* `PASS_MIN_LEN`：密码最小长度。
* `PASS_WARN_AGE`：密码过期前给出警告的天数。

我们将会展示在 Linux 中如何实现下面的 11 个密码策略。

* 一个密码可使用的最大天数
* 两次密码修改之间最小的间隔天数
* 密码过期前给出警告的天数
* 密码历史记录/拒绝重复使用密码
* 密码最小长度
* 最少的大写字母个数
* 最少的小写字母个数
* 最少的数字个数
* 最少的其他字符（符号）个数
* 账号锁定 — 重试
* 账号解锁时间

### 密码可使用的最大天数是什么？

这一参数限制一个密码可使用的最大天数。它强制用户在过期前修改他/她的密码。如果他们忘记修改，那么他们会登录不了系统。他们需要联系管理员才能正常登录。这个参数可以在 `/etc/login.defs` 文件中设置。我把这个参数设置为 90 天。

```
# vi /etc/login.defs

PASS_MAX_DAYS   90
```

### 密码最小天数是什么？

这个参数限制两次修改之间的最少天数。举例来说，如果这个参数被设置为 15 天，用户今天修改了密码，那么在 15 天之内他都不能修改密码。这个参数可以在 `/etc/login.defs` 文件中设置。我设置为 15 天。

```
# vi /etc/login.defs

PASS_MIN_DAYS   15
```

### 密码警告天数是什么？

这个参数控制密码警告的前置天数，在密码即将过期时会给用户警告提示。在警告天数结束前，用户会收到日常警告提示。这可以提醒用户在密码过期前修改他们的密码，否则我们就需要联系管理员来解锁密码。这个参数可以在 `/etc/login.defs`  文件中设置。我设置为 10 天。

```
# vi /etc/login.defs

PASS_WARN_AGE   10
```

**注意:** 上面的所有参数仅对新账号有效，对已存在的账号无效。

### 密码历史或拒绝重复使用密码是什么？

这个参数控制密码历史。它记录曾经使用过的密码（禁止使用的曾用密码的个数）。当用户设置新的密码时，它会检查密码历史，如果他们要设置的密码是一个曾经使用过的旧密码，将会发出警告提示。这个参数可以在 `/etc/pam.d/system-auth`  文件中设置。我设置密码历史为 5。

```
# vi /etc/pam.d/system-auth

password  sufficient  pam_unix.so md5 shadow nullok try_first_pass use_authtok remember=5
```

### 密码最小长度是什么？

这个参数表示密码的最小长度。当用户设置新密码时，系统会检查这个参数，如果新设的密码长度小于这个参数设置的值，会收到警告提示。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。我设置最小密码长度为 12。

```
# vi /etc/pam.d/system-auth

password  requisite   pam_cracklib.so try_first_pass retry=3 minlen=12
```

`try_first_pass retry=3`：在密码设置交互界面，用户有 3 次机会重设密码。

### 设置最少的大写字母个数？

这个参数表示密码中至少需要的大写字母的个数。这些是密码强度参数，可以让密码更健壮。当用户设置新密码时，系统会检查这个参数，如果密码中没有大写字母，会收到警告提示。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。我设置密码（中的大写字母）的最小长度为 1 个字母。

```
# vi /etc/pam.d/system-auth

password   requisite   pam_cracklib.so try_first_pass retry=3 minlen=12 ucredit=-1
```

### 设置最少的小写字母个数？

这个参数表示密码中至少需要的小写字母的个数。这些是密码强度参数，可以让密码更健壮。当用户设置新密码时，系统会检查这个参数，如果密码中没有小写字母，会收到警告提示。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。我设置为 1 个字母。

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 lcredit=-1
```

### 设置密码中最少的数字个数？

这个参数表示密码中至少需要的数字的个数。这些是密码强度参数，可以让密码更健壮。当用户设置新密码时，系统会检查这个参数，如果密码中没有数字，会收到警告提示。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。我设置为 1 个数字。

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 dcredit=-1
```

### 设置密码中最少的其他字符（符号）个数？

这个参数表示密码中至少需要的特殊符号的个数。这些是密码强度参数，可以让密码更健壮。当用户设置新密码时，系统会检查这个参数，如果密码中没有特殊符号，会收到警告提示。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。我设置为 1 个字符。

```
# vi /etc/pam.d/system-auth

password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=12 ocredit=-1
```

### 设置账号锁定？

这个参数控制用户连续登录失败的最大次数。当达到设定的连续失败登录次数阈值时，锁定账号。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。

```
# vi /etc/pam.d/system-auth

auth        required      pam_tally2.so onerr=fail audit silent deny=5
account required pam_tally2.so
```

### 设定账号解锁时间？

这个参数表示用户解锁时间。如果一个用户账号在连续认证失败后被锁定了，当过了设定的解锁时间后，才会解锁。设置被锁定中的账号的解锁时间（900 秒 = 15分钟）。这个参数可以在 `/etc/pam.d/system-auth` 文件中设置。

```
# vi /etc/pam.d/system-auth

auth        required      pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900
account required pam_tally2.so
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/
[2]: https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/
