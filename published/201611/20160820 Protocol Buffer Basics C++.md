C++ 程序员 Protocol Buffers 基础指南
============================

这篇教程提供了一个面向 C++ 程序员关于 protocol buffers 的基础介绍。通过创建一个简单的示例应用程序，它将向我们展示：

* 在 `.proto` 文件中定义消息格式
* 使用 protocol buffer 编译器
* 使用 C++ protocol buffer API 读写消息

这不是一个关于在 C++ 中使用 protocol buffers 的全面指南。要获取更详细的信息，请参考 [Protocol Buffer Language Guide][1] 和 [Encoding Reference][2]。

### 为什么使用 Protocol Buffers

我们接下来要使用的例子是一个非常简单的"地址簿"应用程序，它能从文件中读取联系人详细信息。地址簿中的每一个人都有一个名字、ID、邮件地址和联系电话。

如何序列化和获取结构化的数据？这里有几种解决方案：

* 以二进制形式发送/接收原生的内存数据结构。通常，这是一种脆弱的方法，因为接收/读取代码必须基于完全相同的内存布局、大小端等环境进行编译。同时，当文件增加时，原始格式数据会随着与该格式相关的软件而迅速扩散，这将导致很难扩展文件格式。
* 你可以创造一种 ad-hoc 方法，将数据项编码为一个字符串——比如将 4 个整数编码为 `12:3:-23:67`。虽然它需要编写一次性的编码和解码代码且解码需要耗费一点运行时成本，但这是一种简单灵活的方法。这最适合编码非常简单的数据。
* 序列化数据为 XML。这种方法是非常吸引人的，因为 XML 是一种适合人阅读的格式，并且有为许多语言开发的库。如果你想与其他程序和项目共享数据，这可能是一种不错的选择。然而，众所周知，XML 是空间密集型的，且在编码和解码时，它对程序会造成巨大的性能损失。同时，使用 XML DOM 树被认为比操作一个类的简单字段更加复杂。

Protocol buffers 是针对这个问题的一种灵活、高效、自动化的解决方案。使用 Protocol buffers，你需要写一个 `.proto` 说明，用于描述你所希望存储的数据结构。利用 `.proto` 文件，protocol buffer 编译器可以创建一个类，用于实现对高效的二进制格式的 protocol buffer 数据的自动化编码和解码。产生的类提供了构造 protocol buffer 的字段的 getters 和 setters，并且作为一个单元来处理读写 protocol buffer 的细节。重要的是，protocol buffer 格式支持格式的扩展，代码仍然可以读取以旧格式编码的数据。

### 在哪可以找到示例代码

示例代码被包含于源代码包，位于“examples”文件夹。可在[这里][4]下载代码。

### 定义你的协议格式

为了创建自己的地址簿应用程序，你需要从 `.proto` 开始。`.proto` 文件中的定义很简单：为你所需要序列化的每个数据结构添加一个消息（message），然后为消息中的每一个字段指定一个名字和类型。这里是定义你消息的 `.proto` 文件 `addressbook.proto`。

```
package tutorial;

message Person {
  required string name = 1;
  required int32 id = 2;
  optional string email = 3;

  enum PhoneType {
    MOBILE = 0;
    HOME = 1;
    WORK = 2;
  }

  message PhoneNumber {
    required string number = 1;
    optional PhoneType type = 2 [default = HOME];
  }

  repeated PhoneNumber phone = 4;
}

message AddressBook {
  repeated Person person = 1;
}
```

如你所见，其语法类似于 C++ 或 Java。我们开始看看文件的每一部分内容做了什么。

`.proto` 文件以一个 package 声明开始，这可以避免不同项目的命名冲突。在 C++，你生成的类会被置于与 package 名字一样的命名空间。

下一步，你需要定义消息（message）。消息只是一个包含一系列类型字段的集合。大多标准的简单数据类型是可以作为字段类型的，包括 `bool`、`int32`、`float`、`double` 和 `string`。你也可以通过使用其他消息类型作为字段类型，将更多的数据结构添加到你的消息中——在以上的示例，`Person` 消息包含了 `PhoneNumber` 消息，同时 `AddressBook` 消息包含 `Person` 消息。你甚至可以定义嵌套在其他消息内的消息类型——如你所见，`PhoneNumber` 类型定义于 `Person` 内部。如果你想要其中某一个字段的值是预定义值列表中的某个值，你也可以定义 `enum` 类型——这儿你可以指定一个电话号码是 `MOBILE`、`HOME` 或 `WORK` 中的某一个。

