[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Find security issues in Go code using gosec)
[#]: via: (https://opensource.com/article/20/9/gosec)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Find security issues in Go code using gosec
======
Get started with gosec, the Golang security checker.
![A lock on the side of a building][1]

It's extremely common now to encounter code written in the [Go programming language][2], especially if you are working with containers, Kubernetes, or a cloud ecosystem. Docker was one of the first projects to adopt Golang, Kubernetes followed, and many new projects select Go over other programming languages.

Like any other language, Go has its share of strengths and weaknesses, which include security flaws. These can arise due to issues in the programming language itself coupled with insecure coding practices, such as memory safety issues in C code, for example.

Regardless of why they occur, security issues need to be fixed early in development to prevent them from creeping into shipped software. Fortunately, static analysis tools are available to help you tackle these issues in a more repeatable manner. Static analysis tools work by parsing source code written in a programming language and looking for issues.

Many of these tools are called linters. Traditionally, linters are more focused on finding programming issues, bugs, code style issues, and the like, and they may not find security issues in code. For example, [Coverity][3] is a popular tool that helps find issues in C/C++ code. However, there are tools that specifically seek out security issues in source code. For example, [Bandit][4] looks for security flaws in Python code. And [gosec][5] searches for security flaws in Go source code. Gosec scans the Go abstract syntax tree (AST) to inspect source code for security problems.

### Get started with gosec

To play around with gosec and learn how it works, you need a project written in Go. With a wide variety of open source software available, this shouldn't be a problem. You can find one by looking at the [trending Golang repositorties][6] on GitHub.

For this tutorial, I randomly chose the [Docker CE][7] project, but you can choose any Go project you want.

#### Install Go and gosec

If you do not already have Go installed, you can fetch it from your repository. If you use Fedora or another RPM-based Linux distribution:


```
`$ dnf install golang.x86_64`
```

Or you can visit the [Golang install][8] page for other options for your operating system.

Verify that Go is installed on your system using the `version` argument:


```
$ go version
go version go1.14.6 linux/amd64
$
```

Installing gosec is simply a matter of running the `go get` command:


```
$ go get github.com/securego/gosec/cmd/gosec
$
```

This downloads gosec's source code from GitHub, compiles it, and installs it in a specific location. You can find [other ways of installing the tools][9] in the repo's README.

Gosec's source code should be downloaded to the location set by `$GOPATH`, and the compiled binary will be installed in the `bin` directory you set for your system. To find out what `$GOPATH` and `$GOBIN` point to, run:


```
$ go env | grep GOBIN
GOBIN="/root/go/gobin"
$
$ go env | grep GOPATH
GOPATH="/root/go"
$
```

If the `go get` command worked, then the gosec binary should be available:


```
$
$ ls -l ~/go/bin/
total 9260
-rwxr-xr-x. 1 root root 9482175 Aug 20 04:17 gosec
$
```

You can add the `bin` directory in `$GOPATH` to the `$PATH` variable in your shell. This makes the gosec command-line interface (CLI) available just like any other command line on your system:


```
$ which gosec
/root/go/bin/gosec
$
```

Try running the gosec CLI with the `-help` option to see if it is working as expected:


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

Next, create a directory and get the source code for the demo project (Docker CE, in this case) using:


```
$ mkdir gosec-demo
$
$ cd gosec-demo/
$
$ pwd
/root/gosec-demo
$

$ git clone <https://github.com/docker/docker-ce.git>
Cloning into 'docker-ce'...
remote: Enumerating objects: 1271, done.
remote: Counting objects: 100% (1271/1271), done.
remote: Compressing objects: 100% (722/722), done.
remote: Total 431003 (delta 384), reused 981 (delta 318), pack-reused 429732
Receiving objects: 100% (431003/431003), 166.84 MiB | 28.94 MiB/s, done.
Resolving deltas: 100% (221338/221338), done.
Updating files: 100% (10861/10861), done.
$
```

A quick look at the source code shows that most of the project is written in Go—just what you need to tinker with gosec's features:


```
$ ./cloc /root/gosec-demo/docker-ce/
   10771 text files.
    8724 unique files.                                          
    2560 files ignored.

\-----------------------------------------------------------------------------------
Language                         files          blank        comment           code
\-----------------------------------------------------------------------------------
Go                                7222         190785         230478        1574580
YAML                                37           4831            817         156762
Markdown                           529          21422              0          67893
Protocol Buffers                   149           5014          16562          10071
```

### Run gosec with the default options

Run gosec on the Docker CE project using the default options by running `gosec ./...` from within the Git repo you just cloned. A lot of output will be shown on the screen. Towards the end, you should see a short `Summary` showing the number of files scanned, the number of lines in those files, and the issues it found in the source code:


```
$ pwd
/root/gosec-demo/docker-ce
$
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

real    0m52.019s
user    0m37.284s
sys     0m12.734s
$
```

If you scroll through the output on the screen, you should see some lines highlighted in various colors: red indicates high-priority issues that need to be looked into first, and yellow indicates medium-priority issues.

#### About false positives

Before getting into the findings, I want to share some ground rules. By default, static analysis tools report _everything_ that they find to be an issue based on a set of rules that the tool compares against the code being tested. Does this mean that everything reported by the tool is an issue that needs to be fixed? Well, it depends. The best authorities on this question are the developers who designed and developed the software. They understand the code much better than anybody else, and more importantly, they understand the environment where the software will be deployed and how it will be used.

This knowledge is critical when deciding whether a piece of code flagged by a tool is actually a security flaw. Over time and with more experience, you will learn to tweak static analysis tools to ignore issues that are not security flaws and make the reports more actionable. So, an experienced developer doing a manual audit of the source code would be in a better position to decide whether an issue reported by gosec warrants attention or not.

#### High-priority issues

According to the output, gosec found a high-priority issue that Docker CE is using an old Transport Layer Security (TLS) version. Whenever possible, it's best to use the latest version of a software or library to ensure it is up to date and has no security issues.


```
[/root/gosec-demo/docker-ce/components/engine/daemon/logger/splunk/splunk.go:173] - G402 (CWE-295): TLS MinVersion too low. (Confidence: HIGH, Severity: HIGH)
    172:
  &gt; 173:        tlsConfig := &amp;tls.Config{}
    174:
```

It also found a weak random number generator. Depending on how the generated random number is used, you can decide whether or not this is a security flaw.


```
[/root/gosec-demo/docker-ce/components/engine/pkg/namesgenerator/names-generator.go:843] - G404 (CWE-338): Use of weak random number generator (math/rand instead of crypto/rand) (Confidence: MEDIUM, Severity: HIGH)
    842: begin:
  &gt; 843:        name := fmt.Sprintf("%s_%s", left[rand.Intn(len(left))], right[rand.Intn(len(right))])
    844:        if name == "boring_wozniak" /* Steve Wozniak is not boring */ {
```

#### Medium-priority issues

The tool also found some medium-priority issues. It flagged a potential denial of service (DoS) vulnerability by way of a decompression bomb related to a tar that could possibly be exploited by a malicious actor.


```
[/root/gosec-demo/docker-ce/components/engine/pkg/archive/copy.go:357] - G110 (CWE-409): Potential DoS vulnerability via decompression bomb (Confidence: MEDIUM, Severity: MEDIUM)
    356:
  &gt; 357:                        if _, err = io.Copy(rebasedTar, srcTar); err != nil {
    358:                                w.CloseWithError(err)
```

It also found an issue related to a file that is included by way of a variable. If malicious users take control of this variable, they could change its contents to read a different file.


```
[/root/gosec-demo/docker-ce/components/cli/cli/context/tlsdata.go:80] - G304 (CWE-22): Potential file inclusion via variable (Confidence: HIGH, Severity: MEDIUM)
    79:         if caPath != "" {
  &gt; 80:                 if ca, err = ioutil.ReadFile(caPath); err != nil {
    81:                         return nil, err
```

File and directory permissions are often the basic building blocks of security on an operating system. Here, gosec identified an issue where you might need to check whether the permissions for a directory are secure or not.


```
[/root/gosec-demo/docker-ce/components/engine/contrib/apparmor/main.go:41] - G301 (CWE-276): Expect directory permissions to be 0750 or less (Confidence: HIGH, Severity: MEDIUM)
    40:         // make sure /etc/apparmor.d exists
  &gt; 41:         if err := os.MkdirAll(path.Dir(apparmorProfilePath), 0755); err != nil {
    42:                 log.Fatal(err)
```

Often, you need to launch command-line utilities from source code. Go uses the built-in exec library to do this task. Carefully analyzing the variable used to spawn such utilities can uncover security flaws.


```
[/root/gosec-demo/docker-ce/components/engine/testutil/fakestorage/fixtures.go:59] - G204 (CWE-78): Subprocess launched with variable (Confidence: HIGH, Severity: MEDIUM)
    58:
  &gt; 59:              cmd := exec.Command(goCmd, "build", "-o", filepath.Join(tmp, "httpserver"), "github.com/docker/docker/contrib/httpserver")
    60:                 cmd.Env = append(os.Environ(), []string{
```

#### Low-severity issues

In this output, gosec identified low-severity issues related to "unsafe" calls, which typically bypass all the memory protections that Go provides. Closely analyze your use of "unsafe" calls to see if they can be exploited in any way possible.


```
[/root/gosec-demo/docker-ce/components/engine/pkg/archive/changes_linux.go:264] - G103 (CWE-242): Use of unsafe calls should be audited (Confidence: HIGH, Severity: LOW)
    263:        for len(buf) &gt; 0 {
  &gt; 264:                dirent := (*unix.Dirent)(unsafe.Pointer(&amp;buf[0]))
    265:                buf = buf[dirent.Reclen:]

[/root/gosec-demo/docker-ce/components/engine/pkg/devicemapper/devmapper_wrapper.go:88] - G103 (CWE-242): Use of unsafe calls should be audited (Confidence: HIGH, Severity: LOW)
    87: func free(p *C.char) {
  &gt; 88:         C.free(unsafe.Pointer(p))
    89: }
```

It also flagged unhandled errors in the source codebase. You are expected to handle cases where errors could arise in the source code.


```
[/root/gosec-demo/docker-ce/components/cli/cli/command/image/build/context.go:172] - G104 (CWE-703): Errors unhandled. (Confidence: HIGH, Severity: LOW)
    171:                err := tar.Close()
  &gt; 172:                os.RemoveAll(dockerfileDir)
    173:                return err
```

### Customize gosec scans

Using gosec with its defaults brings up many kinds of issues. However, with manual auditing and over time, you learn which issues don't need to be flagged. You can customize gosec to exclude or include certain tests.

As I mentioned above, gosec uses a set of rules to find problems in Go source code. Here is a complete list of the [rules][10] it uses:

  * G101: Look for hard coded credentials
  * G102: Bind to all interfaces
  * G103: Audit the use of unsafe block
  * G104: Audit errors not checked
  * G106: Audit the use of ssh.InsecureIgnoreHostKey
  * G107: Url provided to HTTP request as taint input
  * G108: Profiling endpoint automatically exposed on /debug/pprof
  * G109: Potential Integer overflow made by strconv.Atoi result conversion to int16/32
  * G110: Potential DoS vulnerability via decompression bomb
  * G201: SQL query construction using format string
  * G202: SQL query construction using string concatenation
  * G203: Use of unescaped data in HTML templates
  * G204: Audit use of command execution
  * G301: Poor file permissions used when creating a directory
  * G302: Poor file permissions used with chmod
  * G303: Creating tempfile using a predictable path
  * G304: File path provided as taint input
  * G305: File traversal when extracting zip/tar archive
  * G306: Poor file permissions used when writing to a new file
  * G307: Deferring a method which returns an error
  * G401: Detect the usage of DES, RC4, MD5 or SHA1
  * G402: Look for bad TLS connection settings
  * G403: Ensure minimum RSA key length of 2048 bits
  * G404: Insecure random number source (rand)
  * G501: Import blocklist: crypto/md5
  * G502: Import blocklist: crypto/des
  * G503: Import blocklist: crypto/rc4
  * G504: Import blocklist: net/http/cgi
  * G505: Import blocklist: crypto/sha1
  * G601: Implicit memory aliasing of items from a range statement



#### Exclude specific tests

You can customize gosec to prevent it from looking for and reporting on issues that are safe. To ignore specific issues, you can use the `-exclude` flag with the rule codes above.

For example, if you don't want gosec to find unhandled errors related to hardcoding credentials in source code, you can ignore them by running:


```
$ gosec -exclude=G104 ./...
$ gosec -exclude=G104,G101 ./...
```

Sometimes, you know an area of source code is safe, but gosec keeps reporting it as an issue. However, you don't want to exclude that check completely because you want gosec to scan new code added to the codebase. To prevent gosec from scanning the area you know is safe, add a `#nosec` flag to that part of the source code. This ensures gosec continues to scan new code for an issue but ignores the area flagged with `#nosec`.

#### Run specific checks

On the other hand, if you need to focus on specific issues, you can use tell gosec to run those checks by using the `-include` option with the rule codes:


```
`$ gosec -include=G201,G202 ./...`
```

#### Scan test files

The Go language has built-in support for testing that uses unit tests to verify whether a component works as expected. In default mode, gosec ignores test files, but if you want them included in the scan, use the `-tests` flag:


```
`gosec -tests ./...`
```

#### Change the output format

Finding issues is only part of the picture; the other part is reporting what it finds in a way that is easy for humans and tools to consume. Fortunately, gosec can output results in a variety of ways. For example, if you want to get reports in JSON format, use the `-fmt` option to specify JSON and save the results in a `results.json` file:


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
                 "URL": "<https://cwe.mitre.org/data/definitions/242.html>"
             },
             "rule_id": "G103",
             "details": "Use of unsafe calls should be audited",
             "file": "/root/gosec-demo/docker-ce/components/engine/daemon/graphdriver/graphtest/graphtest_unix.go",
             "code": "304: \t// Cast to []byte\n305: \theader := *(*reflect.SliceHeader)(unsafe.Pointer(\u0026buf))\n306: \theader.      Len *= 8\n",
             "line": "305",
             "column": "36"
         },
```

### Find low-hanging fruit with gosec

A static analysis tool is not a replacement for manual code audits. However, when a codebase is large with many people contributing to it, such a tool often helps find low-hanging fruit in a repeatable way. It is also useful for helping new developers identify and avoid writing code that introduces these security flaws.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/gosec

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://golang.org/
[3]: https://www.synopsys.com/software-integrity/security-testing/static-analysis-sast.html
[4]: https://pypi.org/project/bandit/
[5]: https://github.com/securego/gosec
[6]: https://github.com/trending/go
[7]: https://github.com/docker/docker-ce
[8]: https://golang.org/doc/install
[9]: https://github.com/securego/gosec#install
[10]: https://github.com/securego/gosec#available-rules
