[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13446-1.html)
[#]: subject: (Create a list in a Flutter mobile app)
[#]: via: (https://opensource.com/article/20/11/flutter-lists-mobile-app)
[#]: author: (Vitaly Kuprenko https://opensource.com/users/kooper)

在 Flutter 移动应用程序中创建一个列表
======

> 了解如何创建 Flutter 应用的界面以及如何在它们之间进行数据传递。

![](https://img.linux.net.cn/data/attachment/album/202105/31/201442luk1u6vqz3h3k8jn.jpg)

Flutter 是一个流行的开源工具包，它可用于构建跨平台的应用。在文章《[用 Flutter 创建移动应用][2]》中，我已经向大家展示了如何在 Linux 中安装 [Flutter][3] 并创建你的第一个应用。而这篇文章，我将向你展示如何在你的应用中添加一个列表，点击每一个列表项可以打开一个新的界面。这是移动应用的一种常见设计方法，你可能以前见过的，下面有一个截图，能帮助你对它有一个更直观的了解：

![测试 Flutter 应用][4]

Flutter 使用 [Dart][6] 语言。在下面的一些代码片段中，你会看到以斜杠开头的语句。两个斜杠（`//`）是指代码注释，用于解释某些代码片段。三个斜杠（`///`）则表示的是 Dart 的文档注释，用于解释 Dart 类和类的属性，以及其他的一些有用的信息。

### 查看Flutter应用的主要部分

Flutter 应用的典型入口点是 `main()` 函数，我们通常可以在文件 `lib/main.dart` 中找到它:

```
void main() {
 runApp(MyApp());
}
```

应用启动时，`main()` 会被调用，然后执行 `MyApp()`。 `MyApp` 是一个无状态微件（`StatelessWidget`），它包含了`MaterialApp()` 微件中所有必要的应用设置（应用的主题、要打开的初始页面等）：

```
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.blue,
       visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
     home: MyHomePage(title: 'Flutter Demo Home Page'),
   );
 }
}
```

生成的 `MyHomePage()` 是应用的初始页面，是一个有状态的微件，它包含包含可以传递给微件构造函数参数的变量（从上面的代码看，我们传了一个 `title` 变量给初始页面的构造函数）：

```
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
```

有状态微件（`StatefulWidget`）表示这个微件可以拥有自己的状态：`_MyHomePageState`。调用 `_MyHomePageState` 中的 `setState()` 方法，可以重新构建用户界面：

```
class _MyHomePageState extends State<MyHomePage> {
 int _counter = 0; // Number of taps on + button.

 void _incrementCounter() { // Increase number of taps and update UI by calling setState().
   setState(() {
     _counter++;
   });
 }
 ...
}
```

不管是有状态的，还是无状态的微件，它们都有一个 `build()` 方法，该方法负责微件的 UI 外观。

```
@override
Widget build(BuildContext context) {
 return Scaffold( // Page widget.
   appBar: AppBar( // Page app bar with title and back button if user can return to previous screen.
     title: Text(widget.title), // Text to display page title.
   ),
   body: Center( // Widget to center child widget.
     child: Column( // Display children widgets in column.
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Text( // Static text.
           'You have pushed the button this many times:',
         ),
         Text( // Text with our taps number.
           '$_counter', // $ sign allows us to use variables inside a string.
           style: Theme.of(context).textTheme.headline4,// Style of the text, “Theme.of(context)” takes our context and allows us to access our global app theme.
         ),
       ],
     ),
   ),
        // Floating action button to increment _counter number.
   floatingActionButton: FloatingActionButton(
     onPressed: _incrementCounter,
     tooltip: 'Increment',
     child: Icon(Icons.add),
   ),
 );
}
```

### 修改你的应用

一个好的做法是，把 `main()` 方法和其他页面的代码分开放到不同的文件中。要想将它们分开，你需要右击 `lib` 目录，然后选择 “New > Dart File” 来创建一个 .dart 文件：

![创建一个新的 Dart 文件][10]

将新建的文件命名为 `items_list_page`。

切换回到 `main.dart` 文件，将 `MyHomePage` 和 `_MyHomePageState` 中的代码，剪切并粘贴到我们新建的文件。然后将光标放到 `StatefulWidget` 上（下面红色的下划线处）, 按 `Alt+Enter` 后出现下拉列表，然后选择 `package:flutter/material.dart`：

![导入 Flutter 包][11]

经过上面的操作我们将 `flutter/material.dart` 包添加到了 `main.dart` 文件中，这样我们就可以使用 Flutter 提供的默认的 material 主题微件。

然后, 在类名 `MyHomePage` 右击，“Refactor > Rename...”将其重命名为 `ItemsListPage`：

![重命名 StatefulWidget 类][12]

Flutter 识别到你重命名了 `StatefulWidget` 类，它会自动将它的 `State` 类也跟着重命名:

![State 类被自动重命名][13]

回到 `main.dart` 文件，将文件名 `MyHomePage` 改为 `ItemsListPage`。 一旦你开始输入, 你的 Flutter 集成开发环境（可能是 IntelliJ IDEA 社区版、Android Studio 和 VS Code 或 [VSCodium][14]），会给出自动代码补完的建议。

![IDE 建议自动补完的代码][15]

按回车键即可完成输入，缺失的导入语句会被自动添加到文件的顶部。

![添加缺失的导入语句][16]

到此，你已经完成了初始设置。现在你需要在 `lib` 目录创建一个新的 .dart 文件，命名为 `item_model`。（注意，类命是大写驼峰命名，一般的文件名是下划线分割的命名。）然后粘贴下面的代码到新的文件中：

```
/// Class that stores list item info:
/// [id] - unique identifier, number.
/// [icon] - icon to display in UI.
/// [title] - text title of the item.
/// [description] - text description of the item.
class ItemModel {
 // class constructor
 ItemModel(this.id, this.icon, this.title, this.description);

 // class fields
 final int id;
 final IconData icon;
 final String title;
 final String description;
}
```

回到 `items_list_page.dart` 文件，将已有的 `_ItemsListPageState` 代码替换为下面的代码:

```
class _ItemsListPageState extends State<ItemsListPage> {

// Hard-coded list of [ItemModel] to be displayed on our page.
 final List<ItemModel> _items = [
   ItemModel(0, Icons.account_balance, 'Balance', 'Some info'),
   ItemModel(1, Icons.account_balance_wallet, 'Balance wallet', 'Some info'),
   ItemModel(2, Icons.alarm, 'Alarm', 'Some info'),
   ItemModel(3, Icons.my_location, 'My location', 'Some info'),
   ItemModel(4, Icons.laptop, 'Laptop', 'Some info'),
   ItemModel(5, Icons.backup, 'Backup', 'Some info'),
   ItemModel(6, Icons.settings, 'Settings', 'Some info'),
   ItemModel(7, Icons.call, 'Call', 'Some info'),
   ItemModel(8, Icons.restore, 'Restore', 'Some info'),
   ItemModel(9, Icons.camera_alt, 'Camera', 'Some info'),
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
         itemCount: _items.length, // Number of widget to be created.
         itemBuilder: (context, itemIndex) => // Builder function for every item with index.
             ItemWidget(_items[itemIndex], () {
           _onItemTap(context, itemIndex);
         }),
       ));
 }

 // Method which uses BuildContext to push (open) new MaterialPageRoute (representation of the screen in Flutter navigation model) with ItemDetailsPage (StateFullWidget with UI for page) in builder.
 _onItemTap(BuildContext context, int itemIndex) {
   Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => ItemDetailsPage(_items[itemIndex])));
 }
}


// StatelessWidget with UI for our ItemModel-s in ListView.
class ItemWidget extends StatelessWidget {
 const ItemWidget(this.model, this.onItemTap, {Key key}) : super(key: key);

 final ItemModel model;
 final Function onItemTap;

 @override
 Widget build(BuildContext context) {
   return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
     onTap: onItemTap,
     child: ListTile( // Useful standard widget for displaying something in ListView.
       leading: Icon(model.icon),
       title: Text(model.title),
     ),
   );
 }
}
```

为了提高代码的可读性，可以考虑将 `ItemWidget` 作为一个单独的文件放到 `lib` 目录中。

现在唯一缺少的是 `ItemDetailsPage` 类。在 `lib` 目录中我们创建一个新文件并命名为 `item_details_page`。然后将下面的代码拷贝进去：

```
import 'package:flutter/material.dart';

import 'item_model.dart';

/// Widget for displaying detailed info of [ItemModel]
class ItemDetailsPage extends StatefulWidget {
 final ItemModel model;

 const ItemDetailsPage(this.model, {Key key}) : super(key: key);

 @override
 _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.model.title),
     ),
     body: Center(
       child: Column(
         children: [
           const SizedBox(height: 16),
           Icon(
             widget.model.icon,
             size: 100,
           ),
           const SizedBox(height: 16),
           Text(
             'Item description: ${widget.model.description}',
             style: TextStyle(fontSize: 18),
           )
         ],
       ),
     ),
   );
 }
}
```

上面的代码几乎没什么新东西，不过要注意的是 `_ItemDetailsPageState` 里使用了 `widget.item.title` 这样的语句，它让我们可以从有状态类中引用到其对应的微件（`StatefulWidget`）。

### 添加一些动画

现在让我们来添加一些基础的动画：

  1. 找到 `ItemWidget` 代码块（或者文件）
  2. 将光标放到 `build()` 方法中的 `Icon()` 微件上
  3. 按 `Alt+Enter`，然后选择“Wrap with widget...”

![查看微件选项][18]

输入 `Hero`，然后从建议的下拉列表中选择 `Hero((Key key, @required this, tag, this.create))`：

![查找 Hero 微件][19]

下一步, 给 Hero 微件添加 `tag` 属性 `tag: model.id`：

![在 Hero 微件上添加 tag 属性为 model.id][20]

最后我们在 `item_details_page.dart` 文件中做相同的修改：

![修改item_details_page.dart文件][21]

前面的步骤，其实我们是用 `Hero()` 微件对 `Icon()` 微件进行了封装。还记得吗？前面我们定义 `ItemModel` 类时，定义了一个 `id field`，但没有在任何地方使用到。因为 Hero 微件会为其每个子微件添加一个唯一的标签。当 Hero 检测到不同页面（`MaterialPageRoute`）中存在相同标签的 Hero 时，它会自动在这些不同的页面中应用过渡动画。

可以在安卓模拟器或物理设备上运行我们的应用来测试这个动画。当你打开或者关闭列表项的详情页时，你会看到一个漂亮的图标动画：

![测试 Flutter 应用][4]

### 收尾

这篇教程，让你学到了:

  * 一些符合标准的，且能用于自动创建应用的组件。
  * 如何添加多个页面以及在页面间传递数据。
  * 如何给多个页面添加简单的动画。

如果你想了解更多，查看 Flutter 的 [文档][22]（有一些视频和样例项目的链接，还有一些创建 Flutter 应用的“秘方”）与 [源码][23]，源码的开源许可证是 BSD 3。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/flutter-lists-mobile-app

作者：[Vitaly Kuprenko][a]
选题：[lujun9972][b]
译者：[ywxgod](https://github.com/ywxgod)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kooper
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team-phone-collaboration-mobile-device.png?itok=v3EjbRK6 (Mobile devices and collaboration leads to staring at our phones)
[2]: https://linux.cn/article-12693-1.html
[3]: https://flutter.dev/
[4]: https://opensource.com/sites/default/files/uploads/flutter_test.gif (Testing the Flutter app)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://dart.dev/
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+key
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+icon
[10]: https://opensource.com/sites/default/files/uploads/flutter_new-dart-file_0.png (Create a new Dart file)
[11]: https://opensource.com/sites/default/files/uploads/flutter_import-package.png (Importing Flutter package)
[12]: https://opensource.com/sites/default/files/uploads/flutter_rename-class.png (Renaming StatefulWidget class)
[13]: https://opensource.com/sites/default/files/uploads/flutter_stateclassrenamed.png (State class renamed automatically)
[14]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[15]: https://opensource.com/sites/default/files/uploads/flutter_autocomplete.png (IDE suggests autocompleting code)
[16]: https://opensource.com/sites/default/files/uploads/flutter_import-input.png (Adding missing import )
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+listview
[18]: https://opensource.com/sites/default/files/uploads/flutter_wrapwithwidget.png (Wrap with widget option)
[19]: https://opensource.com/sites/default/files/uploads/flutter_hero.png (Finding the Hero widget)
[20]: https://opensource.com/sites/default/files/uploads/flutter_hero-tag.png (Adding the tag property model.id to the Hero widget)
[21]: https://opensource.com/sites/default/files/uploads/flutter_details-tag.png (Changing item_details_page.dart file)
[22]: https://flutter.dev/docs
[23]: https://github.com/flutter
