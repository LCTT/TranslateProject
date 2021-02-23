[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a list in a Flutter mobile app)
[#]: via: (https://opensource.com/article/20/11/flutter-lists-mobile-app)
[#]: author: (Vitaly Kuprenko https://opensource.com/users/kooper)

Create a list in a Flutter mobile app
======
Learn how to create Flutter app screens and pass data between them.
![Mobile devices and collaboration leads to staring at our phones][1]

Flutter is a popular open source toolkit for building cross-platform apps. In "[Create a mobile app with Flutter][2]," I demonstrated how to install [Flutter][3] on Linux and create your first app. In this article, I'll show you how to add a list of items in your app, with each item opening a new screen. This is a common design method for mobile apps, so you've probably seen it before, but here's a screenshot to help you visualize it:

![Testing the Flutter app][4]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Flutter uses the [Dart][6] language. In some of the code snippets below, you'll see statements beginning with slashes. Two slashes (`/ /`) is for code comments, which explain certain pieces of code. Three slashes (`/ / /`) denotes Dart's documentation comments, which explain Dart classes and their properties and other useful information.

### Examine a Flutter app's main parts

A typical entry point for a  Flutter application is a `main()` function, usually found in a file called `lib/main.dart`:


```
void main() {
 runApp(MyApp());
}
```

This method is called when the app is launched. It runs `MyApp()`, a StatelessWidget containing all necessary app settings in the `MaterialApp()` widget (app theme, initial page to open, and so on):


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

The initial page generated is called `MyHomePage()`. It's a stateful widget that contains variables that can be passed to a widget constructor parameter (take a look at the code above, where you pass the variable `title` to the page constructor):


```
class MyHomePage extends StatefulWidget {
  MyHomePage({[Key][7] key, this.title}) : super(key: key);

  final [String][8] title;

  @override
  _MyHomePageState createState() =&gt; _MyHomePageState();
}
```

StatefulWidget means that this page has its own state: `_MyHomePageState`. It lets you call the `setState()` method there to rebuild the page's user interface (UI):


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

A `build()` function in stateful and stateless widgets is responsible for UI appearance:


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

### Modify your app

It's good practice to separate the `main()` method and other pages' code into different files. To do so, you need to create a new .dart file by right-clicking on the **lib** folder then selecting **New &gt; Dart File**:

![Create a new Dart file][10]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Name the file `items_list_page`.

Switch back to your `main.dart` file, cut the `MyHomePage` and `_MyHomePageState` code, and paste it into your new file. Next, set your cursor on `StatefulWidget` (underlined below in red), press Alt+Enter, and select `package:flutter/material.dart`:

![Importing Flutter package][11]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

This adds `flutter/material.dart` to your file so that you can use the default material widgets Flutter provides.

Then, right-click on **MyHomePage class &gt; Refactor &gt; Rename…** and rename this class to `ItemsListPage`:

![Renaming StatefulWidget class][12]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Flutter recognizes that you renamed the StatefulWidget class and automatically renames its State class:

![State class renamed automatically][13]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Return to the `main.dart` file and change the name `MyHomePage` to `ItemsListPage`. Once you start typing, your Flutter integrated development environment (probably IntelliJ IDEA Community Edition, Android Studio, and VS Code or [VSCodium][14]) suggests how to autocomplete your code:

![IDE suggests autocompleting code][15]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Press Enter to complete your input. It will add the missing import to the top of the file automatically:

![Adding missing import ][16]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

You've completed your initial setup. Now you need to create a new .dart file in the **lib** folder and name it `item_model`. (Note that classes have UpperCamelCase names, but files have snake_case names.) Paste this code into the new file:


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

Return to `items_list_page.dart`, and replace the existing `_ItemsListPageState` code with:


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

Consider moving `ItemWidget` to a separate file in the **lib** folder to improve the readability of your code.

The only thing missing is the `ItemDetailsPage` class. Create a new file in the **lib** folder and name it `item_details_page`. Then copy and paste this code there:


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

Almost nothing new here. Notice that `_ItemDetailsPageState` is using the `widget.item.title` code. It enables referring to the `StatefulWidget` fields in its `State` class.

### Add some animation

Now, it's time to add some basic animation:

  1. Go to `ItemWidget` code.
  2. Put the cursor on the `Icon()` widget in the `build()` method.
  3. Press Alt+Enter and select "Wrap with widget…"



![Wrap with widget option][18]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Start typing "Hero" and select the suggestion for `Hero((Key key, @required this, tag, this.create))`:

![Finding the Hero widget][19]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

Next, add the tag property `tag: model.id` to the Hero widget:

![Adding the tag property model.id to the Hero widget][20]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

And the final step is to make the same change in the `item_details_page.dart` file:

![Changing item_details_page.dart file][21]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

The previous steps wrapped the `Icon()` widget with the `Hero()` widget. Do you remember in `ItemModel` you added the `id field` but didn't use it anywhere? The Hero widget takes a unique tag for the child widget. If Hero detects that different app screens (MaterialPageRoute) have a Hero widget with the same tag, it'll automatically animate the transition between these pages.

Test it out by running the app on an Android emulator or physical device. When you open and close the item details page, you'll see a nice animation of the icon:

![Testing the Flutter app][4]

(Vitaly Kuprenko, [CC BY-SA 4.0][5])

### Wrapping up

In this tutorial, you learned:

  * The components of a standard, automatically created app
  * How to add several pages that pass data among each other
  * How to add a simple animation for those pages



If you want to learn more, check out Flutter's [docs][22] (with links to sample projects, videos, and "recipes" for creating Flutter apps) and the [source code][23], which is open source under a BSD 3-Clause License.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/flutter-lists-mobile-app

作者：[Vitaly Kuprenko][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
