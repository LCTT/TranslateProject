[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a list in a Flutter mobile app)
[#]: via: (https://opensource.com/article/20/11/flutter-lists-mobile-app)
[#]: author: (Vitaly Kuprenko https://opensource.com/users/kooper)

在Flutter移动应用程序中创建一个列表
======
了解如何创建Flutter应用的界面以及如何在它们之间进行数据传递。
![移动设备以及相互协作导致人们盯着手机看][1]

Flutter是一个流行的开源工具包，它可用于构建跨平台的应用。在文章"[用Flutter创建移动应用][2]"中，我已经向大家展示了如何在Linux中安装[Flutter][3]并创建你的第一个应用。而这篇文章，我将向你展示如何在你的应用中添加一个列表，点击每一个列表项可以打开一个新的界面。这是移动应用的一种常见设计方法，你可能以前见过的, 下面有一个截图，能帮助你对它有一个更直观的了解:

![测试Flutter应用][4]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Flutter使用[Dart][6]语言。在下面的一些代码片段中，你会看到以斜杠开头的语句。两个斜杠(`/ /`)是指代码注释，用于解释某些代码片段。三个斜杠(`/ / /`)则表示的是Dart的文档注释，用于解释Dart类和类的属性，以及其他的一些有用的信息。

### 查看Flutter应用的主要部分

Flutter应用的典型入口点是`main()`函数，我们通常可以在文件`lib/main.dart`中找到它:


```
void main() {
 runApp(MyApp());
}
```

应用启动时，`main()`会被调用，然后执行`MyApp()`。 `MyApp`是一个无状态的Widget(StatelessWidget)，它包含了`MaterialApp()`widget，`MaterialApp`中包含了所有必要的应用设置(应用的主题、要打开的初始页面等):


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

`MyHomePage()`是应用的初始页面，是一个有状态的widget， 它包含了一个传给其构造函数的参数(从上面的代码看，我们传了一个`title`变量给初始页面的构造函数):


```
class MyHomePage extends StatefulWidget {
  MyHomePage({[Key][7] key, this.title}) : super(key: key);

  final [String][8] title;

  @override
  _MyHomePageState createState() =&gt; _MyHomePageState();
}
```

有状态的widget，表示这个widget可以拥有自己的状态: `_MyHomePageState`。调用`_MyHomePageState`中的`setState()`方法，可以重新构建页面界面。


```
class _MyHomePageState extends State&lt;MyHomePage&gt; {
 int _counter = 0; // Number of taps on + button.

 void _incrementCounter() { // Increase number of taps and update UI by calling setState().
   setState(() {
     _counter++;
   });
 }
 ...
}
```

不管是有状态的，还是无状态的微件(widget)，他们都有一个`build()`方法，该方法负责微件的UI外观。


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
       children: &lt;Widget&gt;[
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
     child: [Icon][9](Icons.add),
   ),
 );
}
```

### 修改你的应用

一个好的做法是，把`main()`方法和其他页面的代码分开放到不同的文件中。要想将它们分开，你需要右击**lib**目录，然后选择**New &gt; Dart File**来创建一个.dart文件：

![创建一个新的Dart文件][10]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

将新建的文件命名为`items_list_page`。

切换回到`main.dart`文件，将`MyHomePage`和`_MyHomePageState`中的代码，剪切并粘贴到我们新建的文件。然后将光标放到`StatefulWidget`上(下面红色的下划线处), 按Alt+Enter后出现下拉列表, 然后选择`package:flutter/material.dart`：

![导入Flutter包][11]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

经过上面的操作我们将`flutter/material.dart`包添加到了`main.dart`文件中，这样我们就可以使用Flutter提供的默认的material主题微件.

然后, 在类名**MyHomePage**右击，**MyHomePage class &gt; Refactor &gt; Rename…**将其重命名为`ItemsListPage`:

![重命名StatefulWidget类][12]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Flutter识别到你重命名了StatefulWidget类，它会自动将它的State类也跟着重命名:

![State类被自动重命名][13]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

回到`main.dart`文件，将文件名`MyHomePage`改为`ItemsListPage`。 一旦你开始输入, 你的Flutter集成开发环境(可能是IntelliJ IDEA社区版、Android Studio和VS Code或[VSCodium][14])，会给出建议告诉你，如何自动完成代码输入。

![IDE建议自动完成的代码][15]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

按Enter键即可完成输入，缺失的导入语句会被自动添加到文件的顶部。

![添加缺失的导入语句][16]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

到此，你已经完成了初始设置。现在你需要在**lib**目录创建一个新的.dart文件，命名为`item_model`。(注意，类命是大驼峰命名, 一般的文件名是下划线分割的命名。)然后粘贴下面的代码到新的文件中：


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
 final [String][8] title;
 final [String][8] description;
}
```