每一个元素上的 `= 1`、`= 2` 标记确定了用于二进制编码的唯一“标签”（tag）。标签数字 1-15 的编码比更大的数字少需要一个字节，因此作为一种优化，你可以将这些标签用于经常使用的元素或 repeated 元素，剩下 16 以及更高的标签用于非经常使用的元素或 `optional` 元素。每一个 `repeated` 字段的元素需要重新编码标签数字，因此 `repeated` 字段适合于使用这种优化手段。

每一个字段必须使用下面的修饰符加以标注：

* `required`：必须提供该字段的值，否则消息会被认为是 “未初始化的”（uninitialized）。如果 `libprotobuf` 以调试模式编译，序列化未初始化的消息将引起一个断言失败。以优化形式构建，将会跳过检查，并且无论如何都会写入该消息。然而，解析未初始化的消息总是会失败（通过 parse 方法返回 `false`）。除此之外，一个 `required` 字段的表现与 `optional` 字段完全一样。
* `optional`：字段可能会被设置，也可能不会。如果一个 `optional` 字段没被设置，它将使用默认值。对于简单类型，你可以指定你自己的默认值，正如例子中我们对电话号码的 `type` 一样，否则使用系统默认值：数字类型为 0、字符串为空字符串、布尔值为 false。对于嵌套消息，默认值总为消息的“默认实例”或“原型”，它的所有字段都没被设置。调用 accessor 来获取一个没有显式设置的 `optional`（或 `required`） 字段的值总是返回字段的默认值。
* `repeated`：字段可以重复任意次数（包括 0 次）。`repeated` 值的顺序会被保存于 protocol buffer。可以将 repeated 字段想象为动态大小的数组。

你可以查找关于编写 `.proto` 文件的完整指导——包括所有可能的字段类型——在 [Protocol Buffer Language Guide][6] 里面。不要在这里面查找与类继承相似的特性，因为 protocol buffers 不会做这些。

> **`required` 是永久性的**

>在把一个字段标识为 `required` 的时候，你应该特别小心。如果在某些情况下你不想写入或者发送一个 `required` 的字段，那么将该字段更改为 `optional` 可能会遇到问题——旧版本的读者（LCTT 译注：即读取、解析旧版本 Protocol Buffer 消息的一方）会认为不含该字段的消息是不完整的，从而有可能会拒绝解析。在这种情况下，你应该考虑编写特别针对于应用程序的、自定义的消息校验函数。Google 的一些工程师得出了一个结论：使用 `required` 弊多于利；他们更愿意使用 `optional` 和 `repeated` 而不是 `required`。当然，这个观点并不具有普遍性。

### 编译你的 Protocol Buffers

既然你有了一个 `.proto`，那你需要做的下一件事就是生成一个将用于读写 `AddressBook` 消息的类（从而包括 `Person` 和 `PhoneNumber`）。为了做到这样，你需要在你的 `.proto` 上运行 protocol buffer 编译器 `protoc`：

1. 如果你没有安装编译器，请[下载这个包][4]，并按照 README 中的指令进行安装。
2. 现在运行编译器，指定源目录（你的应用程序源代码位于哪里——如果你没有提供任何值，将使用当前目录）、目标目录（你想要生成的代码放在哪里；常与 `$SRC_DIR` 相同），以及你的 `.proto` 路径。在此示例中：

```
protoc -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/addressbook.proto
```

因为你想要 C++ 的类，所以你使用了 `--cpp_out` 选项——也为其他支持的语言提供了类似选项。

在你指定的目标文件夹，将生成以下的文件：

* `addressbook.pb.h`，声明你生成类的头文件。
* `addressbook.pb.cc`，包含你的类的实现。

### Protocol Buffer API

让我们看看生成的一些代码，了解一下编译器为你创建了什么类和函数。如果你查看 `addressbook.pb.h`，你可以看到有一个在 `addressbook.proto` 中指定所有消息的类。关注 `Person` 类，可以看到编译器为每个字段生成了读写函数（accessors）。例如，对于 `name`、`id`、`email` 和 `phone` 字段，有下面这些方法：（LCTT 译注：此处原文所指文件名有误，径该之。）

