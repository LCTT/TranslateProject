PHP 7.0 升级备注
===============

1. 向后不兼容的变化
2. 新功能
3. SAPI 模块中的变化
4. 废弃的功能
5. 变化的功能
6. 新功能
7. 新的类和接口
8. 移除的扩展和 SAPI
9. 扩展的其它变化
10. 新的全局常量
11. INI 文件处理的变化
12. Windows 支持
13. 其它变化


##1. 向后不兼容的变化

###语言变化

####变量处理的变化

* 间接变量、属性和方法引用现在以从左到右的语义进行解释。一些例子：

		$$foo['bar']['baz'] // 解释做 ($$foo)['bar']['baz']   
      	$foo->$bar['baz']   // 解释做 ($foo->$bar)['baz']
      	$foo->$bar['baz']() // 解释做 ($foo->$bar)['baz']()
      	Foo::$bar['baz']()  // 解释做 (Foo::$bar)['baz']()

  要恢复以前的行为，需要显式地加大括号：

       	${$foo['bar']['baz']}
       	$foo->{$bar['baz']}
       	$foo->{$bar['baz']}()
		Foo::{$bar['baz']}()
      
* 全局关键字现在只接受简单变量。像以前的

       	global $$foo->bar;

  现在要求如下写法：

      	global ${$foo->bar};

* 变量或函数调用的前后加上括号不再有任何影响。例如下列代码，函数调用结果以引用的方式传给一个函数

      	function getArray() { return [1, 2, 3]; }

      	$last = array_pop(getArray());
      	// Strict Standards: 只有变量可以用引用方式传递
      	$last = array_pop((getArray()));
      	// Strict Standards: 只有变量可以用引用方式传递

  现在无论是否使用括号，都会抛出一个严格标准错误。以前在第二种调用方式下不会有提示。

* 数组元素或对象属性自动安装引用顺序创建，现在的结果顺序将不同。例如：

      	$array = [];
      	$array["a"] =& $array["b"];
      	$array["b"] = 1;
      	var_dump($array);

  现在结果是 ["a" => 1, "b" => 1]，而以前的结果是 ["b" => 1, "a" => 1]。

相关的 RFC：
* https://wiki.php.net/rfc/uniform_variable_syntax
* https://wiki.php.net/rfc/abstract_syntax_tree

####list() 的变化

* list() 不再以反序赋值，例如：

      	list($array[], $array[], $array[]) = [1, 2, 3];
      	var_dump($array);

  现在结果是 $array == [1, 2, 3] ，而不是 [3, 2, 1]。注意仅赋值**顺序**变化了，而赋值仍然一致（LCTT 译注：即以前的 list()行为是从后面的变量开始逐一赋值，这样对与上述用法就会产生 [3,2,1] 这样的结果了。）。例如，类似如下的常规用法

      	list($a, $b, $c) = [1, 2, 3];
      	// $a = 1; $b = 2; $c = 3;
  
  仍然保持当前的行为。

* 不再允许对空的 list() 赋值。如下全是无效的：

      	list() = $a;
      	list(,,) = $a;
      	list($x, list(), $y) = $a;

* list() 不再支持对字符串的拆分（以前也只在某些情况下支持）。如下代码：

      	$string = "xy";
      	list($x, $y) = $string;

  现在的结果是： $x == null 和 $y == null （没有提示），而以前的结果是：
  $x == "x" 和 $y == "y" 。此外， list() 现在总是可以处理实现了 ArrayAccess 的对象，例如：

      	list($a, $b) = (object) new ArrayObject([0, 1]);

  现在的结果是： $a == 0 和 $b == 1。 以前 $a 和 $b 都是 null。

相关 RFC:
* https://wiki.php.net/rfc/abstract_syntax_tree#changes_to_list
* https://wiki.php.net/rfc/fix_list_behavior_inconsistency

####foreach 的变化

* foreach() 迭代不再影响数组内部指针，数组指针可通过 current()/next() 等系列的函数访问。例如：

      	$array = [0, 1, 2];
      	foreach ($array as &$val) {
          	var_dump(current($array));
      	}

  现在将指向值 int(0) 三次。以前的输出是 int(1)、int(2) 和 bool(false)。

