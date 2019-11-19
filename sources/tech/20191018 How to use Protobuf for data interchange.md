[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Protobuf for data interchange)
[#]: via: (https://opensource.com/article/19/10/protobuf-data-interchange)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

How to use Protobuf for data interchange
======
Protobuf encoding increases efficiency when exchanging data between
applications written in different languages and running on different
platforms.
![metrics and data shown on a computer screen][1]

Protocol buffers ([Protobufs][2]), like XML and JSON, allow applications, which may be written in different languages and running on different platforms, to exchange data. For example, a sending application written in Go could encode a Go-specific sales order in Protobuf, which a receiver written in Java then could decode to get a Java-specific representation of the received order. Here is a sketch of the architecture over a network connection:


```
`Go sales order--->Pbuf-encode--->network--->Pbuf-decode--->Java sales order`
```

Protobuf encoding, in contrast to its XML and JSON counterparts, is binary rather than text, which can complicate debugging. However, as the code examples in this article confirm, the Protobuf encoding is significantly more efficient in size than either XML or JSON encoding.

Protobuf is efficient in another way. At the implementation level, Protobuf and other encoding systems serialize and deserialize structured data. Serialization transforms a language-specific data structure into a bytestream, and deserialization is the inverse operation that transforms a bytestream back into a language-specific data structure. Serialization and deserialization may become the bottleneck in data interchange because these operations are CPU-intensive. Efficient serialization and deserialization is another Protobuf design goal.

Recent encoding technologies, such as Protobuf and FlatBuffers, derive from the [DCE/RPC][3] (Distributed Computing Environment/Remote Procedure Call) initiative of the early 1990s. Like DCE/RPC, Protobuf contributes to both the [IDL][4] (interface definition language) and the encoding layer in data interchange.

This article will look at these two layers then provide code examples in Go and Java to flesh out Protobuf details and show that Protobuf is easy to use.

### Protobuf as an IDL and encoding layer

DCE/RPC, like Protobuf, is designed to be language- and platform-neutral. The appropriate libraries and utilities allow any language and platform to play in the DCE/RPC arena. Furthermore, the DCE/RPC architecture is elegant. An IDL document is the contract between the remote procedure on the one side and callers on the other side. Protobuf, too, centers on an IDL document.

An IDL document is text and, in DCE/RPC, uses basic C syntax along with syntactic extensions for metadata (square brackets) and a few new keywords such as **interface**. Here is an example:


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

This IDL document declares a procedure named **echo**, which takes three arguments: the **[in]** arguments of type **handle_t** (implementation pointer) and **idl_char** (array of ASCII characters) are passed to the remote procedure, whereas the **[out]** argument (also a string) is passed back from the procedure. In this example, the **echo** procedure does not explicitly return a value (the **void** to the left of **echo**) but could do so. A return value, together with one or more **[out]** arguments, allows the remote procedure to return arbitrarily many values. The next section introduces a Protobuf IDL, which differs in syntax but likewise serves as a contract in data interchange.

The IDL document, in both DCE/RPC and Protobuf, is the input to utilities that create the infrastructure code for exchanging data:


```
`IDL document--->DCE/PRC or Protobuf utilities--->support code for data interchange`
```

As relatively straightforward text, the IDL is likewise human-readable documentation about the specifics of the data interchange—in particular, the number of data items exchanged and the data type of each item.

Protobuf can used in a modern RPC system such as [gRPC][5]; but Protobuf on its own provides only the IDL layer and the encoding layer for messages passed from a sender to a receiver. Protobuf encoding, like the DCE/RPC original, is binary but more efficient.

At present, XML and JSON encodings still dominate in data interchange through technologies such as web services, which make use of in-place infrastructure such as web servers, transport protocols (e.g., TCP, HTTP), and standard libraries and utilities for processing XML and JSON documents. Moreover, database systems of various flavors can store XML and JSON documents, and even legacy relational systems readily generate XML encodings of query results. Every general-purpose programming language now has libraries that support XML and JSON. What, then, recommends a return to a _binary_ encoding system such as Protobuf?

Consider the negative decimal value **-128**. In the 2's complement binary representation, which dominates across systems and languages, this value can be stored in a single 8-bit byte: 10000000. The text encoding of this integer value in XML or JSON requires multiple bytes. For example, UTF-8 encoding requires four bytes for the string, literally **-128**, which is one byte per character (in hex, the values are 0x2d, 0x31, 0x32, and 0x38). XML and JSON also add markup characters, such as angle brackets and braces, to the mix. Details about Protobuf encoding are forthcoming, but the point of interest now is a general one: Text encodings tend to be significantly less compact than binary ones.

### A code example in Go using Protobuf

My code examples focus on Protobuf rather than RPC. Here is an overview of the first example:

  * The IDL file named _dataitem.proto_ defines a Protobuf **message** with six fields of different types: integer values with different ranges, floating-point values of a fixed size, and strings of two different lengths.
  * The Protobuf compiler uses the IDL file to generate a Go-specific version (and, later, a Java-specific version) of the Protobuf **message** together with supporting functions.
  * A Go app populates the native Go data structure with randomly generated values and then serializes the result to a local file. For comparison, XML and JSON encodings also are serialized to local files.
  * As a test, the Go application reconstructs an instance of its native data structure by deserializing the contents of the Protobuf file.
  * As a language-neutrality test, the Java application also deserializes the contents of the Protobuf file to get an instance of a native data structure.



This IDL file and two Go and one Java source files are available as a ZIP file on [my website][6].

The all-important Protobuf IDL document is shown below. The document is stored in the file _dataitem.proto_, with the customary _.proto_ extension.

#### Example 1. Protobuf IDL document


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

The IDL uses the current proto3 rather than the earlier proto2 syntax. The package name (in this case, **main**) is optional but customary; it is used to avoid name conflicts. The structured **message** contains eight fields, each of which has a Protobuf data type (e.g., **int64**, **string**), a name (e.g., **oddA**, **short**), and a numeric tag (aka key) after the equals sign **=**. The tags, which are 1 through 8 in this example, are unique integer identifiers that determine the order in which the fields are serialized.

Protobuf messages can be nested to arbitrary levels, and one message can be the field type in the other. Here's an example that uses the **DataItem** message as a field type:


```
message DataItems {
  repeated DataItem item = 1;
}
```

A single **DataItems** message consists of repeated (none or more) **DataItem** messages.

Protobuf also supports enumerated types for clarity:


```
enum PartnershipStatus {
  reserved "FREE", "CONSTRAINED", "OTHER";
}
```

The **reserved** qualifier ensures that the numeric values used to implement the three symbolic names cannot be reused.

To generate a language-specific version of one or more declared Protobuf **message** structures, the IDL file containing these is passed to the _protoc_ compiler (available in the [Protobuf GitHub repository][7]). For the Go code, the supporting Protobuf library can be installed in the usual way (with **%** as the command-line prompt):


```
`% go get github.com/golang/protobuf/proto`
```

The command to compile the Protobuf IDL file _dataitem.proto_ into Go source code is:


```
`% protoc --go_out=. dataitem.proto`
```

The flag **\--go_out** directs the compiler to generate Go source code; there are similar flags for other languages. The result, in this case, is a file named _dataitem.pb.go_, which is small enough that the essentials can be copied into a Go application. Here are the essentials from the generated code:


```
var _ = proto.Marshal

type DataItem struct {
   OddA  int64   `protobuf:"varint,1,opt,name=oddA" json:"oddA,omitempty"`
   EvenA int64   `protobuf:"varint,2,opt,name=evenA" json:"evenA,omitempty"`
   OddB  int32   `protobuf:"varint,3,opt,name=oddB" json:"oddB,omitempty"`
   EvenB int32   `protobuf:"varint,4,opt,name=evenB" json:"evenB,omitempty"`
   Small float32 `protobuf:"fixed32,5,opt,name=small" json:"small,omitempty"`
   Big   float32 `protobuf:"fixed32,6,opt,name=big" json:"big,omitempty"`
   Short string  `protobuf:"bytes,7,opt,name=short" json:"short,omitempty"`
   Long  string  `protobuf:"bytes,8,opt,name=long" json:"long,omitempty"`
}

func (m *DataItem) Reset()         { *m = DataItem{} }
func (m *DataItem) String() string { return proto.CompactTextString(m) }
func (*DataItem) ProtoMessage()    {}
func init() {}
```

The compiler-generated code has a Go structure **DataItem**, which exports the Go fields—the names are now capitalized—that match the names declared in the Protobuf IDL. The structure fields have standard Go data types: **int32**, **int64**, **float32**, and **string**. At the end of each field line, as a string, is metadata that describes the Protobuf types, gives the numeric tags from the Protobuf IDL document, and provides information about JSON, which is discussed later.

There are also functions; the most important is **proto.Marshal** for serializing an instance of the **DataItem** structure into Protobuf format. The helper functions include **Reset**, which clears a **DataItem** structure, and **String**, which produces a one-line string representation of a **DataItem**.

The metadata that describes Protobuf encoding deserves a closer look before analyzing the Go program in more detail.

### Protobuf encoding

A Protobuf message is structured as a collection of key/value pairs, with the numeric tag as the key and the corresponding field as the value. The field names, such as **oddA** and **small**, are for human readability, but the _protoc_ compiler does use the field names in generating language-specific counterparts. For example, the **oddA** and **small** names in the Protobuf IDL become the fields **OddA** and **Small**, respectively, in the Go structure.

The keys and their values both get encoded, but with an important difference: some numeric values have a fixed-size encoding of 32 or 64 bits, whereas others (including the **message** tags) are _varint_ encoded—the number of bits depends on the integer's absolute value. For example, the integer values 1 through 15 require 8 bits to encode in _varint_, whereas the values 16 through 2047 require 16 bits. The _varint_ encoding, similar in spirit (but not in detail) to UTF-8 encoding, favors small integer values over large ones. (For a detailed analysis, see the Protobuf [encoding guide][8].) The upshot is that a Protobuf **message** should have small integer values in fields, if possible, and as few keys as possible, but one key per field is unavoidable.

Table 1 below gives the gist of Protobuf encoding:

**Table 1. Protobuf data types**

Encoding | Sample types | Length
---|---|---
varint | int32, uint32, int64 | Variable length
fixed | fixed32, float, double | Fixed 32-bit or 64-bit length
byte sequence | string, bytes | Sequence length

Integer types that are not explicitly **fixed** are _varint_ encoded; hence, in a _varint_ type such as **uint32** (**u** for unsigned), the number 32 describes the integer's range (in this case, 0 to 232 \- 1) rather than its bit size, which differs depending on the value. For fixed types such as **fixed32** or **double**, by contrast, the Protobuf encoding requires 32 and 64 bits, respectively. Strings in Protobuf are byte sequences; hence, the size of the field encoding is the length of the byte sequence.

Another efficiency deserves mention. Recall the earlier example in which a **DataItems** message consists of repeated **DataItem** instances:


```
message DataItems {
  repeated DataItem item = 1;
}
```

The **repeated** means that the **DataItem** instances are _packed_: the collection has a single tag, in this case, 1. A **DataItems** message with repeated **DataItem** instances is thus more efficient than a message with multiple but separate **DataItem** fields, each of which would require a tag of its own.

With this background in mind, let's return to the Go program.

### The dataItem program in detail

The _dataItem_ program creates a **DataItem** instance and populates the fields with randomly generated values of the appropriate types. Go has a **rand** package with functions for generating pseudo-random integer and floating-point values, and my **randString** function generates pseudo-random strings of specified lengths from a character set. The design goal is to have a **DataItem** instance with field values of different types and bit sizes. For example, the **OddA** and **EvenA** values are 64-bit non-negative integer values of odd and even parity, respectively; but the **OddB** and **EvenB** variants are 32 bits in size and hold small integer values between 0 and 2047. The random floating-point values are 32 bits in size, and the strings are 16 (**Short**) and 32 (**Long**) characters in length. Here is the code segment that populates the **DataItem** structure with random values:


```
// variable-length integers
n1 := rand.Int63()        // bigger integer
if (n1 &amp; 1) == 0 { n1++ } // ensure it's odd
...
n3 := rand.Int31() % UpperBound // smaller integer
if (n3 &amp; 1) == 0 { n3++ }       // ensure it's odd

// fixed-length floats
...
t1 := rand.Float32()
t2 := rand.Float32()
...
// strings
str1 := randString(StrShort)
str2 := randString(StrLong)

// the message
dataItem := &amp;DataItem {
   OddA:  n1,
   EvenA: n2,
   OddB:  n3,
   EvenB: n4,
   Big:   f1,
   Small: f2,
   Short: str1,
   Long:  str2,
}
```

Once created and populated with values, the **DataItem** instance is encoded in XML, JSON, and Protobuf, with each encoding written to a local file:


```
func encodeAndserialize(dataItem *DataItem) {
   bytes, _ := xml.MarshalIndent(dataItem, "", " ")  // Xml to dataitem.xml
   ioutil.WriteFile(XmlFile, bytes, 0644)            // 0644 is file access permissions

   bytes, _ = json.MarshalIndent(dataItem, "", " ")  // Json to dataitem.json
   ioutil.WriteFile(JsonFile, bytes, 0644)

   bytes, _ = proto.Marshal(dataItem)                // Protobuf to dataitem.pbuf
   ioutil.WriteFile(PbufFile, bytes, 0644)
}
```

The three serializing functions use the term _marshal_, which is roughly synonymous with _serialize_. As the code indicates, each of the three **Marshal** functions returns an array of bytes, which then are written to a file. (Possible errors are ignored for simplicity.) On a sample run, the file sizes were:


```
dataitem.xml:  262 bytes
dataitem.json: 212 bytes
dataitem.pbuf:  88 bytes
```

The Protobuf encoding is significantly smaller than the other two. The XML and JSON serializations could be reduced slightly in size by eliminating indentation characters, in this case, blanks and newlines.

Below is the _dataitem.json_ file resulting eventually from the **json.MarshalIndent** call, with added comments starting with **##**:


```
{
 "oddA":  4744002665212642479,                ## 64-bit &gt;= 0
 "evenA": 2395006495604861128,                ## ditto
 "oddB":  57,                                 ## 32-bit &gt;= 0 but &lt; 2048
 "evenB": 468,                                ## ditto
 "small": 0.7562016,                          ## 32-bit floating-point
 "big":   0.85202795,                         ## ditto
 "short": "ClH1oDaTtoX$HBN5",                 ## 16 random chars
 "long":  "xId0rD3Cri%3Wt%^QjcFLJgyXBu9^DZI"  ## 32 random chars
}
```

Although the serialized data goes into local files, the same approach would be used to write the data to the output stream of a network connection.

### Testing serialization/deserialization

The Go program next runs an elementary test by deserializing the bytes, which were written earlier to the _dataitem.pbuf_ file, into a **DataItem** instance. Here is the code segment, with the error-checking parts removed:


```
filebytes, err := ioutil.ReadFile(PbufFile) // get the bytes from the file
...
testItem.Reset()                            // clear the DataItem structure
err = proto.Unmarshal(filebytes, testItem)  // deserialize into a DataItem instance
```

The **proto.Unmarshal** function for deserializing Protbuf is the inverse of the **proto.Marshal** function. The original **DataItem** and the deserialized clone are printed to confirm an exact match:


```
Original:
2041519981506242154 3041486079683013705 1192 1879
0.572123 0.326855
boPb#T0O8Xd&amp;Ps5EnSZqDg4Qztvo7IIs 9vH66AiGSQgCDxk&amp;

Deserialized:
2041519981506242154 3041486079683013705 1192 1879
0.572123 0.326855
boPb#T0O8Xd&amp;Ps5EnSZqDg4Qztvo7IIs 9vH66AiGSQgCDxk&amp;
```

### A Protobuf client in Java

The example in Java is to confirm Protobuf's language neutrality. The original IDL file could be used to generate the Java support code, which involves nested classes. To suppress warnings, however, a slight addition can be made. Here is the revision, which specifies a **DataMsg** as the name for the outer class, with the inner class automatically named **DataItem** after the Protobuf message:


```
syntax = "proto3";

package main;

option java_outer_classname = "DataMsg";

message DataItem {
...
```

With this change in place, the _protoc_ compilation is the same as before, except the desired output is now Java rather than Go:


```
`% protoc --java_out=. dataitem.proto`
```

The resulting source file (in a subdirectory named _main_) is _DataMsg.java_ and about 1,120 lines in length: Java is not terse. Compiling and then running the Java code requires a JAR file with the library support for Protobuf. This file is available in the [Maven repository][9].

With the pieces in place, my test code is relatively short (and available in the ZIP file as _Main.java_):


```
package main;
import java.io.FileInputStream;

public class Main {
   public static void main(String[] args) {
      String path = "dataitem.pbuf";  // from the Go program's serialization
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

Production-grade testing would be far more thorough, of course, but even this preliminary test confirms the language-neutrality of Protobuf: the _dataitem.pbuf_ file results from the Go program's serialization of a Go **DataItem**, and the bytes in this file are deserialized to produce a **DataItem** instance in Java. The output from the Java test is the same as that from the Go test.

### Wrapping up with the numPairs program

Let's end with an example that highlights Protobuf efficiency but also underscores the cost involved in any encoding technology. Consider this Protobuf IDL file:


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

A **NumPair** message consists of two **int32** values together with an integer tag for each field. A **NumPairs** message is a sequence of embedded **NumPair** messages.

The _numPairs_ program in Go (below) creates 2 million **NumPair** instances, with each appended to the **NumPairs** message. This message can be serialized and deserialized in the usual way.

#### Example 2. The numPairs program


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

func (m *NumPairs) Reset()         { *m = NumPairs{} }
func (m *NumPairs) String() string { return proto.CompactTextString(m) }
func (*NumPairs) ProtoMessage()    {}
func (m *NumPairs) GetPair() []*NumPair {
   if m != nil { return m.Pair }
   return nil
}

type NumPair struct {
   Odd  int32 `protobuf:"varint,1,opt,name=odd" json:"odd,omitempty"`
   Even int32 `protobuf:"varint,2,opt,name=even" json:"even,omitempty"`
}

func (m *NumPair) Reset()         { *m = NumPair{} }
func (m *NumPair) String() string { return proto.CompactTextString(m) }
func (*NumPair) ProtoMessage()    {}
func init() {}
// protoc-generated code: finish

var numPairsStruct NumPairs
var numPairs = &amp;numPairsStruct

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

const HowMany = 200 * 100  * 100 // two million

func main() {
   rand.Seed(time.Now().UnixNano())

   // uncomment the modulus operations to get the more efficient version
   for i := 0; i &lt; HowMany; i++ {
      n1 := rand.Int31() // % 2047
      if (n1 &amp; 1) == 0 { n1++ } // ensure it's odd
      n2 := rand.Int31() // % 2047
      if (n2 &amp; 1) == 1 { n2++ } // ensure it's even

      next := &amp;NumPair {
                 Odd:  n1,
                 Even: n2,
              }
      numPairs.Pair = append(numPairs.Pair, next)
   }
   encodeAndserialize()
}
```

The randomly generated odd and even values in each **NumPair** range from zero to 2 billion and change. In terms of raw rather than encoded data, the integers generated in the Go program add up to 16MB: two integers per **NumPair** for a total of 4 million integers in all, and each value is four bytes in size.

For comparison, the table below has entries for the XML, JSON, and Protobuf encodings of the 2 million **NumPair** instances in the sample **NumsPairs** message. The raw data is included, as well. Because the _numPairs_ program generates random values, output differs across sample runs but is close to the sizes shown in the table.

**Table 2. Encoding overhead for 16MB of integers**

Encoding | File | Byte size | Pbuf/other ratio
---|---|---|---
None | pairs.raw | 16MB | 169%
Protobuf | pairs.pbuf | 27MB | —
JSON | pairs.json | 100MB | 27%
XML | pairs.xml | 126MB | 21%

As expected, Protobuf shines next to XML and JSON. The Protobuf encoding is about a quarter of the JSON one and about a fifth of the XML one. But the raw data make clear that Protobuf incurs the overhead of encoding: the serialized Protobuf message is 11MB larger than the raw data. Any encoding, including Protobuf, involves structuring the data, which unavoidably adds bytes.

Each of the serialized 2 million **NumPair** instances involves _four_ integer values: one apiece for the **Even** and **Odd** fields in the Go structure, and one tag per each field in the Protobuf encoding. As raw rather than encoded data, this would come to 16 bytes per instance, and there are 2 million instances in the sample **NumPairs** message. But the Protobuf tags, like the **int32** values in the **NumPair** fields, use _varint_ encoding and, therefore, vary in byte length; in particular, small integer values (which include the tags, in this case) require fewer than four bytes to encode.

If the _numPairs_ program is revised so that the two **NumPair** fields hold values less than 2048, which have encodings of either one or two bytes, then the Protobuf encoding drops from 27MB to 16MB—the very size of the raw data. The table below summarizes the new encoding sizes from a sample run.

**Table 3. Encoding with 16MB of integers &lt; 2048**

Encoding | File | Byte size | Pbuf/other ratio
---|---|---|---
None | pairs.raw | 16MB | 100%
Protobuf | pairs.pbuf | 16MB | —
JSON | pairs.json | 77MB | 21%
XML | pairs.xml | 103MB | 15%

In summary, the modified _numPairs_ program, with field values less than 2048, reduces the four-byte size for each integer value in the raw data. But the Protobuf encoding still requires tags, which add bytes to the Protobuf message. Protobuf encoding does have a cost in message size, but this cost can be reduced by the _varint_ factor if relatively small integer values, whether in fields or keys, are being encoded.

For moderately sized messages consisting of structured data with mixed types—and relatively small integer values—Protobuf has a clear advantage over options such as XML and JSON. In other cases, the data may not be suited for Protobuf encoding. For example, if two applications need to share a huge set of text records or large integer values, then compression rather than encoding technology may be the way to go.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/protobuf-data-interchange

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
