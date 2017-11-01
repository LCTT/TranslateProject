每个安卓开发初学者应该了解的 12 个技巧
====

> 一次掌握一个技巧，更好地学习安卓

![](https://cdn-images-1.medium.com/max/800/1*RwCbsNdykQYr6vDa6aCGKQ.jpeg)

距离安迪·鲁宾和他的团队着手开发一个希望颠覆传统手机操作模式的操作系统已经过去 12 年了，这套系统有可能让手机或者智能机给消费者以及软件开发人员带来全新的体验。之前的智能机仅限于收发短信和查看电子邮件（当然还可以打电话），给用户和开发者带来很大的限制。

安卓，作为打破这个枷锁的系统，拥有非常优秀的框架设计，给大家提供的不仅仅是一组有限的功能，更多的是自由的探索。有人会说 iPhone 才是手机产业的颠覆产品，不过我们说的不是 iPhone 有多么酷（或者多么贵，是吧？），它还是有限制的，而这是我们从来都不希望有的。

不过，就像本大叔说的，能力越大责任越大，我们也需要更加认真对待安卓应用的设计方式。我看到很多教程都忽略了向初学者传递这个理念，在动手之前请先充分理解系统架构。他们只是把一堆的概念和代码丢给读者，却没有解释清楚相关的优缺点，它们对系统的影响，以及该用什么不该用什么等等。

在这篇文章里，我们将介绍一些初学者以及中级开发人员都应该掌握的技巧，以帮助更好地理解安卓框架。后续我们还会在这个系列里写更多这样的关于实用技巧的文章。我们开始吧。

### 1、 `@+id` 和 `@id` 的区别

要在 Java 代码里访问一个图形控件（或组件），或者是要让它成为其他控件的依赖，我们需要一个唯一的值来引用它。这个唯一值用 `android:id` 属性来定义，本质上就是把用户提供的 id 附加到 `@+id/` 后面，写入到 _id 资源文件_，供其他控件使用。一个 Toolbar 的 id 可以这样定义，

```
android:id="@+id/toolbar"
```

然后这个 id 值就能被 `findViewById(…)` 识别，这个函数会在资源文件里查找 id，或者直接从 R.id 路径引用，然后返回所查找的  View 的类型。

而另一种，`@id`，和 `findViewById(…)` 行为一样 - 也会根据提供的 id 查找组件，不过仅限于布局时使用。一般用来布置相关控件。

```
android:layout_below="@id/toolbar"
```

### 2、 使用 `@string` 资源为 XML 提供字符串

简单来说，就是不要在 XML 里直接用字符串。原因很简单。当我们在 XML 里直接使用了字符串，我们一般会在其它地方再次用到同样的字符串。想像一下当我们需要在不同的地方调整同一个字符串的噩梦，而如果使用字符串资源就只改一个地方就够了。另一个好处是，使用资源文件可以提供多国语言支持，因为可以为不同的语言创建相应的字符串资源文件。

```
android:text="My Awesome Application"
```

当你直接使用字符串时，你会在 Android Studio 里收到警告，提示说应该把写死的字符串改成字符串资源。可以点击这个提示，然后按下 `ALT + ENTER` 打开字符串编辑。你也可以直接打开 `res` 目录下的 `values` 目录里的 `strings.xml` 文件，然后像下面这样声明一个字符串资源。

```
<string name="app_name">My Awesome Application</string>
```

然后用它来替换写死的字符串，

```
android:text="@string/app_name"
```

### 3、 使用 `@android` 和 `?attr` 常量

尽量使用系统预先定义的常量而不是重新声明。举个例子，在布局中有几个地方要用白色或者 #ffffff 颜色值。不要每次都直接用 #ffffff 数值，也不要自己为白色重新声明资源，我们可以直接用这个，

```
@android:color/white
```

安卓预先定义了很多常用的颜色常量，比如白色，黑色或粉色。最经典的应用场景是透明色：

```
@android:color/transparent
```

另一个引用常量的方式是 `?attr`，用来将预先定义的属性值赋值给不同的属性。举个自定义 Toolbar 的例子。这个 Toolbar 需要定义宽度和高度。宽度通常可以设置为 `MATCH_PARENT`，但高度呢？我们大多数人都没有注意设计指导，只是简单地随便设置一个看上去差不多的值。这样做不对。不应该随便自定义高度，而应该这样做，

```
android:layout_height="?attr/actionBarSize"
```

`?attr` 的另一个应用是点击视图时画水波纹效果。`SelectableItemBackground` 是一个预定义的 drawable，任何视图需要增加波纹效果时可以将它设为背景：

```
android:background="?attr/selectableItemBackground"
```

也可以用这个：

```
android:background="?attr/selectableItemBackgroundBorderless"
```

来显示无边框波纹。

### 4、 SP 和 DP 的区别

虽然这两个没有本质上的区别，但知道它们是什么以及在什么地方适合用哪个很重要。

SP 的意思是缩放无关像素，一般建议用于 TextView，首先文字不会因为显示密度不同而显示效果不一样，另外 TextView 的内容还需要根据用户设定做拉伸，或者只调整字体大小。

其他需要定义尺寸和位置的地方，可以使用 DP，也就是密度无关像素。之前说过，DP 和 SP 的性质是一样的，只是 DP 会根据显示密度自动拉伸，因为安卓系统会动态计算实际显示的像素，这样就可以让使用 DP 的组件在不同显示密度的设备上都可以拥有相同的显示效果。

### 5、 Drawable 和 Mipmap 的应用

这两个最让人困惑的是 - drawable 和 mipmap 有多少差异？

虽然这两个好像有同样的用途，但它们设计目的不一样。mipmap 是用来储存图标的，而 drawable 用于任何其他格式。我们可以看一下系统内部是如何使用它们的，就知道为什么不能混用了。

你可以看到你的应用里有几个 mipmap 和 drawable 目录，每一个分别代表不同的显示分辨率。当系统从 drawable 目录读取资源时，只会根据当前设备的显示密度选择确定的目录。然而，在读取 mipmap 时，系统会根据需要选择合适的目录，而不仅限于当前显示密度，主要是因为有些启动器会故意显示较大的图标，所以系统会使用较大分辨率的资源。

总之，用 mipmap 来存放图标或标记图片，可以在不同显示密度的设备上看到分辨率变化，而其它根据需要显示的图片资源都用 drawable。

比如说，Nexus 5 的显示分辨率是 xxhdpi。当我们把图标放到 `mipmap` 目录里时，所有 `mipmap` 目录都将读入内存。而如果放到 drawable 里，只有 `drawable-xxhdpi` 目录会被读取，其他目录都会被忽略。

### 6、 使用矢量图形

为了支持不同显示密度的屏幕，将同一个资源的多个版本（大小）添加到项目里是一个很常见的技巧。这种方式确实有用，不过它也会带来一定的性能开支，比如更大的 apk 文件以及额外的开发工作。为了消除这种影响，谷歌的安卓团队发布了新增的矢量图形。

矢量图形是用 XML 描述的 SVG（可拉伸矢量图形），是用点、直线和曲线组合以及填充颜色绘制出的图形。正因为矢量图形是由点和线动态画出来的，在不同显示密度下拉伸也不会损失分辨率。而矢量图形带来的另一个好处是更容易做动画。往一个 AnimatedVectorDrawable 文件里添加多个矢量图形就可以做出动画，而不用添加多张图片然后再分别处理。

```
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp" 
    android:height="24dp" 
    android:viewportWidth="24.0" 
    android:viewportHeight="24.0">

    <path android:fillColor="#69cdff" android:pathData="M3,18h18v-2L3,16v2zM3,13h18v-2L3,11v2zM3,6v2h18L21,6L3,6z"/>

</vector>
```

上面的向量定义可以画出下面的图形，

![](https://cdn-images-1.medium.com/max/600/1*KGmMIhrQR0UyrpIP_niEZw.png)

要在你的安卓项目里添加矢量图形，可以右键点击你项目里的应用模块，然后选择 New >> Vector Assets。然后会打开 Assets Studio，你可以有两种方式添加矢量图形。第一种是从 Material 图标里选择，另一种是选择本地的 SVG 或 PSD 文件。

谷歌建议与应用相关都使用 Material 图标，来保持安卓的连贯性和统一体验。[这里][1]有全部图标，记得看一下。

### 7、 设定边界的开始和结束

这是人们最容易忽略的地方之一。边界！增加边界当然很简单，但是如果要考虑支持很旧的平台呢？

边界的“开始”和“结束”分别是“左”和“右”的超集，所以如果应用的 `minSdkVersion` 是 17 或更低，边界和填充的“开始”和“结束”定义是旧的“左”/“右”所需要的。在那些没有定义“开始”和“结束”的系统上，这两个定义可以被安全地忽略。可以像下面这样声明：

```
android:layout_marginEnd="20dp"
android:paddingStart="20dp"
```

### 8、 使用 Getter/Setter 生成工具

在创建一个容器类（只是用来简单的存放一些变量数据）时很烦的一件事情是写多个 getter 和 setter，复制/粘贴该方法的主体再为每个变量重命名。

幸运的是，Android Studio 有一个解决方法。可以这样做，在类里声明你需要的所有变量，然后打开 Toolbar >> Code。快捷方式是 `ALT + Insert`。点击 Code 会显示 Generate，点击它会出来很多选项，里面有 Getter 和 Setter 选项。在保持焦点在你的类页面然后点击，就会为当前类添加所有的 getter 和 setter（有需要的话可以再去之前的窗口操作）。很爽吧。

### 9、 使用 Override/Implement 生成工具

这是另一个很好用的生成工具。自定义一个类然后再扩展很容易，但是如果要扩展你不熟悉的类呢。比如说 PagerAdapter，你希望用 ViewPager 来展示一些页面，那就需要定制一个 PagerAdapter 并实现它的重载方法。但是具体有哪些方法呢？Android Studio 非常贴心地为自定义类强行添加了一个构造函数，或者可以用快捷键（`ALT + Enter`），但是父类 PagerAdapter 里的其他（虚拟）方法需要自己手动添加，我估计大多数人都觉得烦。

要列出所有可以重载的方法，可以点击 Code >> Generate and Override methods 或者 Implement methods，根据你的需要。你还可以为你的类选择多个方法，只要按住 Ctrl 再选择方法，然后点击 OK。

### 10、 正确理解 Context

Context 有点恐怖，我估计许多初学者从没有认真理解过 Context 类的结构 -  它是什么，为什么到处都要用到它。

简单地说，它将你能从屏幕上看到的所有内容都整合在一起。所有的视图（或者它们的扩展）都通过 Context 绑定到当前的环境。Context 用来管理应用层次的资源，比如说显示密度，或者当前的关联活动。活动、服务和应用都实现了 Context 类的接口来为其他关联组件提供内部资源。举个添加到 MainActivity 的 TextView 的例子。你应该注意到了，在创建一个对象的时候，TextView 的构造函数需要 Context 参数。这是为了获取 TextView 里定义到的资源。比如说，TextView 需要在内部用到 Roboto 字体。这样的话，TextView 需要 Context。而且在我们将 Context（或者 `this`）传递给 TextView 的时候，也就是告诉它绑定当前活动的生命周期。

另一个 Context 的关键应用是初始化应用层次的操作，比如初始化一个库。库的生命周期和应用是不相关的，所以它需要用 `getApplicationContext()` 来初始化，而不是用 `getContext` 或 `this` 或 `getActivity()`。掌握正确使用不同 Context 类型非常重要，可以避免内存泄漏。另外，要用到 Context 来启动一个活动或服务。还记得 `startActivity(…)` 吗？当你需要在一个非活动类里切换活动时，你需要一个 Context 对象来调用 `startActivity` 方法，因为它是 Context 类的方法，而不是 Activity 类。

```
getContext().startActivity(getContext(), SecondActivity.class);
```

如果你想了解更多 Context 的行为，可以看看[这里][2]或[这里][3]。第一个是一篇关于 Context 的很好的文章，介绍了在哪些地方要用到它。而另一个是安卓关于 Context 的文档，全面介绍了所有的功能 - 方法，静态标识以及更多。

### 奖励 #1: 格式化代码

有人会不喜欢整齐，统一格式的代码吗？好吧，几乎我们每一个人，在写一个超过 1000 行的类的时候，都希望我们的代码能有合适的结构。而且，并不仅仅大的类才需要格式化，每一个小模块类也需要让代码保持可读性。

使用 Android Studio，或者任何 JetBrains IDE，你都不需要自己手动整理你的代码，像增加缩进或者 = 之前的空格。就按自己希望的方式写代码，在想要格式化的时候，如果是 Windows 系统可以按下 `ALT + CTRL + L`，Linux 系统按下 `ALT + CTRL + SHIFT + L`。*代码就自动格式化好了*

### 奖励 #2: 使用库

面向对象编程的一个重要原则是增加代码的可重用性，或者说减少重新发明轮子的习惯。很多初学者错误地遵循了这个原则。这条路有两个方向，

- 不用任何库，自己写所有的代码。
- 用库来处理所有事情。

不管哪个方向走到底都是不对的。如果你彻底选择第一个方向，你将消耗大量的资源，仅仅是为了满足自己拥有一切的骄傲。很可能你的代码没有做过替代库那么多的测试，从而增加模块出问题的可能。如果资源有限，不要重复发明轮子。直接用经过测试的库，在有了明确目标以及充分的资源后，可以用自己的可靠代码来替换这个库。

而彻底走向另一个方向，问题更严重 - 别人代码的可靠性。不要习惯于所有事情都依赖于别人的代码。在不用太多资源或者自己能掌控的情况下尽量自己写代码。你不需要用库来自定义一个 TypeFaces（字体），你可以自己写一个。

所以要记住，在这两个极端中间平衡一下 - 不要重新创造所有事情，也不要过分依赖外部代码。保持中立，根据自己的能力写代码。

这篇文章最早发布在 [What’s That Lambda][4] 上。请访问网站阅读更多关于 Android、Node.js、Angular.js 等等类似文章。

--------------------------------------------------------------------------------

via: https://android.jlelse.eu/12-practices-every-android-beginner-should-know-cd43c3710027

作者：[Nilesh Singh][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://android.jlelse.eu/@nileshsingh?source=post_header_lockup
[1]:https://material.io/icons/
[2]:https://blog.mindorks.com/understanding-context-in-android-application-330913e32514
[3]:https://developer.android.com/reference/android/content/Context.html
[4]:https://www.whatsthatlambda.com/android/android-dev-101-things-every-beginner-must-know
