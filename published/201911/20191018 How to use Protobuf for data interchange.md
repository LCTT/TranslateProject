[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11600-1.html)
[#]: subject: (How to use Protobuf for data interchange)
[#]: via: (https://opensource.com/article/19/10/protobuf-data-interchange)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

如何使用 Protobuf 做数据交换
======

> 在以不同语言编写并在不同平台上运行的应用程序之间交换数据时，Protobuf 编码可提高效率。

![](https://img.linux.net.cn/data/attachment/album/201911/22/075757pn2fxfth30ntwefg.jpg)

<ruby>协议缓冲区<rt>Protocol Buffers</rt></ruby>（[Protobufs][2]）像 XML 和 JSON 一样，可以让用不同语言编写并在不同平台上运行的应用程序交换数据。例如，用 Go 编写的发送程序可以在 Protobuf 中对以 Go 表示的销售订单数据进行编码，然后用 Java 编写的接收方可以对它进行解码，以获取所接收订单数据的 Java 表示方式。这是在网络连接上的结构示意图：

> Go 销售订单 ---> Pbuf 编码 ---> 网络 ---> Pbuf 界面 ---> Java 销售订单

与 XML 和 JSON 相比，Protobuf 编码是二进制而不是文本，这会使调试复杂化。但是，正如本文中的代码示例所确认的那样，Protobuf 编码在大小上比 XML 或 JSON 编码要有效得多。

Protobuf 以另一种方式提供了这种有效性。在实现级别，Protobuf 和其他编码系统对结构化数据进行<ruby>序列化<rt>serialize</rt></ruby>和<ruby>反序列化<rt>deserialize</rt></ruby>。序列化将特定语言的数据结构转换为字节流，反序列化是将字节流转换回特定语言的数据结构的逆运算。序列化和反序列化可能成为数据交换的瓶颈，因为这些操作会占用大量 CPU。高效的序列化和反序列化是 Protobuf 的另一个设计目标。

最近的编码技术，例如 Protobuf 和 FlatBuffers，源自 1990 年代初期的 [DCE/RPC][3]（<ruby>分布式计算环境/远程过程调用<rt>Distributed Computing Environment/Remote Procedure Call</rt></ruby>）计划。与 DCE/RPC 一样，Protobuf 在数据交换中为 [IDL][4]（接口定义语言）和编码层做出了贡献。

本文将着眼于这两层，然后提供 Go 和 Java 中的代码示例以充实 Protobuf 的细节，并表明 Protobuf 是易于使用的。

### Protobuf 作为一个 IDL 和编码层

像 Protobuf 一样，DCE/RPC 被设计为与语言和平台无关。适当的库和实用程序允许任何语言和平台用于 DCE/RPC 领域。此外，DCE/RPC 体系结构非常优雅。IDL 文档是一侧的远程过程与另一侧的调用者之间的协定。Protobuf 也是以 IDL 文档为中心的。

IDL 文档是文本，在 DCE/RPC 中，使用基本 C 语法以及元数据的语法扩展（方括号）和一些新的关键字，例如 `interface`。这是一个例子：

```
[uuid (2d6ead46-05e3-11ca-7dd1-426909beabcd), version(1.0)]
interface echo {
   const long int ECHO_SIZE = 512;
   void echo(
      [in]          handle_t h,
      [in, string]  idl_char from_client[ ],
      [out, string] idl_char from_service[ECHO_SIZE]
   );
}
```

该 IDL 文档声明了一个名为 `echo` 的过程，该过程带有三个参数：类型为 `handle_t`（实现指针）和 `idl_char`（ASCII 字符数组）的 `[in]` 参数被传递给远程过程，而 `[out]` 参数（也是一个字符串）从该过程中传回。在此示例中，`echo` 过程不会显式返回值（`echo` 左侧的 `void`），但也可以返回值。返回值，以及一个或多个 `[out]` 参数，允许远程过程任意返回许多值。下一节将介绍 Protobuf IDL，它的语法不同，但同样用作数据交换中的协定。

DCE/RPC 和 Protobuf 中的 IDL 文档是创建用于交换数据的基础结构代码的实用程序的输入：

> IDL 文档 ---> DCE/PRC 或 Protobuf 实用程序 ---> 数据交换的支持代码

作为相对简单的文本，IDL 是同样便于人类阅读的关于数据交换细节的文档（特别是交换的数据项的数量和每个项的数据类型）。

Protobuf 可用于现代 RPC 系统，例如 [gRPC][5]；但是 Protobuf 本身仅提供 IDL 层和编码层，用于从发送者传递到接收者的消息。与原本的 DCE/RPC 一样，Protobuf 编码是二进制的，但效率更高。

目前，XML 和 JSON 编码仍在通过 Web 服务等技术进行的数据交换中占主导地位，这些技术利用 Web 服务器、传输协议（例如 TCP、HTTP）以及标准库和实用程序等原有的基础设施来处理 XML 和 JSON 文档。 此外，各种类型的数据库系统可以存储 XML 和 JSON 文档，甚至旧式关系型系统也可以轻松生成查询结果的 XML 编码。现在，每种通用编程语言都具有支持 XML 和 JSON 的库。那么，是什么让我们回到 Protobuf 之类的**二进制**编码系统呢？

让我们看一下负十进制值 `-128`。以 2 的补码二进制表示形式（在系统和语言中占主导地位）中，此值可以存储在单个 8 位字节中：`10000000`。此整数值在 XML 或 JSON 中的文本编码需要多个字节。例如，UTF-8 编码需要四个字节的字符串，即 `-128`，即每个字符一个字节（十六进制，值为 `0x2d`、`0x31`、`0x32` 和 `0x38`）。XML 和 JSON 还添加了标记字符，例如尖括号和大括号。有关 Protobuf 编码的详细信息下面就会介绍，但现在的关注点是一个通用点：文本编码的压缩性明显低于二进制编码。

### 在 Go 中使用 Protobuf 的示例

我的代码示例着重于 Protobuf 而不是 RPC。以下是第一个示例的概述：

* 名为 `dataitem.proto` 的 IDL 文件定义了一个 Protobuf 消息，它具有六个不同类型的字段：具有不同范围的整数值、固定大小的浮点值以及两个不同长度的字符串。
* Protobuf 编译器使用 IDL 文件生成 Go 版本（以及后面的 Java 版本）的 Protobuf 消息及支持函数。
* Go 应用程序使用随机生成的值填充原生的 Go 数据结构，然后将结果序列化为本地文件。为了进行比较， XML 和 JSON 编码也被序列化为本地文件。
* 作为测试，Go 应用程序通过反序列化 Protobuf 文件的内容来重建其原生数据结构的实例。
* 作为语言中立性测试，Java 应用程序还会对 Protobuf 文件的内容进行反序列化以获取原生数据结构的实例。

[我的网站][6]上提供了该 IDL 文件以及两个 Go 和一个 Java 源文件，打包为 ZIP 文件。

最重要的 Protobuf IDL 文档如下所示。该文档存储在文件 `dataitem.proto` 中，并具有常规的`.proto` 扩展名。

#### 示例 1、Protobuf IDL 文档

```
syntax = "proto3";

package main;

message DataItem {
  int64  oddA  = 1;
  int64  evenA = 2;
  int32  oddB  = 3;
  int32  evenB = 4;
  float  small = 5;
  float  big   = 6;
  string short = 7;
  string long  = 8;
}
```

该 IDL 使用当前的 proto3 而不是较早的 proto2 语法。软件包名称（在本例中为 `main`）是可选的，但是惯例使用它以避免名称冲突。这个结构化的消息包含八个字段，每个字段都有一个 Protobuf 数据类型（例如，`int64`、`string`）、名称（例如，`oddA`、`short`）和一个等号 `=` 之后的数字标签（即键）。标签（在此示例中为 1 到 8）是唯一的整数标识符，用于确定字段序列化的顺序。

Protobuf 消息可以嵌套到任意级别，而一个消息可以是另外一个消息的字段类型。这是一个使用 `DataItem` 消息作为字段类型的示例：

```
message DataItems {
  repeated DataItem item = 1;
}
```

单个 `DataItems` 消息由重复的（零个或多个）`DataItem` 消息组成。

为了清晰起见，Protobuf 还支持枚举类型：

```
enum PartnershipStatus {
  reserved "FREE", "CONSTRAINED", "OTHER";
}
```

`reserved` 限定符确保用于实现这三个符号名的数值不能重复使用。

为了生成一个或多个声明 Protobuf 消息结构的特定于语言的版本，包含这些结构的 IDL 文件被传递到`protoc` 编译器（可在 [Protobuf GitHub 存储库][7]中找到）。对于 Go 代码，可以以通常的方式安装支持的 Protobuf 库（这里以 `％` 作为命令行提示符）：

```
% go get github.com/golang/protobuf/proto
```

将 Protobuf IDL 文件 `dataitem.proto` 编译为 Go 源代码的命令是：

```
% protoc --go_out=. dataitem.proto
```

标志 `--go_out` 指示编译器生成 Go 源代码。其他语言也有类似的标志。在这种情况下，结果是一个名为 `dataitem.pb.go` 的文件，该文件足够小，可以将其基本内容复制到 Go 应用程序中。以下是生成的代码的主要部分：

```
var _ = proto.Marshal

type DataItem struct {
   OddA  int64   `protobuf:"varint,1,opt,name=oddA" json:"oddA,omitempty"`
   EvenA int64   `protobuf:"varint,2,opt,name=evenA" json:"evenA,omitempty"`
   OddB  int32   `protobuf:"varint,3,opt,name=oddB" json:"oddB,omitempty"`
   EvenB int32   `protobuf:"varint,4,opt,name=evenB" json:"evenB,omitempty"`
   Small float32 `protobuf:"fixed32,5,opt,name=small" json:"small,omitempty"`
   Big   float32 `protobuf:"fixed32,6,opt,name=big" json:"big,omitempty"`
   Short string  `protobuf:"bytes,7,opt,name=short" json:"short,omitempty"`
   Long  string  `protobuf:"bytes,8,opt,name=long" json:"long,omitempty"`
}

func (m *DataItem) Reset()         { *m = DataItem{} }
func (m *DataItem) String() string { return proto.CompactTextString(m) }
func (*DataItem) ProtoMessage()    {}
func init() {}
```

编译器生成的代码具有 Go 结构 `DataItem`，该结构导出 Go 字段（名称现已大写开头），该字段与 Protobuf IDL 中声明的名称匹配。该结构字段具有标准的 Go 数据类型：`int32`、`int64`、`float32` 和 `string`。在每个字段行的末尾，是描述 Protobuf 类型的字符串，提供 Protobuf  IDL 文档中的数字标签及有关 JSON 信息的元数据，这将在后面讨论。

此外也有函数；最重要的是 `Proto.Marshal`，用于将 `DataItem` 结构的实例序列化为 Protobuf 格式。辅助函数包括：清除 `DataItem` 结构的 `Reset`，生成 `DataItem` 的单行字符串表示的 `String`。

描述 Protobuf 编码的元数据应在更详细地分析 Go 程序之前进行仔细研究。

### Protobuf 编码

Protobuf 消息的结构为键/值对的集合，其中数字标签为键，相应的字段为值。字段名称（例如，`oddA` 和 `small`）是供人类阅读的，但是 `protoc` 编译器的确使用了字段名称来生成特定于语言的对应名称。例如，Protobuf IDL 中的 `oddA` 和 `small` 名称在 Go 结构中分别成为字段 `OddA` 和 `Small`。

键和它们的值都被编码，但是有一个重要的区别：一些数字值具有固定大小的 32 或 64 位的编码，而其他数字（包括消息标签）则是 `varint` 编码的，位数取决于整数的绝对值。例如，整数值 1 到 15 需要 8 位 `varint` 编码，而值 16 到 2047 需要 16 位。`varint` 编码在本质上与 UTF-8 编码类似（但细节不同），它偏爱较小的整数值而不是较大的整数值。（有关详细分析，请参见 Protobuf [编码指南][8]）结果是，Protobuf 消息应该在字段中具有较小的整数值（如果可能），并且键数应尽可能少，但每个字段至少得有一个键。

下表 1 列出了 Protobuf 编码的要点：

编码 | 示例类型 | 长度
---|---|---
`varint` | `int32`、`uint32`、`int64` | 可变长度
`fixed` | `fixed32`、`float`、`double` | 固定的 32 位或 64 位长度
字节序列 | `string`、`bytes` | 序列长度

*表 1. Protobuf 数据类型*

未明确固定长度的整数类型是 `varint` 编码的；因此，在 `varint` 类型中，例如 `uint32`（`u` 代表无符号），数字 32 描述了整数的范围（在这种情况下为 0 到 2^32 - 1），而不是其位的大小，该位大小取决于值。相比之下，对于固定长度类型（例如 `fixed32` 或 `double`），Protobuf 编码分别需要 32 位和 64 位。Protobuf 中的字符串是字节序列；因此，字段编码的大小就是字节序列的长度。

另一个高效的方法值得一提。回想一下前面的示例，其中的 `DataItems` 消息由重复的 `DataItem` 实例组成：

```
message DataItems {
  repeated DataItem item = 1;
}
```

`repeated` 表示 `DataItem` 实例是*打包的*：集合具有单个标签，在这里是 1。因此，具有重复的 `DataItem` 实例的 `DataItems` 消息比具有多个但单独的 `DataItem` 字段、每个字段都需要自己的标签的消息的效率更高。

了解了这一背景，让我们回到 Go 程序。

### dataItem 程序的细节

`dataItem` 程序创建一个 `DataItem` 实例，并使用适当类型的随机生成的值填充字段。Go 有一个 `rand` 包，带有用于生成伪随机整数和浮点值的函数，而我的 `randString` 函数可以从字符集中生成指定长度的伪随机字符串。设计目标是要有一个具有不同类型和位大小的字段值的 `DataItem` 实例。例如，`OddA` 和 `EvenA` 值分别是 64 位非负整数值的奇数和偶数；但是 `OddB` 和 `EvenB` 变体的大小为 32 位，并存放 0 到 2047 之间的小整数值。随机浮点值的大小为 32 位，字符串为 16（`Short`）和 32（`Long`）字符的长度。这是用随机值填充 `DataItem` 结构的代码段：

```
// 可变长度整数
n1 := rand.Int63()        // 大整数
if (n1 & 1) == 0 { n1++ } // 确保其是奇数
...
n3 := rand.Int31() % UpperBound // 小整数
if (n3 & 1) == 0 { n3++ }       // 确保其是奇数

// 固定长度浮点数
...
t1 := rand.Float32()
t2 := rand.Float32()
...
// 字符串
str1 := randString(StrShort)
str2 := randString(StrLong)

// 消息
dataItem := &DataItem {
   OddA:  n1,
   EvenA: n2,
   OddB:  n3,
   EvenB: n4,
   Big:   f1,
   Small: f2,
   Short: str1,
   Long:  str2,
}
```

创建并填充值后，`DataItem` 实例将以 XML、JSON 和 Protobuf 进行编码，每种编码均写入本地文件：

```
func encodeAndserialize(dataItem *DataItem) {
   bytes, _ := xml.MarshalIndent(dataItem, "", " ")  // Xml to dataitem.xml
   ioutil.WriteFile(XmlFile, bytes, 0644)            // 0644 is file access permissions

   bytes, _ = json.MarshalIndent(dataItem, "", " ")  // Json to dataitem.json
   ioutil.WriteFile(JsonFile, bytes, 0644)

   bytes, _ = proto.Marshal(dataItem)                // Protobuf to dataitem.pbuf
   ioutil.WriteFile(PbufFile, bytes, 0644)
}
```

这三个序列化函数使用术语 `marshal`，它与 `serialize` 意思大致相同。如代码所示，三个 `Marshal` 函数均返回一个字节数组，然后将其写入文件。（为简单起见，忽略可能的错误处理。）在示例运行中，文件大小为：

```
dataitem.xml:  262 bytes
dataitem.json: 212 bytes
dataitem.pbuf:  88 bytes
```

Protobuf 编码明显小于其他两个编码方案。通过消除缩进字符（在这种情况下为空白和换行符），可以稍微减小 XML 和 JSON 序列化的大小。

以下是 `dataitem.json` 文件，该文件最终是由 `json.MarshalIndent` 调用产生的，并添加了以 `##` 开头的注释：

```
{
 "oddA":  4744002665212642479,                ## 64-bit >= 0
 "evenA": 2395006495604861128,                ## ditto
 "oddB":  57,                                 ## 32-bit >= 0 but < 2048
 "evenB": 468,                                ## ditto
 "small": 0.7562016,                          ## 32-bit floating-point
 "big":   0.85202795,                         ## ditto
 "short": "ClH1oDaTtoX$HBN5",                 ## 16 random chars
 "long":  "xId0rD3Cri%3Wt%^QjcFLJgyXBu9^DZI"  ## 32 random chars
}
```

尽管这些序列化的数据写入到本地文件中，但是也可以使用相同的方法将数据写入网络连接的输出流。

### 测试序列化和反序列化

Go 程序接下来通过将先前写入 `dataitem.pbuf` 文件的字节反序列化为 `DataItem` 实例来运行基本测试。这是代码段，其中去除了错误检查部分：

```
filebytes, err := ioutil.ReadFile(PbufFile) // get the bytes from the file
...
testItem.Reset()                            // clear the DataItem structure
err = proto.Unmarshal(filebytes, testItem)  // deserialize into a DataItem instance
```

用于 Protbuf 反序列化的 `proto.Unmarshal` 函数与 `proto.Marshal` 函数相反。原始的 `DataItem` 和反序列化的副本将被打印出来以确认完全匹配：

```
Original:
2041519981506242154 3041486079683013705 1192 1879
0.572123 0.326855
boPb#T0O8Xd&Ps5EnSZqDg4Qztvo7IIs 9vH66AiGSQgCDxk&

Deserialized:
2041519981506242154 3041486079683013705 1192 1879
0.572123 0.326855
boPb#T0O8Xd&Ps5EnSZqDg4Qztvo7IIs 9vH66AiGSQgCDxk&
```

### 一个 Java Protobuf 客户端

用 Java 写的示例是为了确认 Protobuf 的语言中立性。原始 IDL 文件可用于生成 Java 支持代码，其中涉及嵌套类。但是，为了抑制警告信息，可以进行一些补充。这是修订版，它指定了一个 `DataMsg` 作为外部类的名称，内部类在该 Protobuf 消息后面自动命名为 `DataItem`：

```
syntax = "proto3";

package main;

option java_outer_classname = "DataMsg";

message DataItem {
...
```

进行此更改后，`protoc` 编译与以前相同，只是所期望的输出现在是 Java 而不是 Go：

```
% protoc --java_out=. dataitem.proto
```

生成的源文件（在名为 `main` 的子目录中）为 `DataMsg.java`，长度约为 1,120 行：Java 并不简洁。编译然后运行 Java 代码需要具有 Protobuf 库支持的 JAR 文件。该文件位于 [Maven 存储库][9]中。

放置好这些片段后，我的测试代码相对较短（并且在 ZIP 文件中以 `Main.java` 形式提供）：

```
package main;
import java.io.FileInputStream;

public class Main {
   public static void main(String[] args) {
      String path = "dataitem.pbuf";  // from the Go program's serialization
      try {
         DataMsg.DataItem deserial =
           DataMsg.DataItem.newBuilder().mergeFrom(new FileInputStream(path)).build();

         System.out.println(deserial.getOddA()); // 64-bit odd
         System.out.println(deserial.getLong()); // 32-character string
      }
      catch(Exception e) { System.err.println(e); }
    }
}
```

当然，生产级的测试将更加彻底，但是即使是该初步测试也可以证明 Protobuf 的语言中立性：`dataitem.pbuf` 文件是 Go 程序对 Go 语言版的 `DataItem` 进行序列化的结果，并且该文件中的字节被反序列化以产生一个 Java 语言的 `DataItem` 实例。Java 测试的输出与 Go 测试的输出相同。

### 用 numPairs 程序来结束

让我们以一个示例作为结尾，来突出 Protobuf 效率，但又强调在任何编码技术中都会涉及到的成本。考虑以下 Protobuf IDL 文件：

```
syntax = "proto3";
package main;

message NumPairs {
  repeated NumPair pair = 1;
}

message NumPair {
  int32 odd = 1;
  int32 even = 2;
}
```

`NumPair` 消息由两个 `int32` 值以及每个字段的整数标签组成。`NumPairs` 消息是嵌入的 `NumPair` 消息的序列。

Go 语言的 `numPairs` 程序（如下）创建了 200 万个 `NumPair` 实例，每个实例都附加到 `NumPairs` 消息中。该消息可以按常规方式进行序列化和反序列化。

#### 示例 2、numPairs 程序

```
package main

import (
   "math/rand"
   "time"
   "encoding/xml"
   "encoding/json"
   "io/ioutil"
   "github.com/golang/protobuf/proto"
)

// protoc-generated code: start
var _ = proto.Marshal
type NumPairs struct {
   Pair []*NumPair `protobuf:"bytes,1,rep,name=pair" json:"pair,omitempty"`
}

func (m *NumPairs) Reset()         { *m = NumPairs{} }
func (m *NumPairs) String() string { return proto.CompactTextString(m) }
func (*NumPairs) ProtoMessage()    {}
func (m *NumPairs) GetPair() []*NumPair {
   if m != nil { return m.Pair }
   return nil
}

type NumPair struct {
   Odd  int32 `protobuf:"varint,1,opt,name=odd" json:"odd,omitempty"`
   Even int32 `protobuf:"varint,2,opt,name=even" json:"even,omitempty"`
}

func (m *NumPair) Reset()         { *m = NumPair{} }
func (m *NumPair) String() string { return proto.CompactTextString(m) }
func (*NumPair) ProtoMessage()    {}
func init() {}
// protoc-generated code: finish

var numPairsStruct NumPairs
var numPairs = &numPairsStruct

func encodeAndserialize() {
   // XML encoding
   filename := "./pairs.xml"
   bytes, _ := xml.MarshalIndent(numPairs, "", " ")
   ioutil.WriteFile(filename, bytes, 0644)

   // JSON encoding
   filename = "./pairs.json"
   bytes, _ = json.MarshalIndent(numPairs, "", " ")
   ioutil.WriteFile(filename, bytes, 0644)

   // ProtoBuf encoding
   filename = "./pairs.pbuf"
   bytes, _ = proto.Marshal(numPairs)
   ioutil.WriteFile(filename, bytes, 0644)
}

const HowMany = 200 * 100  * 100 // two million

func main() {
   rand.Seed(time.Now().UnixNano())

   // uncomment the modulus operations to get the more efficient version
   for i := 0; i < HowMany; i++ {
      n1 := rand.Int31() // % 2047
      if (n1 & 1) == 0 { n1++ } // ensure it's odd
      n2 := rand.Int31() // % 2047
      if (n2 & 1) == 1 { n2++ } // ensure it's even

      next := &NumPair {
                 Odd:  n1,
                 Even: n2,
              }
      numPairs.Pair = append(numPairs.Pair, next)
   }
   encodeAndserialize()
}
```

每个 `NumPair` 中随机生成的奇数和偶数值的范围在 0 到 20 亿之间变化。就原始数据（而非编码数据）而言，Go 程序中生成的整数总共为 16MB：每个 `NumPair` 为两个整数，总计为 400 万个整数，每个值的大小为四个字节。

为了进行比较，下表列出了 XML、JSON 和 Protobuf 编码的示例 `NumsPairs` 消息的 200 万个 `NumPair` 实例。原始数据也包括在内。由于 `numPairs` 程序生成随机值，因此样本运行的输出有所不同，但接近表中显示的大小。

编码 | 文件 | 字节大小 | Pbuf/其它 比例
---|---|---|---
无 | pairs.raw | 16MB | 169%
Protobuf | pairs.pbuf | 27MB | —
JSON | pairs.json | 100MB | 27%
XML | pairs.xml | 126MB | 21%

*表 2. 16MB 整数的编码开销*

不出所料，Protobuf 和之后的 XML 和 JSON 差别明显。Protobuf 编码大约是 JSON 的四分之一，是 XML 的五分之一。但是原始数据清楚地表明 Protobuf 也会产生编码开销：序列化的 Protobuf 消息比原始数据大 11MB。包括 Protobuf 在内的任何编码都涉及结构化数据，这不可避免地会增加字节。

序列化的 200 万个 `NumPair` 实例中的每个实例都包含**四**个整数值：Go 结构中的 `Even` 和 `Odd` 字段分别一个，而 Protobuf 编码中的每个字段、每个标签一个。对于原始数据（而不是编码数据），每个实例将达到 16 个字节，样本 `NumPairs` 消息中有 200 万个实例。但是 Protobuf 标记（如 `NumPair` 字段中的 `int32` 值）使用 `varint` 编码，因此字节长度有所不同。特别是，小的整数值（在这种情况下，包括标签在内）需要不到四个字节进行编码。

如果对 `numPairs` 程序进行了修改，以使两个 `NumPair` 字段的值小于 2048，且其编码为一或两个字节，则 Protobuf 编码将从 27MB 下降到 16MB，这正是原始数据的大小。下表总结了样本运行中的新编码大小。

编码 | 文件 | 字节大小 | Pbuf/其它 比例
---|---|---|---
None | pairs.raw | 16MB | 100%
Protobuf | pairs.pbuf | 16MB | —
JSON | pairs.json | 77MB | 21%
XML | pairs.xml | 103MB | 15%

*表 3. 编码 16MB 的小于 2048 的整数*

总之，修改后的 `numPairs` 程序的字段值小于 2048，可减少原始数据中每个四字节整数值的大小。但是 Protobuf 编码仍然需要标签，这些标签会在 Protobuf 消息中添加字节。Protobuf 编码确实会增加消息大小，但是如果要编码相对较小的整数值（无论是字段还是键），则可以通过 `varint` 因子来减少此开销。

对于包含混合类型的结构化数据（且整数值相对较小）的中等大小的消息，Protobuf 明显优于 XML 和 JSON 等选项。在其他情况下，数据可能不适合 Protobuf 编码。例如，如果两个应用程序需要共享大量文本记录或大整数值，则可以采用压缩而不是编码技术。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/protobuf-data-interchange

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://developers.google.com/protocol-buffers/
[3]: https://en.wikipedia.org/wiki/DCE/RPC
[4]: https://en.wikipedia.org/wiki/Interface_description_language
[5]: https://grpc.io/
[6]: http://condor.depaul.edu/mkalin
[7]: https://github.com/protocolbuffers/protobuf
[8]: https://developers.google.com/protocol-buffers/docs/encoding
[9]: https://mvnrepository.com/artifact/com.google.protobuf/protobuf-java
