[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12681-1.html"
[#]: subject: "Find security issues in Go code using gosec"
[#]: via: "https://opensource.com/article/20/9/gosec"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"

使用 gosec 检查 Go 代码中的安全问题
======

> 来学习下 Go 语言的安全检查工具 gosec。

![](https://img.linux.net.cn/data/attachment/album/202010/04/125129bh4qxxsyqpvqjtx4.jpg)

[Go 语言][2]写的代码越来越常见，尤其是在容器、Kubernetes 或云生态相关的开发中。Docker 是最早采用 Golang 的项目之一，随后是 Kubernetes，之后大量的新项目在众多编程语言中选择了 Go。

像其他语言一样，Go 也有它的长处和短处（如安全缺陷）。这些缺陷可能会因为语言本身的缺陷加上程序员编码不当而产生，例如，C 代码中的内存安全问题。

无论它们出现的原因是什么，安全问题都应该在开发过程的早期修复，以免在封装好的软件中出现。幸运的是，静态分析工具可以帮你以更可重复的方式处理这些问题。静态分析工具通过解析用某种编程语言写的代码来找到问题。

这类工具中很多被称为 linter。传统意义上，linter 更注重的是检查代码中编码问题、bug、代码风格之类的问题，它们可能不会发现代码中的安全问题。例如，[Coverity][3] 是一个很流行的工具，它可以帮助寻找 C/C++ 代码中的问题。然而，也有一些工具专门用来检查源码中的安全问题。例如，[Bandit][4] 可以检查 Python 代码中的安全缺陷。而 [gosec][5] 则用来搜寻 Go 源码中的安全缺陷。`gosec` 通过扫描 Go 的 AST（<ruby>抽象语法树<rt>abstract syntax tree</rt></ruby>）来检查源码中的安全问题。

### 开始使用 gosec

在开始学习和使用 `gosec` 之前，你需要准备一个 Go 语言写的项目。有这么多开源软件，我相信这不是问题。你可以在 GitHub 的 [热门 Golang 仓库][6]中找一个。

本文中，我随机选了 [Docker CE][7] 项目，但你可以选择任意的 Go 项目。

#### 安装 Go 和 gosec

如果你还没安装 Go，你可以先从仓库中拉取下来。如果你用的是 Fedora 或其他基于 RPM 的 Linux 发行版本：

```
$ dnf install golang.x86_64
```

如果你用的是其他操作系统，请参照 [Golang 安装][8]页面。

使用 `version` 参数来验证 Go 是否安装成功：

```
$ go version
go version go1.14.6 linux/amd64
```

运行 `go get` 命令就可以轻松地安装 `gosec`：

```
$ go get github.com/securego/gosec/cmd/gosec
```

上面这行命令会从 GitHub 下载 `gosec` 的源码，编译并安装到指定位置。在仓库的 `README` 中你还可以看到[安装该工具的其他方法][9]。

`gosec` 的源码会被下载到 `$GOPATH` 的位置，编译出的二进制文件会被安装到你系统上设置的 `bin` 目录下。你可以运行下面的命令来查看 `$GOPATH` 和 `$GOBIN` 目录：

```
$ go env | grep GOBIN
GOBIN="/root/go/gobin"
$ go env | grep GOPATH
GOPATH="/root/go"
```

如果 `go get` 命令执行成功，那么 `gosec` 二进制应该就可以使用了：

```
$ ls -l ~/go/bin/
total 9260
-rwxr-xr-x. 1 root root 9482175 Aug 20 04:17 gosec
```

你可以把 `$GOPATH` 下的 `bin` 目录添加到 `$PATH` 中。这样你就可以像使用系统上的其他命令一样来使用 `gosec` 命令行工具（CLI）了。

```
$ which gosec
/root/go/bin/gosec
$
```

使用 `gosec` 命令行工具的 `-help` 选项来看看运行是否符合预期：

```
$ gosec -help

gosec - Golang security checker

gosec analyzes Go source code to look for common programming mistakes that
can lead to security problems.

VERSION: dev
GIT TAG:
BUILD DATE:

USAGE:
```

之后，创建一个目录，把源码下载到这个目录作为实例项目（本例中，我用的是 Docker CE）：

```
$ mkdir gosec-demo
$ cd gosec-demo/
$ pwd
/root/gosec-demo
$ git clone https://github.com/docker/docker-ce.git
Cloning into 'docker-ce'...
remote: Enumerating objects: 1271, done.
remote: Counting objects: 100% (1271/1271), done.
remote: Compressing objects: 100% (722/722), done.
remote: Total 431003 (delta 384), reused 981 (delta 318), pack-reused 429732
Receiving objects: 100% (431003/431003), 166.84 MiB | 28.94 MiB/s, done.
Resolving deltas: 100% (221338/221338), done.
Updating files: 100% (10861/10861), done.
```

代码统计工具（本例中用的是 `cloc`）显示这个项目大部分是用 Go 写的，恰好迎合了 `gosec` 的功能。


```
$ ./cloc /root/gosec-demo/docker-ce/
   10771 text files.
    8724 unique files.                                          
    2560 files ignored.


-----------------------------------------------------------------------------------
Language                         files          blank        comment           code
-----------------------------------------------------------------------------------
Go                                7222         190785         230478        1574580
YAML                                37           4831            817         156762
Markdown                           529          21422              0          67893
Protocol Buffers                   149           5014          16562          10071
```

### 使用默认选项运行 gosec

在 Docker CE 项目中使用默认选项运行 `gosec`，执行 `gosec ./...` 命令。屏幕上会有很多输出内容。在末尾你会看到一个简短的 “Summary”，列出了浏览的文件数、所有文件的总行数，以及源码中发现的问题数。

```
$ pwd
/root/gosec-demo/docker-ce
$ time gosec ./...
[gosec] 2020/08/20 04:44:15 Including rules: default
[gosec] 2020/08/20 04:44:15 Excluding rules: default
[gosec] 2020/08/20 04:44:15 Import directory: /root/gosec-demo/docker-ce/components/engine/opts
[gosec] 2020/08/20 04:44:17 Checking package: opts
[gosec] 2020/08/20 04:44:17 Checking file: /root/gosec-demo/docker-ce/components/engine/opts/address_pools.go
[gosec] 2020/08/20 04:44:17 Checking file: /root/gosec-demo/docker-ce/components/engine/opts/env.go
[gosec] 2020/08/20 04:44:17 Checking file: /root/gosec-demo/docker-ce/components/engine/opts/hosts.go

# End of gosec run

Summary:
   Files: 1278
   Lines: 173979
   Nosec: 4
  Issues: 644

real    0m52.019s
user    0m37.284s
sys     0m12.734s
$
```

滚动屏幕你会看到不同颜色高亮的行：红色表示需要尽快查看的高优先级问题，黄色表示中优先级的问题。

#### 关于误判

在开始检查代码之前，我想先分享几条基本原则。默认情况下，静态检查工具会基于一系列的规则对测试代码进行分析，并报告出它们发现的*所有*问题。这是否意味着工具报出来的每一个问题都需要修复？非也。这个问题最好的解答者是设计和开发这个软件的人。他们最熟悉代码，更重要的是，他们了解软件会在什么环境下部署以及会被怎样使用。

这个知识点对于判定工具标记出来的某段代码到底是不是安全缺陷至关重要。随着工作时间和经验的积累，你会慢慢学会怎样让静态分析工具忽略非安全缺陷，使报告内容的可执行性更高。因此，要判定 `gosec` 报出来的某个问题是否需要修复，让一名有经验的开发者对源码做人工审计会是比较好的办法。

#### 高优先级问题

从输出内容看，`gosec` 发现了 Docker CE 的一个高优先级问题，它使用的是低版本的 TLS（<ruby>传输层安全<rt>Transport Layer Security<rt></ruby>）。无论什么时候，使用软件和库的最新版本都是确保它更新及时、没有安全问题的最好的方法。

```
[/root/gosec-demo/docker-ce/components/engine/daemon/logger/splunk/splunk.go:173] - G402 (CWE-295): TLS MinVersion too low. (Confidence: HIGH, Severity: HIGH)
    172:
  > 173:        tlsConfig := &tls.Config{}
    174:
```

它还发现了一个弱随机数生成器。它是不是一个安全缺陷，取决于生成的随机数的使用方式。

```
[/root/gosec-demo/docker-ce/components/engine/pkg/namesgenerator/names-generator.go:843] - G404 (CWE-338): Use of weak random number generator (math/rand instead of crypto/rand) (Confidence: MEDIUM, Severity: HIGH)
    842: begin:
  > 843:        name := fmt.Sprintf("%s_%s", left[rand.Intn(len(left))], right[rand.Intn(len(right))])
    844:        if name == "boring_wozniak" /* Steve Wozniak is not boring */ {
```

#### 中优先级问题

这个工具还发现了一些中优先级问题。它标记了一个通过与 `tar` 相关的解压炸弹这种方式实现的潜在的 DoS 威胁，这种方式可能会被恶意的攻击者利用。

```
[/root/gosec-demo/docker-ce/components/engine/pkg/archive/copy.go:357] - G110 (CWE-409): Potential DoS vulnerability via decompression bomb (Confidence: MEDIUM, Severity: MEDIUM)
    356:
  > 357:                        if _, err = io.Copy(rebasedTar, srcTar); err != nil {
    358:                                w.CloseWithError(err)
```

它还发现了一个通过变量访问文件的问题。如果恶意使用者能访问这个变量，那么他们就可以改变变量的值去读其他文件。

```
[/root/gosec-demo/docker-ce/components/cli/cli/context/tlsdata.go:80] - G304 (CWE-22): Potential file inclusion via variable (Confidence: HIGH, Severity: MEDIUM)
    79:         if caPath != "" {
  > 80:                 if ca, err = ioutil.ReadFile(caPath); err != nil {
    81:                         return nil, err
```

文件和目录通常是操作系统安全的最基础的元素。这里，`gosec` 报出了一个可能需要你检查目录的权限是否安全的问题。

```
[/root/gosec-demo/docker-ce/components/engine/contrib/apparmor/main.go:41] - G301 (CWE-276): Expect directory permissions to be 0750 or less (Confidence: HIGH, Severity: MEDIUM)
    40:         // make sure /etc/apparmor.d exists
  > 41:         if err := os.MkdirAll(path.Dir(apparmorProfilePath), 0755); err != nil {
    42:                 log.Fatal(err)
```

你经常需要在源码中启动命令行工具。Go 使用内建的 exec 库来实现。仔细地分析用来调用这些工具的变量，就能发现安全缺陷。

```
[/root/gosec-demo/docker-ce/components/engine/testutil/fakestorage/fixtures.go:59] - G204 (CWE-78): Subprocess launched with variable (Confidence: HIGH, Severity: MEDIUM)
    58:
  > 59:              cmd := exec.Command(goCmd, "build", "-o", filepath.Join(tmp, "httpserver"), "github.com/docker/docker/contrib/httpserver")
    60:                 cmd.Env = append(os.Environ(), []string{
```

#### 低优先级问题

在这个输出中，gosec 报出了一个 `unsafe` 调用相关的低优先级问题，这个调用会绕开 Go 提供的内存保护。再仔细分析下你调用 `unsafe` 的方式，看看是否有被别人利用的可能性。

```
[/root/gosec-demo/docker-ce/components/engine/pkg/archive/changes_linux.go:264] - G103 (CWE-242): Use of unsafe calls should be audited (Confidence: HIGH, Severity: LOW)
    263:        for len(buf) > 0 {
  > 264:                dirent := (*unix.Dirent)(unsafe.Pointer(&buf[0]))
    265:                buf = buf[dirent.Reclen:]



[/root/gosec-demo/docker-ce/components/engine/pkg/devicemapper/devmapper_wrapper.go:88] - G103 (CWE-242): Use of unsafe calls should be audited (Confidence: HIGH, Severity: LOW)
    87: func free(p *C.char) {
  > 88:         C.free(unsafe.Pointer(p))
    89: }
```

它还标记了源码中未处理的错误。源码中出现的错误你都应该处理。

```
[/root/gosec-demo/docker-ce/components/cli/cli/command/image/build/context.go:172] - G104 (CWE-703): Errors unhandled. (Confidence: HIGH, Severity: LOW)
    171:                err := tar.Close()
  > 172:                os.RemoveAll(dockerfileDir)
    173:                return err
```

### 自定义 gosec 扫描

使用 `gosec` 的默认选项会带来很多的问题。然而，经过人工审计，随着时间推移你会掌握哪些问题是不需要标记的。你可以自己指定排除和包含哪些测试。

我上面提到过，`gosec` 是基于一系列的规则从 Go 源码中查找问题的。下面是它使用的完整的[规则][10]列表：

- G101：查找硬编码凭证
- G102：绑定到所有接口
- G103：审计 `unsafe` 块的使用
- G104：审计未检查的错误
- G106：审计 `ssh.InsecureIgnoreHostKey` 的使用
- G107: 提供给 HTTP 请求的 url 作为污点输入
- G108: `/debug/pprof` 上自动暴露的剖析端点
- G109: `strconv.Atoi` 转换到 int16 或 int32 时潜在的整数溢出
- G110: 潜在的通过解压炸弹实现的 DoS
- G201：SQL 查询构造使用格式字符串
- G202：SQL 查询构造使用字符串连接
- G203：在 HTML 模板中使用未转义的数据
- G204：审计命令执行情况
- G301：创建目录时文件权限分配不合理
- G302：使用 `chmod` 时文件权限分配不合理
- G303：使用可预测的路径创建临时文件
- G304：通过污点输入提供的文件路径
- G305：提取 zip/tar 文档时遍历文件
- G306: 写到新文件时文件权限分配不合理
- G307: 把返回错误的函数放到 `defer` 内
- G401：检测 DES、RC4、MD5 或 SHA1 的使用
- G402：查找错误的 TLS 连接设置
- G403：确保最小 RSA 密钥长度为 2048 位
- G404：不安全的随机数源（`rand`）
- G501：导入黑名单列表：crypto/md5
- G502：导入黑名单列表：crypto/des
- G503：导入黑名单列表：crypto/rc4
- G504：导入黑名单列表：net/http/cgi
- G505：导入黑名单列表：crypto/sha1
- G601: 在 `range` 语句中使用隐式的元素别名

#### 排除指定的测试

你可以自定义 `gosec` 来避免对已知为安全的问题进行扫描和报告。你可以使用 `-exclude` 选项和上面的规则编号来忽略指定的问题。

例如，如果你不想让 `gosec` 检查源码中硬编码凭证相关的未处理的错误，那么你可以运行下面的命令来忽略这些错误：

```
$ gosec -exclude=G104 ./...
$ gosec -exclude=G104,G101 ./...
```

有时候你知道某段代码是安全的，但是 `gosec` 还是会报出问题。然而，你又不想完全排除掉整个检查，因为你想让 `gosec` 检查新增的代码。通过在你已知为安全的代码块添加 `#nosec` 标记可以避免 `gosec` 扫描。这样 `gosec` 会继续扫描新增代码，而忽略掉 `#nosec` 标记的代码块。

#### 运行指定的检查

另一方面，如果你只想检查指定的问题，你可以通过 `-include` 选项和规则编号来告诉 `gosec` 运行哪些检查：

```
$ gosec -include=G201,G202 ./...
```

#### 扫描测试文件

Go 语言自带对测试的支持，通过单元测试来检验一个元素是否符合预期。在默认模式下，`gosec` 会忽略测试文件，你可以使用 `-tests` 选项把它们包含进来：

```
gosec -tests ./...
```

#### 修改输出的格式

找出问题只是它的一半功能；另一半功能是把它检查到的问题以用户友好同时又方便工具处理的方式报告出来。幸运的是，`gosec` 可以用不同的方式输出。例如，如果你想看 JSON 格式的报告，那么就使用 `-fmt` 选项指定 JSON 格式并把结果保存到 `results.json` 文件中：

```
$ gosec -fmt=json -out=results.json ./...

$ ls -l results.json
-rw-r--r--. 1 root root 748098 Aug 20 05:06 results.json
$

         {
             "severity": "LOW",
             "confidence": "HIGH",
             "cwe": {
                 "ID": "242",
                 "URL": "https://cwe.mitre.org/data/definitions/242.html"
             },
             "rule_id": "G103",
             "details": "Use of unsafe calls should be audited",
             "file": "/root/gosec-demo/docker-ce/components/engine/daemon/graphdriver/graphtest/graphtest_unix.go",
             "code": "304: \t// Cast to []byte\n305: \theader := *(*reflect.SliceHeader)(unsafe.Pointer(\u0026buf))\n306: \theader.      Len *= 8\n",
             "line": "305",
             "column": "36"
         },
```

### 用 gosec 检查容易被发现的问题

静态检查工具不能完全代替人工代码审计。然而，当代码量变大、有众多开发者时，这样的工具往往有助于以可重复的方式找出容易被发现的问题。它对于帮助新开发者识别和在编码时避免引入这些安全缺陷很有用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/gosec

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[lxbowlf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA "A lock on the side of a building"
[2]: https://golang.org/
[3]: https://www.synopsys.com/software-integrity/security-testing/static-analysis-sast.html
[4]: https://pypi.org/project/bandit/
[5]: https://github.com/securego/gosec
[6]: https://github.com/trending/go
[7]: https://github.com/docker/docker-ce
[8]: https://golang.org/doc/install
[9]: https://github.com/securego/gosec#install
[10]: https://github.com/securego/gosec#available-rules