```c++
// name
inline bool has_name() const;
inline void clear_name();
inline const ::std::string& name() const;
inline void set_name(const ::std::string& value);
inline void set_name(const char* value);
inline ::std::string* mutable_name();

// id
inline bool has_id() const;
inline void clear_id();
inline int32_t id() const;
inline void set_id(int32_t value);

// email
inline bool has_email() const;
inline void clear_email();
inline const ::std::string& email() const;
inline void set_email(const ::std::string& value);
inline void set_email(const char* value);
inline ::std::string* mutable_email();

// phone
inline int phone_size() const;
inline void clear_phone();
inline const ::google::protobuf::RepeatedPtrField< ::tutorial::Person_PhoneNumber >& phone() const;
inline ::google::protobuf::RepeatedPtrField< ::tutorial::Person_PhoneNumber >* mutable_phone();
inline const ::tutorial::Person_PhoneNumber& phone(int index) const;
inline ::tutorial::Person_PhoneNumber* mutable_phone(int index);
inline ::tutorial::Person_PhoneNumber* add_phone();
```

正如你所见到，getters 的名字与字段的小写名字完全一样，并且 setter 方法以 set_ 开头。同时每个单一（singular）（`required` 或 `optional`）字段都有 `has_` 方法，该方法在字段被设置了值的情况下返回 true。最后，所有字段都有一个 `clear_` 方法，用以清除字段到空（empty）状态。

数字型的 `id` 字段仅有上述的基本读写函数集合（accessors），而 `name` 和 `email` 字段有两个额外的方法，因为它们是字符串——一个是可以获得字符串直接指针的`mutable_` 的 getter ，另一个为额外的 setter。注意，尽管 `email` 还没被设置（set），你也可以调用 `mutable_email`；因为 `email` 会被自动地初始化为空字符串。在本例中，如果你有一个单一的（`required` 或 `optional`）消息字段，它会有一个 `mutable_` 方法，而没有 `set_` 方法。

`repeated` 字段也有一些特殊的方法——如果你看看 `repeated` 的 `phone` 字段的方法，你可以看到：

* 检查 `repeated` 字段的 `_size`（也就是说，与 `Person` 相关的电话号码的个数）
* 使用下标取得特定的电话号码
* 更新特定下标的电话号码
* 添加新的电话号码到消息中，之后你便可以编辑。（`repeated` 标量类型有一个 `add_` 方法，用于传入新的值）

为了获取 protocol 编译器为所有字段定义生成的方法的信息，可以查看 [C++ generated code reference][5]。

#### 枚举和嵌套类

与 `.proto` 的枚举相对应，生成的代码包含了一个 `PhoneType` 枚举。你可以通过 `Person::PhoneType` 引用这个类型，通过 `Person::MOBILE`、`Person::HOME` 和 `Person::WORK` 引用它的值。（实现细节有点复杂，但是你无须了解它们而可以直接使用）

编译器也生成了一个 `Person::PhoneNumber` 的嵌套类。如果你查看代码，你可以发现真正的类型为 `Person_PhoneNumber`，但它通过在 `Person` 内部使用 `typedef` 定义，使你可以把 `Person_PhoneNumber` 当成嵌套类。唯一产生影响的一个例子是，如果你想要在其他文件前置声明该类——在 C++ 中你不能前置声明嵌套类，但是你可以前置声明 `Person_PhoneNumber`。

#### 标准的消息方法

所有的消息方法都包含了许多别的方法，用于检查和操作整个消息，包括：

* `bool IsInitialized() const;` ：检查是否所有 `required` 字段已经被设置。
* `string DebugString() const;` ：返回人类可读的消息表示，对调试特别有用。
* `void CopyFrom(const Person& from);`：使用给定的值重写消息。
* `void Clear();`：清除所有元素为空（empty）的状态。

上面这些方法以及下一节要讲的 I/O 方法实现了被所有 C++ protocol buffer 类共享的消息（Message）接口。为了获取更多信息，请查看 [complete API documentation for Message][7]。

#### 解析和序列化

