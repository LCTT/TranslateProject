[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Remember Unity8 from Ubuntu? UBports is Renaming it to Lomiri)
[#]: via: (https://itsfoss.com/unity8-lomiri/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Remember Unity8 from Ubuntu? UBports is Renaming it to Lomiri
======

Ever since Ubuntu abandoned the Unity project, UBports continued the maintenance and development of Unity. On February 27th 2020, [UBports][1] announced that they are giving Unity8 a new branding in the form of Lomiri.

### Unity8 is now Lomiri

![Unity8 in action | Image Credit: UBports][2]

[UBports announced][3] that the Unity8 desktop environment would be renamed as Lomiri. They gave three reasons for this fairly drastic announcement.

First, they want to avoid confusion with the [Unity game engine][4]. Quite a few people confused the two. UBports noted that they are frequently receiving questions regarding “how to import 3D models and meshes into our shell”. When you search “Unity” in your favorite search engine, most of the top links are for the game engine.

The second reason for the name change has to do with the new effort to package Unity8 for Debian. Unfortunately, many of the Unity8’s dependencies have Ubuntu in the name, for example, _**ubuntu-ui-toolkit**_. Debian packagers warned that packages that have Ubuntu in the name may not be accepted into [Debian][5].

Finally, UBports said the name change would improve verbal communications. Saying Unity8 repeatedly can be a mouthful. People would not have to worry about confusing “users of Ubuntu Unity and Unity (the game engine)”.

UBports went on to stress that the name change was not “triggered by any action from Canonical or the Ubuntu community, legal or otherwise”.

They noted that this name change was the perfect time for them to switch to [GitHub alternative GitLab][6] for their development.

Interestingly, the announcement did not explain how they picked Lomiri as the new name. All they said is that “We went through many different names before settling on Lomiri. All of them had problems with pronunciation, availability, or other related issues.”

UBports noted that most Ubuntu Touch users would be unaffected by the name change. Developers and power users might notice some changes, but UBports “will strive to maintain backwards compatibility within Ubuntu Touch for the foreseeable future”.

### What Exactly is Being Renamed?

![][7]

According to the announcement, packages that have either Ubuntu or Unity in the title will be affected. For example,

  * **unity8**, containing the shell, will become **lomiri**
  * **ubuntu-ui-toolkit** will become **lomiri-ui-toolkit**
  * **ubuntu-download-manager** will become **lomiri-download-manager**



On top of this, interfaces call will change, as well. “For example, the **Ubuntu.Components** QML import will change to **Lomiri.Components**.” For the sake of backwards compatibility, Ubuntu Touch images will not change too much. “Developers will only need to update to the new API when they’d like to package their apps for other distributions.”

### What Will Stay the Same?

Since renaming packages can cause quite a few cascading problems, UBports wants to limit the number of packages they change. They don’t expect the following things to change.

  * Packages that don’t use the “Ubuntu” or “Unity” names
  * Ubuntu Touch will remain the same
  * Any components which are already used by other projects and accepted into other distributions



### Final Thoughts

![][8]

Overall, I think this change will be good for Ubuntu Touch in the long run. I understand why [Canonical][9] picked the Unity name for their convergence desktop, but I think the desktop environment was overshadowed by the game engine from the beginning. This will give them room to breathe and also free up valuable coding time. The less time spent replying to questions about 3D models the more time that can be spent creating a convergent desktop.

If you have any further questions or concerns about the name change, you visit the [UBports forms][10]. They have set up a thread specifically for this topic.

Don’t hesitate to share our views on it in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/unity8-lomiri/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://ubports.com/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/unity8_ubports.png?ssl=1
[3]: https://ubports.com/blog/ubports-blog-1/post/lomiri-new-name-same-great-unity8-265
[4]: https://en.wikipedia.org/wiki/Unity_(game_engine)
[5]: https://www.debian.org/
[6]: https://itsfoss.com/github-alternatives/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/Unity8-lomiri.png?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/ubports.jpeg?ssl=1
[9]: https://canonical.com/
[10]: https://forums.ubports.com/topic/3874/unity8-is-now-lomiri
