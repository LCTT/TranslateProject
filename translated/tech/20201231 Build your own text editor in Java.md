[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build your own text editor in Java)
[#]: via: (https://opensource.com/article/20/12/write-your-own-text-editor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Java 构建你自己的文本编辑器
======
有时候，除你自己外，没有人能制作你所梦想的工具。这里是如何开始构建你自己的文本编辑器。
![在家中的一台笔记本电脑上工作][1]

这里有很多可用的文本编辑器。它们大多运行在终端中，运行在一个 GUI 中，运行在一个浏览器中，运行在一个浏览器引擎中。有很多是非常好的，有一些是极好的。但是有时候，毫无疑问，最令人满意的答案就是你自己构建的编辑器。

毫无疑问：构建一个真正优秀的文本编辑器比表面上看上去要困难得多。但话说回来，建立一个基本的文本编辑器也不像你所听到的那样苦难。事实上，大多数编程工具包已经为你准备好了可供你使用的文本编辑器的大多数部件。围绕文本编辑的组件，例如一个菜单条，一个文件选择对话框等等，是很容易拖拽到位置的。因此，在编程课中构建一个基本的文本编辑器是出乎意料的有趣和简明。你可能会发现自己渴望使用自己构造的工具，而且你使用得越多，你可能越会将受到启发而添加到该工具中，从而对你正在使用的编程语言有更多地学习。

为了使这个练习成为现实，最好选择一种有令人满意的 GUI 工具箱的语言。在这里有很多种选择，包括 Qt ，FLTK ，或 GTK ，但是一定要先评审一下它的文档，以确保它有你所期待的功能。对于这篇文章来说，我使用 Java 以及其内置的 Swing 小部件集。如果你想使用一种不同的语言或者一种不同的工具集，这篇文章在如何帮你解决这个问题的方面也仍然是有用的。

不管你选择哪一种，在任何主要的工具箱中编写一个文本编辑器都是惊人的相似。如果你是 Java 新手，需要更多关于开始的信息，请先阅读我的 [猜谜游戏文章][2] 。

### 工程设置

通常，我使用并推荐一款像 [Netbeans][3] 或 Eclipse 一样的 IDE ,我发现当学习一种新的语言时,它可以帮助做一些体力劳动，因此当你使用一款 IDE 时，你可以更好地理解一些对你隐藏的东西。在这篇文章中，我假设你正在使用一款文本编辑器和终端进行编程。

在开始前，为你自己的工程创建一个工程目录。在工程文件夹中，创建一个名称为 `src` 的目录来容纳你的源文件。


```
$ mkdir -p myTextEditor/src
$ cd myTextEditor
```

在你的 `src` 目录中创建一个名称为 `TextEdit.java` 的空白的文件：


```
`$ touch src/TextEditor.java`
```

在你最喜欢的文本编辑器中打开这个空白的文件(我的意思事除你自己编写外的最喜欢的一款文本编辑器)。作好编码的准备！

### Package 和 imports

为确保你的 Java 应用程序有一个唯一的标识符，你必须声明一个 **package** 名称。典型的格式是使用一个反向的域名，如果你真的有一个域名的话，这就特别容易了。如果你没有域名的话，你可以使用 `local` 作为最顶层。像 Java 和很多语言一样，行以分号结尾。

在命名你的 Java 的 package 后，你必须告诉 Java 编译器 (`javac`) 使用那些库来构建你的代码。事实上，这是你在编写代码时所通常添加的内容，因为你很少知道你自己所需要的库。然而，这里有一些库是显而易见的。例如，你知道这个文本编辑器是基于 Swing GUI 工具箱的，因此，导入 `javax.swing.JFrame` 和`javax.swing.UIManager` 和其它相关的特定库。


```
package com.example.textedit;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.filechooser.FileSystemView;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
```

对于这个练习的目标，你可以提前预知你所需要的所有的库。在真实的生活中，不管你喜欢哪一种语言，你都将在研究如何解决一些问题的时候发现库，然后，你将它导入到你的代码中，并使用它。不需要担心 - 如果你忘记包含一个库，你的编译器或解释器将警告你！

### 主窗口

这是一个单窗口应用程序，因此这个应用程序的主类是一个 JFrame ，其附带有一个捕捉菜单事件的 `ActionListener` 。在 Java 中，当那你使用一个现有的小部件元素时，你可以使用你的代码"扩展"它。这个主窗口需要三个字段：窗口本身（一个 JFrame 的实例），一个用于文件选择器返回值的标识符，和文本编辑器本身（JTextArea）。


```
public final class TextEdit extends JFrame implements ActionListener {
private static JTextArea area;
private static JFrame frame;
private static int returnValue = 0;
```

令人惊奇的是，这数行代码完成了实现一个基本文本编辑器的 80% 的工作，因为 JtextArea 是 Java 的文本输入字段。剩下的 80 行代码大部分用于处理助手功能，比如保存和打开文件。

### 构建一个菜单

`JMenuBar` 小部件被设计到 JFrame 的顶部, 
它为你提供你想要的很多条目。Java 不是一种
拖放式的编程语言，因此，对于你所添加的每一个菜单，你都还必须编写一个函数。为保持这个工程的可操纵性，我提供了四个函数：创建一个新的文件，打开一个现有的文件，保存文本到一个文件，和关闭应用程序。

在大多数流行的工具箱中，创建一个菜单的过程基本相同。首先，你创建菜单条本身，然后创建一个顶级菜单（例如 "File" ），再然后创建子菜单项（例如，"New"，"Save" 等)。