回到`items_list_page.dart`文件, 将已有的`_ItemsListPageState`代码替换为下面的代码:


```
class _ItemsListPageState extends State&lt;ItemsListPage&gt; {

// Hard-coded list of [ItemModel] to be displayed on our page.
 final List&lt;ItemModel&gt; _items = [
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
       body: [ListView][17].builder( // Widget which creates [ItemWidget] in scrollable list.
         itemCount: _items.length, // Number of widget to be created.
         itemBuilder: (context, itemIndex) =&gt; // Builder function for every item with index.
             ItemWidget(_items[itemIndex], () {
           _onItemTap(context, itemIndex);
         }),
       ));
 }

 // Method which uses BuildContext to push (open) new MaterialPageRoute (representation of the screen in Flutter navigation model) with ItemDetailsPage (StateFullWidget with UI for page) in builder.
 _onItemTap(BuildContext context, int itemIndex) {
   Navigator.of(context).push(MaterialPageRoute(
       builder: (context) =&gt; ItemDetailsPage(_items[itemIndex])));
 }
}

// StatelessWidget with UI for our ItemModel-s in ListView.
class ItemWidget extends StatelessWidget {
 const ItemWidget(this.model, this.onItemTap, {[Key][7] key}) : super(key: key);

 final ItemModel model;
 final Function onItemTap;

 @override
 Widget build(BuildContext context) {
   return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
     onTap: onItemTap,
     child: ListTile( // Useful standard widget for displaying something in ListView.
       leading: [Icon][9](model.icon),
       title: Text(model.title),
     ),
   );
 }
}
```

为了提高代码的可读性，可以考虑将`ItemWidget`作为一个单独的文件放到**lib**目录中。

现在唯一缺少的是`ItemDetailsPage`类。在**lib**目录中我们创建一个新文件并命名为`item_details_page`。然后将下面的代码拷贝进去:


```
import 'package:flutter/material.dart';

import 'item_model.dart';

/// Widget for displaying detailed info of [ItemModel]
class ItemDetailsPage extends StatefulWidget {
 final ItemModel model;

 const ItemDetailsPage(this.model, {[Key][7] key}) : super(key: key);

 @override
 _ItemDetailsPageState createState() =&gt; _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State&lt;ItemDetailsPage&gt; {
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
           [Icon][9](
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

上面的代码几乎没什么新东西，不过要注意的是`_ItemDetailsPageState`里使用了`widget.item.title`这样的语句，它让我们可以从State类中引用到其对应的微件(StatefulWidget)

### 添加一些动画

现在让我们来添加一些基础的动画:

  1. 找到`ItemWidget`代码块(或者文件).
  2. 将光标放到`build()`方法中的`Icon()`微件上。
  3. 按Alt+Enter，然后选择"Wrap with widget…"



![查看微件选项][18]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

输入"Hero"，然后从建议的下拉列表中选择`Hero((Key key, @required this, tag, this.create))`:

![查找Hero微件][19]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

下一步, 给Hero微件添加tag属性`tag: model.id`:

![在Hero微件上添加tag属性为model.id][20]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

最后我们在`item_details_page.dart`文件中做相同的修改:

![修改item_details_page.dart文件][21]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

前面的步骤，其实我们是用`Hero()`微件对`Icon()`微件进行了包装。还记得吗？前面我们定义`ItemModel`类时，定义了一个`id field`，但没有在任何地方使用到。因为Hero微件会为其每个子微件添加一个唯一的tag。当Hero检测到不同页面(MaterialPageRoute)中存在相同tag的Hero时，它会自动在这些不同的页面中应用过渡动画。

可以在安卓模拟器或物理设备上运行我们的应用来做这个动画的测试。当你打开或者关闭列表项的详情页时，你会看到一个漂亮的图标动画：

![测试Flutter应用][4]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

### 收尾

这篇教程，让你学到了:

  * 一些符合标准的，且能用于自动创建应用的组件。
  * 如何添加多个页面以及在页面间传递数据。
  * 如何给多个页面添加简单的动画。



如果你想了解更多, 查看Flutter的[文档][22] (一些视频和样例项目的链接, 还有一些创建Flutter应用的“秘方”)与[源码][23], 源码的开源协议是BSD 3。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/flutter-lists-mobile-app

作者：[Vitaly Kuprenko][a]
选题：[lujun9972][b]
译者：[ywxgod](https://github.com/ywxgod)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kooper
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team-phone-collaboration-mobile-device.png?itok=v3EjbRK6 (Mobile devices and collaboration leads to staring at our phones)
[2]: https://opensource.com/article/20/9/mobile-app-flutter
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