最后，所有 protocol buffer 类都有读写你选定类型消息的方法，这些方法使用了特定的 protocol buffer [二进制格式][8]。这些方法包括：

* `bool SerializeToString(string* output) const;`：序列化消息并将消息字节数据存储在给定的字符串中。注意，字节数据是二进制格式的，而不是文本格式；我们只使用 `string` 类作为合适的容器。
* `bool ParseFromString(const string& data);`：从给定的字符创解析消息。
* `bool SerializeToOstream(ostream* output) const;`：将消息写到给定的 C++ `ostream`。
* `bool ParseFromIstream(istream* input);`：从给定的 C++ `istream` 解析消息。

这些只是两个用于解析和序列化的选择。再次说明，可以查看 `Message API reference` 完整的列表。

> **Protocol Buffers 和面向对象设计**

> Protocol buffer 类通常只是纯粹的数据存储器（像 C++ 中的结构体）；它们在对象模型中并不是一等公民。如果你想向生成的 protocol buffer 类中添加更丰富的行为，最好的方法就是在应用程序中对它进行封装。如果你无权控制 `.proto` 文件的设计的话，封装 protocol buffers 也是一个好主意（例如，你从另一个项目中重用一个 `.proto` 文件）。在那种情况下，你可以用封装类来设计接口，以更好地适应你的应用程序的特定环境：隐藏一些数据和方法，暴露一些便于使用的函数，等等。**但是你绝对不要通过继承生成的类来添加行为。**这样做的话，会破坏其内部机制，并且不是一个好的面向对象的实践。

### 写消息

现在我们尝试使用 protocol buffer 类。你的地址簿程序想要做的第一件事是将个人详细信息写入到地址簿文件。为了做到这一点，你需要创建、填充 protocol buffer 类实例，并且将它们写入到一个输出流（output stream）。

这里的程序可以从文件读取 `AddressBook`，根据用户输入，将新 `Person` 添加到 `AddressBook`，并且再次将新的 `AddressBook` 写回文件。这部分直接调用或引用 protocol buffer 类的代码会以“// pb”标出。

```c++
#include <iostream>
#include <fstream>
#include <string>
#include "addressbook.pb.h"	// pb
using namespace std;

// This function fills in a Person message based on user input.
void PromptForAddress(tutorial::Person* person) {
  cout << "Enter person ID number: ";
  int id;
  cin >> id;
  person->set_id(id);	// pb
  cin.ignore(256, '\n');

  cout << "Enter name: ";
  getline(cin, *person->mutable_name());	// pb

  cout << "Enter email address (blank for none): ";
  string email;
  getline(cin, email);
  if (!email.empty()) {	// pb
    person->set_email(email);	// pb
  }

  while (true) {
    cout << "Enter a phone number (or leave blank to finish): ";
    string number;
    getline(cin, number);
    if (number.empty()) {
      break;
    }

    tutorial::Person::PhoneNumber* phone_number = person->add_phone();	//pb
    phone_number->set_number(number);	// pb

    cout << "Is this a mobile, home, or work phone? ";
    string type;
    getline(cin, type);
    if (type == "mobile") {
      phone_number->set_type(tutorial::Person::MOBILE);	// pb
    } else if (type == "home") {
      phone_number->set_type(tutorial::Person::HOME);	// pb
    } else if (type == "work") {
      phone_number->set_type(tutorial::Person::WORK);	// pb
    } else {
      cout << "Unknown phone type.  Using default." << endl;
    }
  }
}

// Main function:  Reads the entire address book from a file,
//   adds one person based on user input, then writes it back out to the same
//   file.
int main(int argc, char* argv[]) {
  // Verify that the version of the library that we linked against is
  // compatible with the version of the headers we compiled against.
  GOOGLE_PROTOBUF_VERIFY_VERSION;	// pb

  if (argc != 2) {
    cerr << "Usage:  " << argv[0] << " ADDRESS_BOOK_FILE" << endl;
    return -1;
  }

  tutorial::AddressBook address_book;	// pb

  {
    // Read the existing address book.
    fstream input(argv[1], ios::in | ios::binary);
    if (!input) {
      cout << argv[1] << ": File not found.  Creating a new file." << endl;
    } else if (!address_book.ParseFromIstream(&input)) {	// pb
      cerr << "Failed to parse address book." << endl;
      return -1;
    }
  }

  // Add an address.
  PromptForAddress(address_book.add_person());	// pb

  {
    // Write the new address book back to disk.
    fstream output(argv[1], ios::out | ios::trunc | ios::binary);
    if (!address_book.SerializeToOstream(&output)) {	// pb
      cerr << "Failed to write address book." << endl;
      return -1;
    }
  }

  // Optional:  Delete all global objects allocated by libprotobuf.
  google::protobuf::ShutdownProtobufLibrary();	// pb

  return 0;
}
```