```
 public TextEdit() { run(); }

  public void run() {
    frame = new JFrame("Text Edit");

    // Set the look-and-feel (LNF) of the application
        // Try to default to whatever the host system prefers
    try {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException ex) {
      Logger.getLogger(TextEdit.class.getName()).log(Level.SEVERE, null, ex);
    }

        // Set attributes of the app window
    area = new JTextArea();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.add(area);
    frame.setSize(640, 480);
        frame.setVisible(true);

        // Build the menu
    JMenuBar menu_main = new JMenuBar();

        JMenu menu_file = new JMenu("File");

        JMenuItem menuitem_new = new JMenuItem("New");
    JMenuItem menuitem_open = new JMenuItem("Open");
    JMenuItem menuitem_save = new JMenuItem("Save");
    JMenuItem menuitem_quit = new JMenuItem("Quit");

        menuitem_new.addActionListener(this);
    menuitem_open.addActionListener(this);
    menuitem_save.addActionListener(this);
    menuitem_quit.addActionListener(this);

        menu_main.add(menu_file);

        menu_file.add(menuitem_new);
    menu_file.add(menuitem_open);
    menu_file.add(menuitem_save);
    menu_file.add(menuitem_quit);

        frame.setJMenuBar(menu_main);
    }
```

 

现在，所有剩余的工作是实施菜单项所描述的功能。

### 编程菜单动作

你的应用程序响应菜单选择，是因为你的 JFrame 有一个附属于它的 `ActionListener` 。在 Java 中，当你实施一个事件处理程序时，你必须 "重写" 其内建的函数。这听起来比实际情况更严重。你不是在重写 Java；你只是在实施已经被定义但尚未实施事件处理程序的函数。

在这种情况下，你必须重写 `actionPerformed`方法。因为在 **File** 菜单中的所有条目都与处理文件有关，所以在我的代码中很早就定义了一个 JFileChooser 。代码其它部分被划分到一个 `if` 语句的子语句中，这起来像接收到什么事件就相应地执行什么动作。每个字语句都与其它的子语句完全不同，因为每个项目都标示着一些完全唯一的东西。最相似的是 **Open** 和 **Save** ，因为它们都使用 JFileChooser 选择文件系统中的一个点来获取或放置数据。

**New** 选项会在没有警告的情况下清理 JTextArea ，**Quit** 选项会在没有警告的情况下关闭应用程序。这两个 "功能" 都是不安全的，因此你应该想对这段代码进行一点改善，这是一个很好的开始。在内容还没有被保存前，一个友好的警告是任何一个好的文本编辑器都必不可少的一个功能，但是在这里为了简单，这件是未来的一个功能。


```
@Override
public void actionPerformed(ActionEvent e) {
    String ingest = null;
    JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
    jfc.setDialogTitle("Choose destination.");
    jfc.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);

    String ae = e.getActionCommand();
    if (ae.equals("Open")) {
        returnValue = jfc.showOpenDialog(null);
        if (returnValue == JFileChooser.APPROVE_OPTION) {
        File f = new File(jfc.getSelectedFile().getAbsolutePath());
        try{
            FileReader read = new FileReader(f);
            Scanner scan = new Scanner(read);
            while(scan.hasNextLine()){
                String line = scan.nextLine() + "\n";
                ingest = ingest + line;
        }
            area.setText(ingest);
        }
    catch ( FileNotFoundException ex) { ex.printStackTrace(); }
}
    // 保存
    } else if (ae.equals("Save")) {
        returnValue = jfc.showSaveDialog(null);
        try {
            File f = new File(jfc.getSelectedFile().getAbsolutePath());
            FileWriter out = new FileWriter(f);
            out.write(area.getText());
            out.close();
        } catch (FileNotFoundException ex) {
            Component f = null;
            JOptionPane.showMessageDialog(f,"File not found.");
        } catch (IOException ex) {
            Component f = null;
            JOptionPane.showMessageDialog(f,"Error.");
        }
    } else if (ae.equals("New")) {
        area.setText("");
    } else if (ae.equals("Quit")) { System.exit(0); }
  }
}
```

