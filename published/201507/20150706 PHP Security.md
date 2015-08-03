PHP 安全编程建议
================================================================================
![](http://www.codeproject.com/KB/PHP/363897/php_security.jpg)

### 简介 ###

要提供互联网服务，当你在开发代码的时候必须时刻保持安全意识。可能大部分 PHP 脚本都对安全问题都不在意，这很大程度上是因为有大量的*无经验程序员*在使用这门语言。但是，没有理由让你因为对你的代码的不确定性而导致不一致的安全策略。当你在服务器上放任何涉及到钱的东西时，就有可能会有人尝试破解它。创建一个论坛程序或者任何形式的购物车，被攻击的可能性就上升到了无穷大。

### 背景 ###

为了确保你的 web 内容安全，这里有一些常规的安全准则：

#### 别相信表单 ####

攻击表单很简单。通过使用一个简单的 JavaScript 技巧，你可以限制你的表单只允许在评分域中填写 1 到 5 的数字。如果有人关闭了他们浏览器的 JavaScript 功能或者提交自定义的表单数据，你客户端的验证就失败了。

用户主要通过表单参数和你的脚本交互，因此他们是最大的安全风险。你应该学到什么呢？在 PHP 脚本中，总是要验证 传递给任何 PHP 脚本的数据。在本文中，我们向你演示了如何分析和防范跨站脚本（XSS）攻击，它可能会劫持用户凭据（甚至更严重）。你也会看到如何防止会玷污或毁坏你数据的 MySQL 注入攻击。

#### 别相信用户   ####

假定你网站获取的每一份数据都充满了有害的代码。清理每一部分，即便你相信没有人会尝试攻击你的站点。

#### 关闭全局变量 ####

你可能会有的最大安全漏洞是启用了 register\_globals 配置参数。幸运的是，PHP 4.2 及以后版本默认关闭了这个配置。如果打开了 **register\_globals**，你可以在你的 php.ini 文件中通过改变 register\_globals 变量为 Off 关闭该功能：

    register_globals = Off 

新手程序员觉得注册全局变量很方便，但他们不会意识到这个设置有多么危险。一个启用了全局变量的服务器会自动为全局变量赋任何形式的参数。为了了解它如何工作以及为什么有危险，让我们来看一个例子。

假设你有一个称为 process.php 的脚本，它会向你的数据库插入表单数据。初始的表单像下面这样：

    <input name="username" type="text" size="15" maxlength="64">

运行 process.php 的时候，启用了注册全局变量的 PHP 会将该参数赋值到 $username 变量。这会比通过 **$\_POST['username']** 或 **$\_GET['username']** 访问它节省击键次数。不幸的是，这也会给你留下安全问题，因为 PHP 会设置该变量的值为通过 GET 或 POST 的参数发送到脚本的任何值，如果你没有显示地初始化该变量并且你不希望任何人去操作它，这就会有一个大问题。

看下面的脚本，假如 $authorized 变量的值为 true，它会给用户显示通过验证的数据。正常情况下，只有当用户正确通过了这个假想的 authenticated\_user() 函数验证，$authorized 变量的值才会被设置为真。但是如果你启用了 **register\_globals**，任何人都可以发送一个 GET 参数，例如 authorized=1 去覆盖它：

    <?php
    // Define $authorized = true only if user is authenticated
    if (authenticated_user()) {
        $authorized = true;
    }
    ?>

这个故事的寓意是，你应该从预定义的服务器变量中获取表单数据。所有通过 post 表单传递到你 web 页面的数据都会自动保存到一个称为 **$\_POST** 的大数组中，所有的 GET 数据都保存在 **$\_GET** 大数组中。文件上传信息保存在一个称为 **$\_FILES** 的特殊数据中。另外，还有一个称为 **$\_REQUEST** 的复合变量。

要从一个 POST 方法表单中访问 username 字段，可以使用 **$\_POST['username']**。如果 username 在 URL 中就使用 **$\_GET['username']**。如果你不确定值来自哪里，用 **$\_REQUEST['username']**。

    <?php
    $post_value = $_POST['post_value'];
    $get_value = $_GET['get_value'];
    $some_variable = $_REQUEST['some_value']; 
    ?>  

$\_REQUEST 是 $\_GET、$\_POST、和 $\_COOKIE 数组的结合。如果你有两个或多个值有相同的参数名称，注意 PHP 会使用哪个。默认的顺序是 cookie、POST、然后是 GET。

#### 推荐安全配置选项 ####

这里有几个会影响安全功能的 PHP 配置设置。下面是一些显然应该用于生产服务器的：

- **register\_globals** 设置为 off
- **safe\_mode** 设置为 off
- **error\_reporting** 设置为 off。如果出现错误了，这会向用户浏览器发送可见的错误报告信息。对于生产服务器，使用错误日志代替。开发服务器如果在防火墙后面就可以启用错误日志。（LCTT 译注：此处据原文逻辑和常识，应该是“开发服务器如果在防火墙后面就可以启用错误报告，即 on。”）
- 停用这些函数：system()、exec()、passthru()、shell\_exec()、proc\_open()、和 popen()。
- **open\_basedir** 为 /tmp（以便保存会话信息）目录和 web 根目录，以便脚本不能访问这些选定区域外的文件。
- **expose\_php** 设置为 off。该功能会向 Apache 头添加包含版本号的 PHP 签名。
- **allow\_url\_fopen** 设置为 off。如果你能够注意你代码中访问文件的方式-也就是你验证所有输入参数，这并不严格需要。
- **allow\_url\_include** 设置为 off。对于任何人来说，实在没有明智的理由会想要访问通过 HTTP 包含的文件。

一般来说，如果你发现想要使用这些功能的代码，你就不应该相信它。尤其要小心会使用类似 system() 函数的代码-它几乎肯定有缺陷。

启用了这些设置后，让我们来看看一些特定的攻击以及能帮助你保护你服务器的方法。

### SQL 注入攻击  ###

由于 PHP 传递到 MySQL 数据库的查询语句是用强大的 SQL 编程语言编写的，就有了某些人通过在 web 查询参数中使用 MySQL 语句尝试 SQL 注入攻击的风险。通过在参数中插入有害的 SQL 代码片段，攻击者会尝试进入（或破坏）你的服务器。

假如说你有一个最终会放入变量 $product 的表单参数，你使用了类似下面的 SQL 语句：

    $sql = "select * from pinfo where product = '$product'";

如果参数是直接从表单中获得的，应该使用 PHP 自带的数据库特定转义函数，类似：

    $sql = 'Select * from pinfo where product = '"' 
           mysql_real_escape_string($product) . '"';

如果不这样做的话，有人也许会把下面的代码段放到表单参数中：

    39'; DROP pinfo; SELECT 'FOO 

那么 $sql 的结果就是：

    select product from pinfo where product = '39'; DROP pinfo; SELECT 'FOO' 

由于分号是 MySQL 的语句分隔符，数据库会运行下面三条语句：

    select * from pinfo where product = '39'
    DROP pinfo
    SELECT 'FOO' 

好了，你丢失了你的表。

注意实际上 PHP 和 MySQL 不会运行这种特殊语法，因为 **mysql\_query()** 函数只允许每个请求处理一个语句。但是，一个子查询仍然会生效。

要防止 SQL 注入攻击，做这两件事：

- 总是验证所有参数。例如，如果需要一个数字，就要确保它是一个数字。
- 总是对数据使用 mysql\_real\_escape\_string() 函数转义数据中的任何引号和双引号。

**注意：要自动转义任何表单数据，可以启用魔术引号（Magic Quotes）。**

一些 MySQL 破坏可以通过限制 MySQL 用户权限避免。任何 MySQL 账户可以限制为只允许对选定的表进行特定类型的查询。例如，你可以创建只能选择行的 MySQL 用户。但是，这对于动态数据并不十分有用，另外，如果你有敏感的用户信息，可能某些人能访问其中一些数据，但你并不希望如此。例如，一个访问账户数据的用户可能会尝试注入访问另一个人的账户号码的代码，而不是为当前会话指定的号码。

### 防止基本的 XSS 攻击  ###

XSS 表示跨站脚本。不像大部分攻击，该漏洞发生在客户端。XSS 最常见的基本形式是在用户提交的内容中放入 JavaScript 以便偷取用户 cookie 中的数据。由于大部分站点使用 cookie 和 session 验证访客，偷取的数据可用于模拟该用户-如果是一个常见的用户账户就会深受麻烦，如果是管理员账户甚至是彻底的惨败。如果你不在站点中使用 cookie 和 session ID，你的用户就不容易被攻击，但你仍然应该明白这种攻击是如何工作的。

不像 MySQL 注入攻击，XSS 攻击很难预防。Yahoo、eBay、Apple、以及 Microsoft 都曾经受 XSS 影响。尽管攻击不包含 PHP，但你可以使用 PHP 来剥离用户数据以防止攻击。为了防止 XSS 攻击，你应该限制和过滤用户提交给你站点的数据。正是因为这个原因，大部分在线公告板都不允许在提交的数据中使用 HTML 标签，而是用自定义的标签格式代替，例如  **[b]** 和 **[linkto]**。

让我们来看一个如何防止这类攻击的简单脚本。对于更完善的解决办法，可以使用 SafeHTML，本文的后面部分会讨论到。

    function transform_HTML($string, $length = null) {
    // Helps prevent XSS attacks
        // Remove dead space.
        $string = trim($string);
        // Prevent potential Unicode codec problems.
        $string = utf8_decode($string);
        // HTMLize HTML-specific characters.
        $string = htmlentities($string, ENT_NOQUOTES);
        $string = str_replace("#", "&#35;", $string);
        $string = str_replace("%", "&#37;", $string);
        $length = intval($length);
        if ($length > 0) {
            $string = substr($string, 0, $length);
        }
        return $string;
    } 

这个函数将 HTML 特定的字符转换为 HTML 字面字符。一个浏览器对任何通过这个脚本的 HTML 以非标记的文本呈现。例如，考虑下面的 HTML 字符串：

    <STRONG>Bold Text</STRONG>

一般情况下，HTML 会显示为：**Bold Text**

但是，通过 **transform\_HTML()** 后，它就像原始输入一样呈现。原因是处理的字符串中的标签字符串转换为 HTML 实体。**transform\_HTML()** 的结果字符串的纯文本看起来像下面这样：

    &lt;STRONG&gt;Bold Text&lt;/STRONG&gt; 

该函数的实质是 htmlentities() 函数调用，它会将 <、>、和 & 转换为 **\&lt;**、**\&gt;**、和 **\&amp;**。尽管这会处理大部分的普通攻击，但有经验的 XSS 攻击者有另一种把戏：用十六进制或 UTF-8 编码恶意脚本，而不是采用普通的 ASCII 文本，从而希望能绕过你的过滤器。他们可以在 URL 的 GET 变量中发送代码，告诉浏览器，“这是十六进制代码，你能帮我运行吗？” 一个十六进制例子看起来像这样：

    <a href="http://host/a.php?variable=%22%3e %3c%53%43%52%49%50%54%3e%44%6f%73%6f%6d%65%74%68%69%6e%67%6d%61%6c%69%63%69%6f%75%73%3c%2f%53%43%52%49%50%54%3e"> 

浏览器渲染这个信息的时候，结果就是：

    <a href="http://host/a.php?variable="> <SCRIPT>Dosomethingmalicious</SCRIPT>

为了防止这种情况，transform\_HTML() 采用额外的步骤把 # 和 % 符号转换为它们的实体，从而避免十六进制攻击，并转换 UTF-8 编码的数据。

最后，为了防止某些人用很长的输入超载字符串从而导致某些东西崩溃，你可以添加一个可选的 $length 参数来截取你指定最大长度的字符串。

### 使用 SafeHTML ###

之前脚本的问题比较简单，它不允许任何类型的用户标记。不幸的是，这里有上百种方法能使 JavaScript 跳过用户的过滤器，并且要从用户输入中剥离全部 HTML，还没有方法可以防止这种情况。

当前，没有任何一个脚本能保证无法被破解，尽管有一些确实比大部分要好。有白名单和黑名单两种方法加固安全，白名单比较简单而且更加有效。

一个白名单解决方案是 PixelApes 的 SafeHTML 反跨站脚本解析器。

SafeHTML 能识别有效 HTML，能追踪并剥离任何危险标签。它用另一个称为 HTMLSax 的软件包进行解析。

按照下面步骤安装和使用 SafeHTML：

1. 到 [http://pixel-apes.com/safehtml/?page=safehtml][1] 下载最新版本的 SafeHTML。
1. 把文件放到你服务器的类文件夹。该文件夹包括 SafeHTML 和 HTMLSax 功能所需的所有东西。
1. 在脚本中 `include` SafeHTML 类文件（safehtml.php）。
1. 创建一个名为 $safehtml 的新 SafeHTML 对象。
1. 用 $safehtml->parse() 方法清理你的数据。

这是一个完整的例子：

    <?php
    /* If you're storing the HTMLSax3.php in the /classes directory, along
       with the safehtml.php script, define XML_HTMLSAX3 as a null string. */
    define(XML_HTMLSAX3, '');
    // Include the class file.
    require_once('classes/safehtml.php');
    // Define some sample bad code.
    $data = "This data would raise an alert <script>alert('XSS Attack')</script>";
    // Create a safehtml object.
    $safehtml = new safehtml();
    // Parse and sanitize the data.
    $safe_data = $safehtml->parse($data);
    // Display result.
    echo 'The sanitized data is <br />' . $safe_data;
    ?>

如果你想清理脚本中的任何其它数据，你不需要创建一个新的对象；在你的整个脚本中只需要使用 $safehtml->parse() 方法。

#### 什么可能会出现问题？ ####

你可能犯的最大错误是假设这个类能完全避免 XSS 攻击。SafeHTML 是一个相当复杂的脚本，几乎能检查所有事情，但没有什么是能保证的。你仍然需要对你的站点做参数验证。例如，该类不能检查给定变量的长度以确保能适应数据库的字段。它也不检查缓冲溢出问题。

XSS 攻击者很有创造力，他们使用各种各样的方法来尝试达到他们的目标。可以阅读 RSnake 的 XSS 教程[http://ha.ckers.org/xss.html][2] ，看一下这里有多少种方法尝试使代码跳过过滤器。SafeHTML 项目有很好的程序员一直在尝试阻止 XSS 攻击，但无法保证某些人不会想起一些奇怪和新奇的方法来跳过过滤器。

**注意：XSS 攻击严重影响的一个例子 [http://namb.la/popular/tech.html][3]，其中显示了如何一步一步创建一个让 MySpace 服务器过载的 JavaScript XSS 蠕虫。**

### 用单向哈希保护数据 ###

该脚本对输入的数据进行单向转换，换句话说，它能对某人的密码产生哈希签名，但不能解码获得原始密码。为什么你希望这样呢？应用程序会存储密码。一个管理员不需要知道用户的密码，事实上，只有用户知道他/她自己的密码是个好主意。系统（也仅有系统）应该能识别一个正确的密码；这是 Unix 多年来的密码安全模型。单向密码安全按照下面的方式工作：

1. 当一个用户或管理员创建或更改一个账户密码时，系统对密码进行哈希并保存结果。主机系统会丢弃明文密码。
2. 当用户通过任何方式登录到系统时，再次对输入的密码进行哈希。
3. 主机系统丢弃输入的明文密码。
4. 当前新哈希的密码和之前保存的哈希相比较。
5. 如果哈希的密码相匹配，系统就会授予访问权限。

主机系统完成这些并不需要知道原始密码；事实上，原始密码完全无所谓。一个副作用是，如果某人侵入系统并盗取了密码数据库，入侵者会获得很多哈希后的密码，但无法把它们反向转换为原始密码。当然，给足够时间、计算能力，以及弱用户密码，一个攻击者还是有可能采用字典攻击找出密码。因此，别轻易让人碰你的密码数据库，如果确实有人这样做了，让每个用户更改他们的密码。

#### 加密 Vs 哈希 ####

技术上来来说，哈希过程并不是加密。哈希和加密是不同的，这有两个理由：

不像加密，哈希数据不能被解密。

是有可能（但非常罕见）两个不同的字符串会产生相同的哈希。并不能保证哈希是唯一的，因此别像数据库中的唯一键那样使用哈希。

    function hash_ish($string) {
        return md5($string);
    }

上面的 md5() 函数基于 RSA 数据安全公司的消息摘要算法（即 MD5）返回一个由 32 个字符组成的十六进制串。然后你可以将那个 32 位字符串插入到数据库中和另一个 md5 字符串相比较，或者直接用这 32 个字符。

#### 破解脚本 ####

几乎不可能解密 MD5 数据。或者说很难。但是，你仍然需要好的密码，因为用一整个字典生成哈希数据库仍然很简单。有一些在线 MD5 字典，当你输入 **06d80eb0c50b49a509b49f2424e8c805** 后会得到结果 “dog”。因此，尽管技术上 MD5 不能被解密，这里仍然有漏洞，如果某人获得了你的密码数据库，你可以肯定他们肯定会使用 MD5 字典破译。因此，当你创建基于密码的系统的时候尤其要注意密码长度（最小 6 个字符，8 个或许会更好）和包括字母和数字。并确保这个密码不在字典中。

### 用 Mcrypt 加密数据 ###

如果你不需要以可阅读形式查看密码，采用 MD5 就足够了。不幸的是，这里并不总是有可选项，如果你提供以加密形式存储某人的信用卡信息，你可能需要在后面的某个地方进行解密。

最早的一个解决方案是 Mcrypt 模块，这是一个用于允许 PHP 高速加密的插件。Mcrypt 库提供了超过 30 种用于加密的计算方法，并且提供口令确保只有你（或者你的用户）可以解密数据。

让我们来看看使用方法。下面的脚本包含了使用 Mcrypt 加密和解密数据的函数：

    <?php
    $data = "Stuff you want encrypted";
    $key = "Secret passphrase used to encrypt your data";
    $cipher = "MCRYPT_SERPENT_256";
    $mode = "MCRYPT_MODE_CBC";
    function encrypt($data, $key, $cipher, $mode) {
    // Encrypt data
    return (string)
                base64_encode
                    (
                    mcrypt_encrypt
                        (
                        $cipher,
                        substr(md5($key),0,mcrypt_get_key_size($cipher, $mode)),
                        $data,
                        $mode,
                        substr(md5($key),0,mcrypt_get_block_size($cipher, $mode))
                        )
                    );
    }
    function decrypt($data, $key, $cipher, $mode) {
    // Decrypt data
        return (string)
                mcrypt_decrypt
                    (
                    $cipher,
                    substr(md5($key),0,mcrypt_get_key_size($cipher, $mode)),
                    base64_decode($data),
                    $mode,
                    substr(md5($key),0,mcrypt_get_block_size($cipher, $mode))
                    );
    }
    ?>

**mcrypt()** 函数需要几个信息：

- 需要加密的数据
- 用于加密和解锁数据的口令，也称为键。
- 用于加密数据的计算方法，也就是用于加密数据的算法。该脚本使用了 **MCRYPT\_SERPENT\_256**，但你可以从很多算法中选择，包括 **MCRYPT\_TWOFISH192**、**MCRYPT\_RC2**、**MCRYPT\_DES**、和 **MCRYPT\_LOKI97**。
- 加密数据的模式。这里有几个你可以使用的模式，包括电子密码本（Electronic Codebook） 和加密反馈（Cipher Feedback）。该脚本使用 **MCRYPT\_MODE\_CBC** 密码块链接。
- 一个 **初始化向量**-也称为 IV 或者种子，用于为加密算法设置种子的额外二进制位。也就是使算法更难于破解的额外信息。
- 键和 IV 字符串的长度，这可能随着加密和块而不同。使用 **mcrypt\_get\_key\_size()** 和 **mcrypt\_get\_block\_size()** 函数获取合适的长度；然后用 **substr()** 函数将键的值截取为合适的长度。（如果键的长度比要求的短，别担心，Mcrypt 会用 0 填充。）

如果有人窃取了你的数据和短语，他们只能一个个尝试加密算法直到找到正确的那一个。因此，在使用它之前我们通过对键使用 **md5()** 函数增加安全，就算他们获取了数据和短语，入侵者也不能获得想要的东西。

入侵者同时需要函数，数据和口令，如果真是如此，他们可能获得了对你服务器的完整访问，你只能大清洗了。

这里还有一个数据存储格式的小问题。Mcrypt 以难懂的二进制形式返回加密后的数据，这使得当你将其存储到 MySQL 字段的时候可能出现可怕错误。因此，我们使用  **base64encode()** 和 **base64decode()** 函数转换为和 SQL 兼容的字母格式和可检索行。

#### 破解脚本 ####

除了实验多种加密方法，你还可以在脚本中添加一些便利。例如，不用每次都提供键和模式，而是在包含的文件中声明为全局常量。

### 生成随机密码  ###

随机（但难以猜测）字符串在用户安全中很重要。例如，如果某人丢失了密码并且你使用 MD5 哈希，你不可能，也不希望查找回来。而是应该生成一个安全的随机密码并发送给用户。为了访问你站点的服务，另外一个用于生成随机数字的应用程序会创建有效链接。下面是创建密码的一个函数：

    <?php
     function make_password($num_chars) {
        if ((is_numeric($num_chars)) &&
            ($num_chars > 0) &&
            (! is_null($num_chars))) {
            $password = '';
            $accepted_chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
            // Seed the generator if necessary.
            srand(((int)((double)microtime()*1000003)) );
            for ($i=0; $i<=$num_chars; $i++) {
                $random_number = rand(0, (strlen($accepted_chars) -1));
                $password .= $accepted_chars[$random_number] ;
            }
            return $password;
         }
    }
    ?> 

#### 使用脚本 ####

**make_password()** 函数返回一个字符串，因此你需要做的就是提供字符串的长度作为参数：

    <?php
    $fifteen_character_password = make_password(15);
    ?> 

函数按照下面步骤工作：

- 函数确保 **$num\_chars** 是非零的正整数。
- 函数初始化 **$accepted\_chars** 变量为密码可能包含的字符列表。该脚本使用所有小写字母和数字 0 到 9，但你可以使用你喜欢的任何字符集合。（LCTT 译注：有时候为了便于肉眼识别，你可以将其中的 0 和 O，1 和 l 之类的都去掉。）
- 随机数生成器需要一个种子，从而获得一系列类随机值（PHP 4.2 及之后版本中并不需要，会自动播种）。
- 函数循环 **$num\_chars** 次，每次迭代生成密码中的一个字符。
- 对于每个新字符，脚本查看 **$accepted_chars** 的长度，选择 0 和长度之间的一个数字，然后添加 **$accepted\_chars** 中该数字为索引值的字符到 $password。
- 循环结束后，函数返回 **$password**。

### 许可证 ###

本篇文章，包括相关的源代码和文件，都是在 [The Code Project Open License (CPOL)][4] 协议下发布。

--------------------------------------------------------------------------------

via: http://www.codeproject.com/Articles/363897/PHP-Security

作者：[SamarRizvi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.codeproject.com/script/Membership/View.aspx?mid=7483622
[1]:http://pixel-apes.com/safehtml/?page=safehtml
[2]:http://ha.ckers.org/xss.html
[3]:http://namb.la/popular/tech.html
[4]:http://www.codeproject.com/info/cpol10.aspx