注意 `GOOGLE_PROTOBUF_VERIFY_VERSION` 宏。它是一种好的实践——虽然不是严格必须的——在使用 C++ Protocol Buffer 库之前执行该宏。它可以保证避免不小心链接到一个与编译的头文件版本不兼容的库版本。如果被检查出来版本不匹配，程序将会终止。注意，每个 `.pb.cc` 文件在初始化时会自动调用这个宏。

同时注意在程序最后调用 `ShutdownProtobufLibrary()`。它用于释放 Protocol Buffer 库申请的所有全局对象。对大部分程序，这不是必须的，因为虽然程序只是简单退出，但是 OS 会处理释放程序的所有内存。然而，如果你使用了内存泄漏检测工具，工具要求全部对象都要释放，或者你正在写一个 Protocol Buffer 库，该库可能会被一个进程多次加载和卸载，那么你可能需要强制 Protocol Buffer 清除所有东西。

### 读取消息

当然，如果你无法从它获取任何信息，那么这个地址簿没多大用处！这个示例读取上面例子创建的文件，并打印文件里的所有内容。

```c++
#include <iostream>
#include <fstream>
#include <string>
#include "addressbook.pb.h"	// pb
using namespace std;

// Iterates though all people in the AddressBook and prints info about them.
void ListPeople(const tutorial::AddressBook& address_book) {	// pb
  for (int i = 0; i < address_book.person_size(); i++) {		// pb
    const tutorial::Person& person = address_book.person(i);	// pb

    cout << "Person ID: " << person.id() << endl;	// pb
    cout << "  Name: " << person.name() << endl;	// pb
    if (person.has_email()) {	// pb
      cout << "  E-mail address: " << person.email() << endl;	// pb
    }

    for (int j = 0; j < person.phone_size(); j++) {	// pb
      const tutorial::Person::PhoneNumber& phone_number = person.phone(j);	// pb

      switch (phone_number.type()) {	// pb
        case tutorial::Person::MOBILE:	// pb
          cout << "  Mobile phone #: ";
          break;
        case tutorial::Person::HOME:	// pb
          cout << "  Home phone #: ";
          break;
        case tutorial::Person::WORK:	// pb
          cout << "  Work phone #: ";
          break;
      }
      cout << phone_number.number() << endl;	// ob
    }
  }
}

// Main function:  Reads the entire address book from a file and prints all
//   the information inside.
int main(int argc, char* argv[]) {
  // Verify that the version of the library that we linked against is
  // compatible with the version of the headers we compiled against.
  GOOGLE_PROTOBUF_VERIFY_VERSION;	// pb

  if (argc != 2) {
    cerr << "Usage:  " << argv[0] << " ADDRESS_BOOK_FILE" << endl;
    return -1;
  }

  tutorial::AddressBook address_book;	// pb

  {
    // Read the existing address book.
    fstream input(argv[1], ios::in | ios::binary);
    if (!address_book.ParseFromIstream(&input)) {	// pb
      cerr << "Failed to parse address book." << endl;
      return -1;
    }
  }

  ListPeople(address_book);

  // Optional:  Delete all global objects allocated by libprotobuf.
  google::protobuf::ShutdownProtobufLibrary();	// pb

  return 0;
}
```

### 扩展 Protocol Buffer

或早或晚在你发布了使用 protocol buffer 的代码之后，毫无疑问，你会想要 "改善"
 protocol buffer 的定义。如果你想要新的 buffers 向后兼容，并且老的 buffers 向前兼容——几乎可以肯定你很渴望这个——这里有一些规则，你需要遵守。在新的 protocol buffer 版本：

 * 你绝不可以修改任何已存在字段的标签数字
 * 你绝不可以添加或删除任何 `required` 字段
 * 你可以删除 `optional` 或 `repeated` 字段
 * 你可以添加新的 `optional` 或 `repeated` 字段，但是你必须使用新的标签数字（也就是说，标签数字在 protocol buffer 中从未使用过，甚至不能是已删除字段的标签数字）。