从技术上来说，这就是这个文本编辑器的全部。当然，并没有真正做什么，除此之外，在这里仍然有测试和打包步骤，因此仍然有很多时间来发现缺少的必需品。假设你没有注意到提示：在这段代码中 _肯定_ 缺少一些东西。你现在知道缺少的是什么吗？(在 [猜谜游戏文章][4] 中被大量的提到.)

### 测试

你现在可以测试你的应用程序。从一个终端中启动你所编写的文本编辑器：


```
$ java ./src/TextEdit.java
error: can’t find main(String[]) method in class: com.example.textedit.TextEdit
```

它看起来像在代码中没有获得一个 main 方法。这里有一些方法来修复这个问题：你可以在 `TextEdit.java` 中创建一个 main 方法，并让它运行一个 `TextEdit` 类实例，或者你可以创建一个单独的包含 main 方法的文件。两种方法都工作地同样好，但从大型工程的预期来看，使用后者更为明智，因此，使用单独的文件与其一起工作使之成为一个完整的应用程序的方法是值得使用的。

在 `src` 中创建一个 `Main.java` 文件，并在最喜欢的编辑器中打开：


```
package com.example.textedit;

public class Main {
  public static void main(String[] args) {
  TextEdit runner = new TextEdit();
  }
}
```

你可以再次尝试，但是现在有两个相互依赖的文件要运行，因此你必须编译代码。Java 使用 `javac` 编译器，并且你可以使用 `-d` 选项来设置目标目录：


```
`$ javac src/*java -d .`
```

这会在你的软件包名称 `com/example/textedit` 后创建一个准确地模型化的新的目录结构。这个新的类路径包含文件 `Main.class` 和 `TextEdit.class` ，这两个文件构成了你的应用程序。你可以使用 `java` 并通过引用你的 Main 类的位置和 _名称_（非文件名称）来运行它们：


```
`$ java info/slackermedia/textedit/Main`
```

你的文本编辑器打开了，你可以在其中输入文字，打开文件，甚至保存你的工作。

![带有单个下拉菜单的白色文本编辑器框，有 File, New, Open, Save, 和 Quit 选项][5]

### 以 Java 软件包的形式分享你的工作

虽然一些程序员似乎看起来认可以各种各样的源文件的型式分发软件包，并忠心鼓励其他人来学习如何运行它，但是，Java 让打包应用程序变得真地很容易，以至其他人可以很容易的运行它。你已经有了必备的大部分结构体，但是你仍然需要一些元数据到一个 `Manifest.txt` 文件中：

```
`$ echo "Manifest-Version: 1.0" > Manifest.txt`
```

用于打包的 `jar` 命令，与 [tar][6] 命令非常相似，因此很多选项对你来说可能会很熟悉。为创建一个 JAR 文件：


```
$ jar cvfme TextEdit.jar
Manifest.txt
com.example.textedit.Main
com/example/textedit/*.class
```

根据命令的语法，你可以推测出它会创建一个新的名称为 `TextEdit.jar` 的 JAR 文件，它所需要的清单数据位于 `Manifest.txt` 中。它的主类被定义为软件包名称的一个扩展，并且类自身是 `com/example/textedit/Main.class` 。

你可以查看 JAR 文件的内容：

```
$ jar tvf TextEdit.jar
0 Wed Nov 25 META-INF/
105 Wed Nov 25 META-INF/MANIFEST.MF
338 Wed Nov 25 com/example/textedit/textedit/Main.class
4373 Wed Nov 25 com/example/textedit/textedit/TextEdit.class
```

如果你想看看你的元数据是如何被集成到 `MANIFEST.MF` 文件中的，你甚至可以使用 `xvf` 选项来提取它。

使用 `java` 命令来运行你的 JAR 文件：


```
`$ java -jar TextEdit.jar`
```

你甚至可以 [创建一个桌面文件][7] ，这样，在单击应用程序菜单中的图标时，应用程序就会启动。

### 改善它

在它是当前状态下，这是一个非常基本的文本编辑器，最适合做快速笔记或简短自述文档。在一些研究后，一些改善（例如添加一个垂直滚动条）是很快速和容易的，而其它的一些改善（例如实施一个广泛的首选项系统）就需要真正地好好工作了。

但如果你一直在想学一种新的语言，这可能是一个完美的自我学习实用工程。创建一个文本编辑器，如你所见，它在代码方面并不会是压倒你的最后一根稻草，它在一定范围是可控制的。如果你经常使用文本编辑器，那么编写你自己的文本编辑器可能会使你满意和快乐。因此打开你最喜欢的文本编辑器（你编写的那一个），开始添加功能！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/write-your-own-text-editor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/12/learn-java
[3]: https://opensource.com/article/20/12/netbeans
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+component
[5]: https://opensource.com/sites/default/files/uploads/this-time-its-personal-31_days_yourself-opensource.png (White text editor box with single drop down menu with options File, New, Open, Save, and Quit)
[6]: https://opensource.com/article/17/7/how-unzip-targz-file
[7]: https://opensource.com/article/18/1/how-install-apps-linux