* 在对数组按值迭代时，foreach 总是在对数组副本进行操作，在迭代中任何对数组的操作都不会影响到迭代行为。例如：

      	$array = [0, 1, 2];
      	$ref =& $array; // Necessary to trigger the old behavior
      	foreach ($array as $val) {
          	var_dump($val);
          	unset($array[1]);
      	}

  现在将打印出全部三个元素 (0 1 2)，而以前第二个元素 1 会跳过 (0 2)。

* 在对数组按引用迭代时，对数组的修改将继续会影响到迭代。不过，现在 PHP 在使用数字作为键时可以更好的维护数组内的位置。例如，在按引用迭代过程中添加数组元素：

      	$array = [0];
      	foreach ($array as &$val) {
          	var_dump($val);
          	$array[1] = 1;
      	}

  现在迭代会正确的添加了元素。如上代码输出是 "int(0) int(1)"，而以前只是 "int(0)"。

* 对普通（不可遍历的）对象按值或按引用迭代的行为类似于对数组进行按引用迭代。这符合以前的行为，除了如上一点所述的更精确的位置管理的改进。

* 对可遍历对象的迭代行为保持不变。

相关 RFC: https://wiki.php.net/rfc/php7_foreach

####参数处理的变化

* 不能定义两个同名的函数参数。例如，下面的方法将会触发编译时错误：

      	public function foo($a, $b, $unused, $unused) {
          	// ...
      	}

  如上的代码应该修改使用不同的参数名，如：

      	public function foo($a, $b, $unused1, $unused2) {
          	// ...
      	}

* func\_get\_arg() 和 func\_get\_args() 函数不再返回传递给参数的原始值，而是返回其当前值（也许会被修改）。例如：

      	function foo($x) {
          	$x++;
          	var_dump(func_get_arg(0));
      	}
      	foo(1);

  将会打印 "2" 而不是 "1"。代码应该改成仅在调用 func\_get\_arg(s) 后进行修改操作。

      	function foo($x) {
          	var_dump(func_get_arg(0));
          	$x++;
      	}

  或者应该避免修改参数：

      	function foo($x) {
          	$newX = $x + 1;
          	var_dump(func_get_arg(0));
      	}

* 类似的，异常回溯也不再显示传递给函数的原始值，而是修改后的值。例如：

      	function foo($x) {
          	$x = 42;
          	throw new Exception;
      	}
      	foo("string");

  现在堆栈跟踪的结果是：

      	Stack trace:
      	#0 file.php(4): foo(42)
     	#1 {main}

  而以前是：

      	Stack trace:
      	#0 file.php(4): foo('string')
      	#1 {main}

  这并不会影响到你的代码的运行时行为，值得注意的是在调试时会有所不同。

  同样的限制也会影响到 debug\_backtrace() 及其它检查函数参数的函数。

相关 RFC: https://wiki.php.net/phpng

####整数处理的变化

* 无效的八进制表示（包含大于7的数字）现在会产生编译错误。例如，下列代码不再有效：
  
      	$i = 0781; // 8 不是一个有效的八进制数字！

  以前，无效的数字（以及无效数字后的任何数字）会简单的忽略。以前如上 $i 的值是 7，因为后两位数字会被悄悄丢弃。

* 二进制以负数镜像位移现在会抛出一个算术错误：

      	var_dump(1 >> -1);
      	// ArithmeticError: 以负数进行位移

* 向左位移的位数超出了整型宽度时，结果总是 0。

      	var_dump(1 << 64); // int(0)

  以前上述代码的结果依赖于所用的 CPU 架构。例如，在 x86（包括 x86-64） 上结果是 int(1)，因为其位移操作数在范围内。

* 类似的，向右位移的位数超出了整型宽度时，其结果总是 0 或 -1 （依赖于符号）：

      	var_dump(1 >> 64);  // int(0)
      	var_dump(-1 >> 64); // int(-1)

相关 RFC: https://wiki.php.net/rfc/integer_semantics

####字符串处理的变化

* 包含十六进制数字的字符串不会再被当做数字，也不会被特殊处理。参见例子中的新行为：

      	var_dump("0x123" == "291");     // bool(false)     (以前是 true)
      	var_dump(is_numeric("0x123"));  // bool(false)     (以前是 true)
      	var_dump("0xe" + "0x1");        // int(0)          (以前是 16)

      	var_dump(substr("foo", "0x1")); // string(3) "foo" (以前是 "oo")
      	// 注意：遇到了一个非正常格式的数字

  filter\_var() 可以用来检查一个字符串是否包含了十六进制数字，或这个字符串是否能转换为整数：

    	$str = "0xffff";
    	$int = filter_var($str, FILTER_VALIDATE_INT, FILTER_FLAG_ALLOW_HEX);
    	if (false === $int) {
        	throw new Exception("Invalid integer!");
    	}
    	var_dump($int); // int(65535)