（对于上面规则有一些[例外情况][9]，但它们很少用到。）

如果你能遵守这些规则，旧代码则可以欢快地读取新的消息，并且简单地忽略所有新的字段。对于旧代码来说，被删除的 `optional` 字段将会简单地赋予默认值，被删除的 `repeated` 字段会为空。新代码显然可以读取旧消息。然而，请记住新的 `optional` 字段不会呈现在旧消息中，因此你需要显式地使用 `has_` 检查它们是否被设置或者在 `.proto` 文件在标签数字后使用 `[default = value]` 提供一个合理的默认值。如果一个 `optional` 元素没有指定默认值，它将会使用类型特定的默认值：对于字符串，默认值为空字符串；对于布尔值，默认值为 false；对于数字类型，默认类型为 0。注意，如果你添加一个新的 `repeated` 字段，新代码将无法辨别它被留空（left empty）（被新代码）或者从没被设置（被旧代码），因为 `repeated` 字段没有 `has_` 标志。

### 优化技巧

C++ Protocol Buffer 库已极度优化过了。但是，恰当的用法能够更多地提高性能。这里是一些技巧，可以帮你从库中挤压出最后一点速度：

* 尽可能复用消息对象。即使它们被清除掉，消息也会尽量保存所有被分配来重用的内存。因此，如果我们正在处理许多相同类型或一系列相似结构的消息，一个好的办法是重用相同的消息对象，从而减少内存分配的负担。但是，随着时间的流逝，对象可能会膨胀变大，尤其是当你的消息尺寸（LCTT 译注：各消息内容不同，有些消息内容多一些，有些消息内容少一些）不同的时候，或者你偶尔创建了一个比平常大很多的消息的时候。你应该自己通过调用 [SpaceUsed][10] 方法监测消息对象的大小，并在它太大的时候删除它。
* 对于在多线程中分配大量小对象的情况，你的操作系统内存分配器可能优化得不够好。你可以尝试使用 google 的 [tcmalloc][11]。

### 高级用法

Protocol Buffers 绝不仅用于简单的数据存取以及序列化。请阅读 [C++ API reference][12] 来看看你还能用它来做什么。

protocol 消息类所提供的一个关键特性就是反射（reflection）。你不需要针对一个特殊的消息类型编写代码，就可以遍历一个消息的字段并操作它们的值。一个使用反射的有用方法是 protocol 消息与其他编码互相转换，比如 XML 或 JSON。反射的一个更高级的用法可能就是可以找出两个相同类型的消息之间的区别，或者开发某种“协议消息的正则表达式”，利用正则表达式，你可以对某种消息内容进行匹配。只要你发挥你的想像力，就有可能将 Protocol Buffers 应用到一个更广泛的、你可能一开始就期望解决的问题范围上。

反射是由 [Message::Reflection interface][13] 提供的。

--------------------------------------------------------------------------------

via: https://developers.google.com/protocol-buffers/docs/cpptutorial

作者：[Google][a]
译者：[cposture](https://github.com/cposture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://developers.google.com/protocol-buffers/docs/cpptutorial
[1]: https://developers.google.com/protocol-buffers/docs/proto
[2]: https://developers.google.com/protocol-buffers/docs/encoding
[3]: https://developers.google.com/protocol-buffers/docs/downloads
[4]: https://developers.google.com/protocol-buffers/docs/downloads.html
[5]: https://developers.google.com/protocol-buffers/docs/reference/cpp-generated
[6]: https://developers.google.com/protocol-buffers/docs/proto
[7]: https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.message.html#Message
[8]: https://developers.google.com/protocol-buffers/docs/encoding
[9]: https://developers.google.com/protocol-buffers/docs/proto#updating
[10]: https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.message.html#Message.SpaceUsed.details
[11]: http://code.google.com/p/google-perftools/
[12]: https://developers.google.com/protocol-buffers/docs/reference/cpp/index.html
[13]: https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.message.html#Message.Reflection
