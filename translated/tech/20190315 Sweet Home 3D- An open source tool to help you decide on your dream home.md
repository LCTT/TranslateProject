[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sweet Home 3D: An open source tool to help you decide on your dream home)
[#]: via: (https://opensource.com/article/19/3/tool-find-home)
[#]: author: (Jeff Macharyas (Community Moderator) )

Sweet Home 3D：一个帮助你决定梦想家庭的开源工具
======

室内设计应用可以轻松渲染你喜欢的房子，不管是真实的或是想象的。

![Houses in a row][1]

我最近接受了一份在弗吉尼亚州的新工作。由于我妻子一直在纽约工作，看着我们在纽约的房子直至出售，我有责任出去为我们和我们的猫找一所新房子。在我们搬进去之前她不会看到的房子！

我和一个房地产经纪人签约，并看了几间房子，拍了许多照片，写下了潦草的笔记。晚上，我会将照片上传到 Google Drive 文件夹中，我和我老婆会通过手机同时查看这些照片，同时我还想记住房间是在右边还是左边，是否有风扇等。

由于这是一个相当繁琐且不太准确的方式来展示我的发现，我因此去寻找一个开源解决方案，以更好地展示我们未来的梦想之家将会是什么样的，而不会取决于我的模糊记忆和模糊的照片。

[Sweet Home 3D][2] 完全满足了我的要求。Sweet Home 3D 可在 Sourceforge 上获取，并在 GNU 通用公共许可证下发布。它的[网站][3]信息非常丰富，我能够立即启动并运行。Sweet Home 3D 由总部位于巴黎的 eTeks 的 Emmanuel Puybaret 开发。

### 绘制内墙

我将 Sweet Home 3D 下载到我的 MacBook Pro 上，并添加了 PNG 版本的平面楼层图，用作背景底图。

在此处，使用 Rooms 面板跟踪图案并设置“真实房间”尺寸是一件简单的事情。在我绘制房间后，我添加了墙壁，我可以定制颜色、厚度、高度等。

![Sweet Home 3D floorplan][5]

现在我画完了“内墙”，我从网站下载了各种“家具”，其中包括实际的家具以及门、窗、架子等。每个项目都以 ZIP 文件的形式下载，因此我创建了一个包含所有未压缩文件的文件夹。我可以自定义每件家具和重复的物品比如门，可以方便地复制粘贴到指定的地方。

在我将所有墙壁和门窗都布置完后，我就使用应用的 3D 视图浏览房屋。根据照片和记忆，我对所有物体进行了调整直到接近房屋的样子。我可以花更多时间添加纹理，附属家具和物品，但这已经达到了我需要的程度。

![Sweet Home 3D floorplan][7]

完成之后，我将计划导出为 OBJ 文件，它可在各种程序中打开，例如 [Blender][8] 和 Mac 上的 Preview，方便旋转房屋并从各个角度查看。视频功能最有用，我可以创建一个起点，然后在房子中绘制一条路径，并记录“旅程”。我将视频导出为 MOV 文件，并使用 QuickTime 在 Mac 上打开和查看。

我的妻子能够（几乎）所有我看到的，我们甚至可以开始在搬家前布置家具。现在，我所要做的就是装上卡车搬到新家。

Sweet Home 3D 在我的新工作中也是有用的。我正在寻找一种方法来改善学院建筑的地图，并计划在 [Inkscape][9] 或 Illustrator 或其他软件中重新绘制它。但是，由于我有平面地图，我可以使用 Sweet Home 3D 创建平面图的 3D 版本并将其上传到我们的网站以便更方便地找到地方。

### 开源犯罪现场？

一件有趣的事：根据 [Sweet Home 3D 的博客][10]，“法国法医办公室（科学警察）最近选择 Sweet Home 3D 作为设计计划表示路线和犯罪现场的工具。这是法国政府建议优先考虑免费开源解决方案的具体应用。“

这是公民和政府如何利用开源解决方案创建个人项目、解决犯罪和建立世界的又一点证据。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/tool-find-home

作者：[Jeff Macharyas (Community Moderator)][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://sourceforge.net/projects/sweethome3d/
[3]: http://www.sweethome3d.com/
[4]: /file/426441
[5]: https://opensource.com/sites/default/files/uploads/virginia-house-create-screenshot.png (Sweet Home 3D floorplan)
[6]: /file/426451
[7]: https://opensource.com/sites/default/files/uploads/virginia-house-3d-screenshot.png (Sweet Home 3D floorplan)
[8]: https://opensource.com/article/18/5/blender-hotkey-cheat-sheet
[9]: https://opensource.com/article/19/1/inkscape-cheat-sheet
[10]: http://www.sweethome3d.com/blog/2018/12/10/customization_for_the_forensic_police.html