* 由于给双引号字符串和 HERE 文档增加了 Unicode 码点转义格式（Unicode Codepoint Escape Syntax）， 所以带有无效序列的 "\u{" 现在会造成错误：

      	$str = "\u{xyz}"; // 致命错误：无效的 UTF-8 码点转义序列

  要避免这种情况，需要转义开头的反斜杠：

      	$str = "\\u{xyz}"; // 正确

  不过，不跟随 { 的 "\u" 不受影响。如下代码不会生成错误，和前面的一样工作：

      	$str = "\u202e"; // 正确

相关 RFC:
* https://wiki.php.net/rfc/remove_hex_support_in_numeric_strings
* https://wiki.php.net/rfc/unicode_escape

####错误处理的变化

* 现在有两个异常类： Exception 和 Error 。这两个类都实现了一个新接口： Throwable 。在异常处理代码中的类型指示也许需要修改来处理这种情况。

* 一些致命错误和可恢复的致命错误现在改为抛出一个 Error 。由于 Error 是一个独立于 Exception 的类，这些异常不会被已有的 try/catch 块捕获。

  可恢复的致命错误被转换为一个异常，所以它们不能在错误处理里面悄悄的忽略。部分情况下，类型指示失败不再能忽略。

* 解析错误现在会生成一个 Error 扩展的  ParseError 。除了以前的基于返回值 / error_get_last() 的处理，对某些可能无效的代码的 eval() 的错误处理应该改为捕获  ParseError 。

* 内部类的构造函数在失败时总是会抛出一个异常。以前一些构造函数会返回 NULL 或一个不可用的对象。

* 一些 E_STRICT 提示的错误级别改变了。

相关 RFC:
* https://wiki.php.net/rfc/engine_exceptions_for_php7
* https://wiki.php.net/rfc/throwable-interface
* https://wiki.php.net/rfc/internal_constructor_behaviour
* https://wiki.php.net/rfc/reclassify_e_strict

####其它的语言变化

* 静态调用一个不兼容的 $this 上下文的非静态调用的做法不再支持。这种情况下，$this 是没有定义的，但是对它的调用是允许的，并带有一个废弃提示。例子：

      	class A {
          	public function test() { var_dump($this); }
      	}

      	// 注意：没有从类 A 进行扩展
      	class B {
          	public function callNonStaticMethodOfA() { A::test(); }
      	}
      
      	(new B)->callNonStaticMethodOfA();

      	// 废弃：非静态方法 A::test() 不应该被静态调用
      	// 提示：未定义的变量 $this
      	NULL

  注意，这仅出现在来自不兼容上下文的调用上。如果类 B 扩展自类 A ，调用会被允许，没有任何提示。

* 不能使用下列类名、接口名和特殊名（大小写敏感）：

      	bool
      	int
      	float
      	string
      	null
      	false
      	true

  这用于 class/interface/trait 声明、 class_alias() 和 use 语句中。

  此外，下列类名、接口名和特殊名保留做将来使用，但是使用时尚不会抛出错误：

      	resource
      	object
      	mixed
      	numeric

* yield 语句结构当用在一个表达式上下文时，不再要求括号。它现在是一个优先级在 “print” 和 “=>” 之间的右结合操作符。在某些情况下这会导致不同的行为，例如：

      	echo yield -1;
      	// 以前被解释如下
      	echo (yield) - 1;
      	// 现在被解释如下
      	echo yield (-1);

      	yield $foo or die;
      	// 以前被解释如下
      	yield ($foo or die);
      	// 现在被解释如下
      	(yield $foo) or die;

  这种情况可以通过增加括号来解决。

* 移除了 ASP (\<%) 和 script (\<script language=php>) 标签。

	RFC: https://wiki.php.net/rfc/remove_alternative_php_tags
	
* 不支持以引用的方式对 new 的结果赋值。

* 不支持对一个来自非兼容的 $this 上下文的非静态方法的域内调用。细节参见： https://wiki.php.net/rfc/incompat_ctx 。

* 不支持 ini 文件中的 # 风格的备注。使用 ; 风格的备注替代。

* $HTTP\_RAW\_POST\_DATA 不再可用，使用 php://input 流替代。

###标准库的变化

* call\_user\_method() 和 call\_user\_method\_array() 不再存在。

* 在一个输出缓冲区被创建在输出缓冲处理器里时， ob\_start() 不再发出 E\_ERROR，而是 E\_RECOVERABLE\_ERROR。

* 改进的 zend\_qsort （使用 hybrid 排序算法）性能更好，并改名为 zend\_sort。

* 增加静态排序算法 zend\_insert\_sort。

* 移除 fpm-fcgi 的 dl() 函数。

* setcookie() 如果 cookie 名为空会触发一个  WARNING ，而不是发出一个空的  set-cookie 头。

###其它

- Curl:
  - 去除对禁用 CURLOPT\_SAFE\_UPLOAD 选项的支持。所有的 curl 文件上载必须使用 curl\_file / CURLFile API。

- Date:
  - 从 mktime() 和 gmmktime() 中移除 $is\_dst 参数

- DBA
  - 如果键也没有出现在 inifile 处理器中，dba\_delete() 现在会返回 false。

- GMP
  - 现在要求 libgmp 版本 4.2 或更新。
  - gmp\_setbit() 和 gmp\_clrbit() 对于负指标返回 FALSE，和其它的 GMP 函数一致。

- Intl:
  - 移除废弃的别名 datefmt\_set\_timezone\_id() 和 IntlDateFormatter::setTimeZoneID()。替代使用 datefmt\_set\_timezone() 和 IntlDateFormatter::setTimeZone()。

- libxml:
  - 增加 LIBXML\_BIGLINES 解析器选项。从 libxml 2.9.0 开始可用，并增加了在错误报告中行号大于 16 位的支持。
  
- Mcrypt
  - 移除等同于 mcrypt\_generic\_deinit() 的废弃别名  mcrypt\_generic\_end()。
  - 移除废弃的 mcrypt\_ecb()、 mcrypt\_cbc()、 mcrypt\_cfb() 和 mcrypt\_ofb() 函数，它们等同于使用 MCRYPT\_MODE\_* 标志的 mcrypt\_encrypt() 和 mcrypt\_decrypt() 。
  
- Session
  - session\_start() 以数组方式接受所有的 INI 设置。例如， ['cache\_limiter'=>'private'] 会设置 session.cache\_limiter=private 。也支持 'read\_and\_close' 以在读取数据后立即关闭会话数据。
  - 会话保存处理器接受使用 validate\_sid() 和 update\_timestamp() 来校验会话 ID 是否存在、更新会话时间戳。对旧式的用户定义的会话保存处理器继续兼容。
  - 增加了 SessionUpdateTimestampHandlerInterface 。 validateSid()、 updateTimestamp()
    定义在接口里面。
  - session.lazy\_write(默认是 On) 的 INI 设置支持仅在会话数据更新时写入。

- Opcache
  - 移除 opcache.load\_comments 配置语句。现在文件内备注载入无成本，并且总是启用的。

- OpenSSL:
  - 移除 "rsa\_key\_size" SSL 上下文选项，按给出的协商的加密算法自动设置适当的大小。
  - 移除 "CN\_match" 和 "SNI\_server\_name" SSL 上下文选项。使用自动侦测或 "peer\_name" 选项替代。

- PCRE:
  - 移除对 /e (PREG\_REPLACE\_EVAL) 修饰符的支持，使用 preg\_replace\_callback() 替代。

- PDO\_pgsql:
  - 移除 PGSQL\_ATTR\_DISABLE\_NATIVE\_PREPARED\_STATEMENT 属性，等同于 ATTR\_EMULATE\_PREPARES。

- Standard:
  - 移除 setlocale() 中的字符串类目支持。使用 LC_* 常量替代。
    instead.
  - 移除 set\_magic\_quotes\_runtime() 及其别名 magic\_quotes\_runtime()。

- JSON:
  - 拒绝 json_decode 中的 RFC 7159 不兼容数字格式 - 顶层 (07, 0xff, .1, -.1) 和所有层的 ([1.], [1.e1])
  - 用一个参数调用 json\_decode 等价于用空的 PHP 字符串或值调用，转换为空字符串（NULL, FALSE）的结果是 JSON 格式错误。

- Stream:
  - 移除 set\_socket\_blocking() ，等同于其别名 stream\_set\_blocking()。

- XSL:
  - 移除 xsl.security\_prefs ini 选项，使用 XsltProcessor::setSecurityPrefs() 替代。

##2. 新功能

- Core
  - 增加了组式 use 声明。
    (RFC: https://wiki.php.net/rfc/group_use_declarations)
  - 增加了 null 合并操作符 (??)。
    (RFC: https://wiki.php.net/rfc/isset_ternary)
  - 在 64 位架构上支持长度 >= 2^31 字节的字符串。
  - 增加了 Closure::call() 方法（仅工作在用户侧的类）。
  - 在双引号字符串和 here 文档中增加了 \u{xxxxxx} Unicode 码点转义格式。
  - define() 现在支持数组作为常量值，修复了一个当 define() 还不支持数组常量值时的疏忽。
  - 增加了比较操作符 (<=>)，即太空船操作符。
    (RFC: https://wiki.php.net/rfc/combined-comparison-operator)
  - 为委托生成器添加了类似协程的 yield from 操作符。
    (RFC: https://wiki.php.net/rfc/generator-delegation)
  - 保留的关键字现在可以用在几种新的上下文中。
    (RFC: https://wiki.php.net/rfc/context_sensitive_lexer)
  - 增加了标量类型的声明支持，并可以使用 declare(strict\_types=1) 的声明严格模式。
    (RFC: https://wiki.php.net/rfc/scalar_type_hints_v5)
  - 增加了对加密级安全的用户侧的随机数发生器的支持。
    (RFC: https://wiki.php.net/rfc/easy_userland_csprng)

- Opcache
  - 增加了基于文件的二级 opcode 缓存（实验性——默认禁用）。要启用它，PHP 需要使用 --enable-opcache-file 配置和构建，然后 opcache.file\_cache=\<DIR> 配置指令就可以设置在 php.ini 中。二级缓存也许可以提升服务器重启或 SHM 重置时的性能。此外，也可以设置 opcache.file\_cache\_only=1 来使用文件缓存而根本不用 SHM（也许对于共享主机有用）；设置 opcache.file\_cache\_consistency\_checks=0 来禁用文件缓存一致性检查，以加速载入过程，有安全风险。

- OpenSSL
  - 当用 OpenSSL 1.0.2 及更新构建时，增加了 "alpn\_protocols" SSL 上下文选项来允许加密的客户端/服务器流使用 ALPN TLS 扩展去协商替代的协议。协商后的协议信息可以通过 stream\_get\_meta\_data() 输出访问。

- Reflection
  - 增加了一个 ReflectionGenerator 类（yield from Traces，当前文件/行等等）。
  - 增加了一个 ReflectionType 类来更好的支持新的返回类型和标量类型声明功能。新的  ReflectionParameter::getType() 和 ReflectionFunctionAbstract::getReturnType() 方法都返回一个  ReflectionType 实例。

- Stream
  - 添加了新的仅用于 Windows 的流上下文选项以允许阻塞管道读取。要启用该功能，当创建流上下文时，传递 array("pipe" => array("blocking" => true)) 。要注意的是，该选项会导致管道缓冲区的死锁，然而它在几个命令行场景中有用。

##3. SAPI 模块的变化

- FPM
  - 修复错误 #65933 （不能设置超过1024字节的配置行）。
  - Listen = port 现在监听在所有地址上（IPv6 和 IPv4 映射的）。

##4. 废弃的功能

- Core
  - 废弃了 PHP 4 风格的构建函数（即构建函数名必须与类名相同）。
  - 废弃了对非静态方法的静态调用。

- OpenSSL
  - 废弃了 "capture\_session\_meta" SSL 上下文选项。 在流资源上活动的加密相关的元数据可以通过 stream\_get\_meta\_data() 的返回值访问。

##5. 函数的变化

- parse\_ini\_file():
- parse\_ini\_string():
  - 添加了扫描模式 INI_SCANNER_TYPED 来得到 yield 类型的 .ini 值。

- unserialize():
  - 给 unserialize 函数添加了第二个参数 
    (RFC: https://wiki.php.net/rfc/secure_unserialize) 来指定可接受的类： 
    unserialize($foo, ["allowed_classes" => ["MyClass", "MyClass2"]]);
    
- proc\_open():
  - 可以被 proc\_open() 使用的最大管道数以前被硬编码地限制为 16。现在去除了这个限制，只受限于 PHP 的可用内存大小。
  - 新添加的仅用于 Windows 的配置选项 "blocking\_pipes" 可以用于强制阻塞对子进程管道的读取。这可以用于几种命令行应用场景，但是它会导致死锁。此外，这与新的流的管道上下文选项相关。

- array_column():
  - 该函数现在支持把对象数组当做二维数组。只有公开属性会被处理，对象里面使用 \_\_get() 的动态属性必须也实现 \_\_isset()  才行。

- stream\_context\_create()
  - 现在可以接受一个仅 Windows 可用的配置 array("pipe" => array("blocking" => \<boolean>)) 来强制阻塞管道读取。该选项应该小心使用，该平台有可能导致管道缓冲区的死锁。

##6. 新函数

- GMP
  - 添加了 gmp\_random\_seed()。

- PCRE:
  - 添加了 preg\_replace\_callback\_array 函数。
    (RFC: https://wiki.php.net/rfc/preg_replace_callback_array)

- Standard
  . 添加了整数除法 intdiv() 函数。
  . 添加了重置错误状态的 error\_clear\_last() 函数。

- Zlib:
  . 添加了 deflate\_init()、 deflate\_add()、 inflate\_init()、 inflate\_add() 函数来运行递增和流的压缩/解压。

##7. 新的类和接口

（暂无）

##8. 移除的扩展和 SAPI

- sapi/aolserver
- sapi/apache
- sapi/apache_hooks
- sapi/apache2filter
- sapi/caudium
- sapi/continuity
- sapi/isapi
- sapi/milter
- sapi/nsapi
- sapi/phttpd
- sapi/pi3web
- sapi/roxen
- sapi/thttpd
- sapi/tux
- sapi/webjames
- ext/mssql
- ext/mysql
- ext/sybase_ct
- ext/ereg

更多细节参见：

- https://wiki.php.net/rfc/removal_of_dead_sapis_and_exts
- https://wiki.php.net/rfc/remove_deprecated_functionality_in_php7

注意：NSAPI 没有在 RFC 中投票，不过它会在以后移除。这就是说，它相关的 SDK 今后不可用。

##9. 扩展的其它变化

- Mhash
  - Mhash 今后不是一个扩展了，使用 function\_exists("mhash") 来检查器是否可用。

##10. 新的全局常量

- Core
  . 添加 PHP\_INT\_MIN 

- Zlib
  - 添加的这些常量用于控制新的增量deflate\_add() 和 inflate\_add() 函数的刷新行为：
  - ZLIB\_NO\_FLUSH
  - ZLIB\_PARTIAL\_FLUSH
  - ZLIB\_SYNC\_FLUSH
  - ZLIB\_FULL\_FLUSH
  - ZLIB\_BLOCK
  - ZLIB\_FINISH

- GD
  - 移除了 T1Lib 支持，这样由于对 T1Lib 的可选依赖，如下将来不可用：

    函数：
      - imagepsbbox()
      - imagepsencodefont()
      - imagepsextendedfont()
      - imagepsfreefont()
      - imagepsloadfont()
      - imagepsslantfont()
      - imagepstext()

    资源：
      - 'gd PS font'
      - 'gd PS encoding'

##11. INI 文件处理的变化

- Core
  - 移除了 asp\_tags ini 指令。如果启用它会导致致命错误。
  - 移除了 always\_populate\_raw\_post\_data ini 指令。

##12. Windows 支持

- Core
  - 在 64 位系统上支持原生的 64 位整数。
  - 在 64 位系统上支持大文件。
  - 支持 getrusage()。

- ftp
  - 所带的 ftp 扩展总是共享库的。
  - 对于 SSL 支持，取消了对 openssl 扩展的依赖，取而代之仅依赖 openssl 库。如果在编译时需要，会自动启用
    ftp\_ssl\_connect()。

- odbc
  - 所带的 odbc 扩展总是共享库的。

##13. 其它变化

- Core
  - NaN 和 Infinity 转换为整数时总是 0，而不是未定义和平台相关的。
  - 对非对象调用方法会触发一个可捕获错误，而不是致命错误；参见： https://wiki.php.net/rfc/catchable-call-to-member-of-non-object
  - zend\_parse\_parameters、类型提示和转换，现在总是用 "integer" 和 "float"，而不是 "long" 和 "double"。
  - 如果 ignore\_user\_abort 设置为 true ，对应中断的连接，输出缓存会继续工作。
    

--------------------------------------------------------------------------------

via: https://github.com/php/php-src/blob/php-7.0.0beta1/UPGRADING

作者：[php][a]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/php
