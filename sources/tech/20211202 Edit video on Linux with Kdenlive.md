[#]: subject: "Edit video on Linux with Kdenlive"
[#]: via: "https://opensource.com/article/21/12/kdenlive-linux-creative-app"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "yjacks"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
在 Linux 上用 Kdenlive 编辑视频
======

尝试用这个 KDE 程序做专业的视频编辑。
![An old-fashioned video camera][1]

无论是雪日、季节性假期，或是任何假期、十二月，都是在你电脑前专心获取创意的好时候。我最喜欢的一种消遣就是剪视频。有时，我为了讲个故事来剪；其他时候，我则是为了表达我的心情、观点、为有启发性或沉着的音乐提供视频。也许这是因为我在学校就为了这一领域的职业学习了剪视频，或就只是因为我喜欢强力的开源工具。至今，我最喜欢的视频剪辑程序是优秀的 Kdenlive，一个提供了直观工作流、足够多的特效和转场的、健壮而专业的剪辑工具。

### 在 Linux 上安装 Kdenlive

Kdenlive 在大部分的 Linux 发行版包管可用。在 Fedora、Mageia 或类似的发行版：

```
`$ sudo dnf install kdenlive`
```

在 Elementary、Mine 或其他基于 Debian 的发行版：

```
`$ sudo apt install kdenlive`
```

不过，我用 [Flatpak][2] 来安装 Kdenlive。

### 如何籍视频讲故事

无论如何，“编辑”视频意味着什么？

视频剪辑有些夸张的误解。当然，这是放个大卫星，在世界范围影响数百万的方法：但是，当你在你的笔记本前坐下时，你不会往那方面想。剪辑视频就是一个十分简单的，移除”坏的“部分，并用好的部分替换的工作。

什么使镜头变坏或变好，完全取决于你自己的品味，甚至可能根据你想用你的创作 "说 "的内容而改变。如果你在剪你在后院发现的野生动物的镜头，你可能会剪掉那些突出你的垃圾桶或你踩着耙子的镜头。剩下的部分肯定会使你的后院看起来像一个神奇的秘密花园，里面有蜂鸟、蝴蝶、好奇的兔子和一只俏皮的狗。另一方面，留下这些 "坏 "的镜头，你就可以创造一部喜剧，讲述一个郊区人在清理垃圾时，踩到了耙子上，把所有的动物都吓跑了，总之是在捣乱。这没有对错之分。无论你切掉什么，没有人知道曾经存在过。无论你保留什么，都会有一个故事。

### 导入镜头

当你启动 Kdenlive，你会有个空项目。Kdenlive 窗口包括在左上角 **Project Bin**，一个在中间的信息框，以及一个在右上的 **Project Monitor**。在下面的是十分重要的部分——**Timeline**。**Timeline** 是你故事开始创建的地方。在你的项目结束时，**timeline** 中的所有内容都是你的观众所看到的。这就是你的视频。

在你开始在你的时间轴上构建故事前，你需要一些镜头。我猜你已经从相机或手机上获得了一些镜头，你必须在 **Project Bin** 中增加切片。右键 **Project Bin** 面板的空位置，然后选择 **Add Clip or Folder**。

![Adding clips in Kdenlive][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

### Cutting footage

In Kdenlive, there are lots of ways to make cuts in video footage.

#### The three-point edit

Historically, the official way to make a cut is to perform a "three-point edit." Count the points:

1\. Open a video clip in Kdenlive's **Clip Monitor** panel, find the point where you wish the video had started, and press **I** on your keyboard to mark _in_.
2\. Then find the point where you wish the video had stopped and press **O** to mark _out_.
3\. Drag the video clip from the **Clip Monitor** to a point in the **Timeline** at the bottom of the Kdenlive window.

![A three-point edit in progress][5]

(Seth Kenlon, [CC BY-SA 4.0][4])

This method is still important in some settings, but it's a little formal for many users.

#### Inline edits

Another way to make an edit is to drag a clip into Kdenlive's **Timeline** panel and then click and drag the edges of the clip until only the good part remains.

![Editing in the timeline][6]

(Seth Kenlon, [CC BY-SA 4.0][4])

### The art of the cut-away

Another kind of edit is the _cut-away_. It's an important trick because it not only helps you skip over bad parts of a video clip, but it can add a lot of context for your audience. You've seen lots of cut-aways in movies and on TV, even if you don't realize it.  Every time someone on the screen looks up in surprise, and then you see a shot of what they see, that is a cut-away. When a newscaster references a place in your city, and a shot of that place follows it, that is a cut-away.

You can do cut-aways in Kdenlive easily because the Kdenlive **Timeline** is layered. There are four "tracks" in the Kdenlive timeline by default—the top two for video and the bottom two for any accompanying audio. When you place video footage on the timeline, the footage on the highest video track takes precedence over footage on a lower track. This means that you can functionally edit out footage on one video track just by placing something better on the track above it.

![A cut-away][7]

(Seth Kenlon, [CC BY-SA 4.0][4])

### Export your movie

When done with all of your edits, you can export your movie so you can post it online for others to see. To do that, click the **Render** button in the toolbar at the top of the Kdenlive window. In the **Rendering** window that appears, select the format compatible with your video hosting service. The WEBM format is pretty universal these days, and in addition to being open source it's also one of the best formats available both for distribution and archival purposes. It's capable of 4K, stereoscopic imagery, a wide color gamut, and much more, and all major browsers play it.

Rendering can take time, depending on how long your project is, how many edits you've made, and how powerful your computer is.

### A long-lasting solution

As I write this, it was exactly ten years ago today that I published an [introductory six-part series on Kdenlive][8] here on Opensource.com. To my own surprise, that means I've been a Kdenlive user now longer than I'd been a user of the proprietary editors I learned in film school. That's some impressive longevity, and I still use it today because it delivers on flexibility and reliability as no other editor does. Heck, the video editor I learned on doesn't even exist, at least not in the same form, anymore (which makes me wish I'd learned to edit on an open source platform!).

Kdenlive is a powerful editor with lots of features, but don't let that intimidate you. My introductory series is as relevant and accurate today as it was ten years ago, which in my estimation, is a characteristic of a truly reliable application. Should you choose to explore Kdenlive as an editor, be sure to download our **[cheat sheet][9]**, so you can internalize keyboard shortcuts that reduce clicks and make the editing process seamless.

Now go tell your story!

GNU/Linux has infamously been wanting for a good, solid, professional-level free video editor for...

In the previous article in this series, we reviewed the different methods of importing footage into...

It is expected that even a modest video editor will feature a set of basic video transitions. The...

Good photography doesn't just happen. Careful attention to lens settings, depth-of-field charts,...

Traditionally, the film editing process was regimented and compartmentalized. The assistant editors...

Post-production is a long and involved process. As these articles have demonstrated, Kdenlive is...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/kdenlive-linux-creative-app

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://opensource.com/sites/default/files/uploads/project-bin.jpg (Adding clips in Kdenlive)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/3-point-edit.jpg (A three-point edit in progress)
[6]: https://opensource.com/sites/default/files/uploads/edit.jpg (Editing in the timeline)
[7]: https://opensource.com/sites/default/files/uploads/cut-away.jpg (A cut-away)
[8]: https://opensource.com/life/11/11/introduction-kdenlive
[9]: https://opensource.com/downloads/kdenlive-cheat-sheet
