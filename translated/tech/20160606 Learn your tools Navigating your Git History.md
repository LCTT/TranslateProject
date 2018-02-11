学习你的工具：驾驭你的 Git 历史
============================================================

在你的日常工作中，不可能每天都从头开始去开发一个新的应用程序。而真实的情况是，在日常工作中，我们大多数时候所面对的都是遗留下来的一个代码库，我们能够去修改一些特性的内容或者现存的一些代码行，是我们在日常工作中很重要的一部分。而这也就是分布式版本控制系统 `git` 的价值所在。现在，我们来深入了解怎么去使用 `git` 的历史以及如何很轻松地去浏览它的历史。

### Git 历史

首先和最重要的事是，什么是 `git` 历史？正如其名字一样，它是一个 `git` 仓库的提交历史。它包含一堆提交信息，其中有它们的作者的名字、提交的哈希值以及提交日期。查看一个 `git` 仓库历史的方法很简单，就是一个 `git log` 命令。

> _*旁注：**为便于本文的演示，我们使用 Ruby 在 Rails 仓库的 `master` 分支。之所以选择它的理由是因为，Rails 有很好的 `git` 历史，有很好的提交信息、引用以及每个变更的解释。如果考虑到代码库的大小、维护者的年龄和数据，Rails 肯定是我见过的最好的仓库。当然了，我并不是说其它 `git` 仓库做的不好，它只是我见过的比较好的一个仓库。_

因此，回到 Rails 仓库。如果你在 Ralis 仓库上运行 `git log`。你将看到如下所示的输出：

```
commit 66ebbc4952f6cfb37d719f63036441ef98149418
Author: Arthur Neves <foo@bar.com>
Date:   Fri Jun 3 17:17:38 2016 -0400

	Dont re-define class SQLite3Adapter on test
    
    We were declaring  in a few tests, which depending of    the order load will cause an error, as the super class could change.
    
	see https://github.com/rails/rails/commit/ac1c4e141b20c1067af2c2703db6e1b463b985da#commitcomment-17731383

commit 755f6bf3d3d568bc0af2c636be2f6df16c651eb1
Merge: 4e85538 f7b850e
Author: Eileen M. Uchitelle <foo@bar.com>
Date:   Fri Jun 3 10:21:49 2016 -0400
    
    Merge pull request #25263 from abhishekjain16/doc_accessor_thread
    
    [skip ci] Fix grammar
    
commit f7b850ec9f6036802339e965c8ce74494f731b4a
Author: Abhishek Jain <foo@bar.com>
Date:   Fri Jun 3 16:49:21 2016 +0530
    
	[skip ci] Fix grammar
    
commit 4e85538dddf47877cacc65cea6c050e349af0405
Merge: 082a515 cf2158c
Author: Vijay Dev <foo@bar.com>
Date:   Fri Jun 3 14:00:47 2016 +0000
    
    Merge branch 'master' of github.com:rails/docrails

	Conflicts:
    	guides/source/action_cable_overview.md
    
commit 082a5158251c6578714132e5c4f71bd39f462d71
Merge: 4bd11d4 3bd30d9
Author: Yves Senn <foo@bar.com>
Date:   Fri Jun 3 11:30:19 2016 +0200
    
    Merge pull request #25243 from sukesan1984/add_i18n_validation_test

	Add i18n_validation_test
    
commit 4bd11d46de892676830bca51d3040f29200abbfa
Merge: 99d8d45 e98caf8
Author: Arthur Nogueira Neves <foo@bar.com>
Date:   Thu Jun 2 22:55:52 2016 -0400

	Merge pull request #25258 from alexcameron89/master

	[skip ci] Make header bullets consistent in engines.md
    
commit e98caf81fef54746126d31076c6d346c48ae8e1b
Author: Alex Kitchens <foo@bar.com>
Date:   Thu Jun 2 21:26:53 2016 -0500

	[skip ci] Make header bullets consistent in engines.md
```

正如你所见，`git log` 展示了提交哈希、作者和他的 email 以及提交日期。当然，`git` 输出的可定制性很强大，它允许你去定制 `git log` 命令的输出格式。比如说，我们希望看到提交的信息显示在一行上，我们可以运行 `git log --oneline`，它将输出一个更紧凑的日志：

```
66ebbc4 Dont re-define class SQLite3Adapter on test
755f6bf Merge pull request #25263 from abhishekjain16/doc_accessor_thread
f7b850e [skip ci] Fix grammar4e85538 Merge branch 'master' of github.com:rails/docrails
082a515 Merge pull request #25243 from sukesan1984/add_i18n_validation_test
4bd11d4 Merge pull request #25258 from alexcameron89/master
e98caf8 [skip ci] Make header bullets consistent in engines.md
99d8d45 Merge pull request #25254 from kamipo/fix_debug_helper_test
818397c Merge pull request #25240 from matthewd/reloadable-channels
2c5a8ba Don't blank pad day of the month when formatting dates
14ff8e7 Fix debug helper test
```

如果你想看 `git log` 的全部选项，我建议你去查阅 `git log` 的 man 页面，你可以在一个终端中输入 `man git-log` 或者 `git help log` 来获得。

> _**小提示：**如果你觉得 `git log` 看起来太恐怖或者过于复杂，或者你觉得看它太无聊了，我建议你去寻找一些 `git` GUI 命令行工具。在以前的文章中，我使用过 [GitX][1] ，我觉得它很不错，但是，由于我看命令行更“亲切”一些，在我尝试了 [tig][2] 之后，就再也没有去用过它。_

### 查找尼莫

现在，我们已经知道了关于 `git log` 命令一些很基础的知识之后，我们来看一下，在我们的日常工作中如何使用它更加高效地浏览历史。

假如，我们怀疑在 `String#classify` 方法中有一个预期之外的行为，我们希望能够找出原因，并且定位出实现它的代码行。

为达到上述目的，你可以使用的第一个命令是 `git grep`，通过它可以找到这个方法定义在什么地方。简单来说，这个命令输出了给定的某些“样品”的匹配行。现在，我们来找出定义它的方法，它非常简单 —— 我们对  `def classify` 运行 grep，然后看到的输出如下：

```
➜  git grep 'def classify'

activesupport/lib/active_support/core_ext/string/inflections.rb:	def classifyactivesupport/lib/active_support/inflector/methods.rb:    def classify(table_name)tools/profile:    def classify
```

现在，虽然我们已经看到这个方法是在哪里创建的，但是，并不能够确定它是哪一行。如果，我们在 `git grep` 命令上增加 `-n` 标志，`git` 将提供匹配的行号：

```
➜  git grep -n 'def classify'

activesupport/lib/active_support/core_ext/string/inflections.rb:205:  def classifyactivesupport/lib/active_support/inflector/methods.rb:186:    def classify(table_name)tools/profile:112:    def classify
```

更好看了，是吧？考虑到上下文，我们可以很轻松地找到，这个方法在`activesupport/lib/active_support/core_ext/string/inflections.rb` 的第 205 行的 `classify` 方法，它看起来像这样，是不是很容易？

```
# Creates a class name from a plural table name like Rails does for table names to models.
# Note that this returns a string and not a class. (To convert to an actual class
# follow +classify+ with +constantize+.)
#
#	'ham_and_eggs'.classify # => "HamAndEgg"
#   'posts'.classify        # => "Post"
	def classify
		ActiveSupport::Inflector.classify(self)
	end
```

尽管这个方法我们找到的是在 `String` 上的一个常见的调用，它涉及到`ActiveSupport::Inflector` 上的另一个方法，使用了相同的名字。获得了 `git grep` 的结果，我们可以很轻松地导航到这里，因此，我们看到了结果的第二行， `activesupport/lib/active_support/inflector/methods.rb` 在 186 行上。我们正在寻找的方法是：

```
# Creates a class name from a plural table name like Rails does for table
# names to models. Note that this returns a string and not a Class (To
# convert to an actual class follow +classify+ with constantize).
#
#   classify('ham_and_eggs') # => "HamAndEgg"
#   classify('posts')        # => "Post"
#
# Singular names are not handled correctly:
#
#   classify('calculus')     # => "Calculus"
def classify(table_name)
	# strip out any leading schema name
	camelize(singularize(table_name.to_s.sub(/.*\./, ''.freeze)))
end
```

酷！考虑到 Rails 仓库的大小，我们借助 `git grep` 找到它，用时没有超越 30 秒。

### 那么，最后的变更是什么？

我们已经掌握了有用的方法，现在，我们需要搞清楚这个文件所经历的变更。由于我们已经知道了正确的文件名和行数，我们可以使用 `git blame`。这个命令展示了一个文件中每一行的最后修订者和修订的内容。我们来看一下这个文件最后的修订都做了什么：

```
git blame activesupport/lib/active_support/inflector/methods.rb
```

虽然我们得到了这个文件每一行的最后的变更，但是，我们更感兴趣的是对指定的方法（176 到 189 行）的最后变更。让我们在 `git blame` 命令上增加一个选项，它将只显示那些行。此外，我们将在命令上增加一个 `-s` (阻止) 选项，去跳过那一行变更时的作者名字和修订（提交）的时间戳：

```
git blame -L 176,189 -s activesupport/lib/active_support/inflector/methods.rb

9fe8e19a 176)	#Creates a class name from a plural table name like Rails does for table
5ea3f284 177)	# names to models. Note that this returns a string and not a Class (To
9fe8e19a 178)	# convert to an actual class follow +classify+ with #constantize).
51cd6bb8 179)   #
6d077205 180)   #   classify('ham_and_eggs') # => "HamAndEgg"
9fe8e19a 181)   #   classify('posts')        # => "Post"
51cd6bb8 182)   #
51cd6bb8 183)   # Singular names are not handled correctly:
5ea3f284 184)   #
66d6e7be 185)   #   classify('calculus')     # => "Calculus"
51cd6bb8 186)   def classify(table_name)
51cd6bb8 187)     # strip out any leading schema name
5bb1d4d2 188)     camelize(singularize(table_name.to_s.sub(/.*\./, ''.freeze)))
51cd6bb8 189)     end
```

现在，`git blame` 命令的输出展示了指定行的全部内容以及它们各自的修订。让我们来看一下指定的修订，换句话说就是，每个变更都修订了什么，我们可以使用 `git show` 命令。当指定一个修订哈希（像 `66d6e7be`）作为一个参数时，它将展示这个修订的全部内容。包括作者名字、时间戳以及完整的修订内容。我们来看一下 188 行最后的修订都做了什么？

```
git show 5bb1d4d2
```

你亲自做实验了吗？如果没有做，我直接告诉你结果，这个令人惊叹的 [提交][3] 是由 [Schneems][4] 做的，他通过使用 frozen 字符串做了一个非常有趣的性能优化，这在我们当前的上下文中是非常有意义的。但是，由于我们在这个假设的调试会话中，这样做并不能告诉我们当前问题所在。因此，我们怎么样才能够通过研究来发现，我们选定的方法经过了哪些变更？

### 搜索日志

现在，我们回到 `git` 日志，现在的问题是，怎么能够看到 `classify` 方法经历了哪些修订？

`git log` 命令非常强大，因此它提供了非常多的列表选项。我们尝试去看一下保存了这个文件的 `git` 日志内容。使用 `-p` 选项，它的意思是在 `git` 日志中显示这个文件的完整补丁:

```
git log -p activesupport/lib/active_support/inflector/methods.rb
```

这将给我们展示一个很长的修订列表，显示了对这个文件的每个修订。但是，正如下面所显示的，我们感兴趣的是对指定行的修订。对命令做一个小的修改，只显示我们希望的内容：

```
git log -L 176,189:activesupport/lib/active_support/inflector/methods.rb
```

`git log` 命令接受了 `-L` 选项，它有一个行的范围和文件名做为参数。它的格式可能有点奇怪，格式解释如下：

```
git log -L <start-line>,<end-line>:<path-to-file>
```

当我们去运行这个命令之后，我们可以看到对这些行的一个修订列表，它将带我们找到创建这个方法的第一个修订：

```
commit 51xd6bb829c418c5fbf75de1dfbb177233b1b154
Author: Foo Bar <foo@bar.com>
Date:   Tue Jun 7 19:05:09 2011 -0700

	Refactor
	
diff--git a/activesupport/lib/active_support/inflector/methods.rb b/activesupport/lib/active_support/inflector/methods.rb
--- a/activesupport/lib/active_support/inflector/methods.rb
+++ b/activesupport/lib/active_support/inflector/methods.rb
@@ -58,0 +135,14 @@
+    # Create a class name from a plural table name like Rails does for table names to models.
+    # Note that this returns a string and not a Class. (To convert to an actual class
+    # follow +classify+ with +constantize+.)
+    #
+    # Examples:
+    #   "egg_and_hams".classify # => "EggAndHam"
+    #   "posts".classify        # => "Post"
+    #
+    # Singular names are not handled correctly:
+    #   "business".classify     # => "Busines"
+    def classify(table_name)
+      # strip out any leading schema name
+      camelize(singularize(table_name.to_s.sub(/.*\./, '')))
+    end
```

现在，我们再来看一下 ——  它是在 2011 年提交的。`git` 可以让我们重回到这个时间。这是一个很好的例子，它充分说明了足够的提交信息对于重新了解当时的上下文环境是多么的重要，因为从这个提交信息中，我们并不能获得足够的信息来重新理解当时的创建这个方法的上下文环境，但是，话说回来，你**不应该**对此感到恼怒，因为，你看到的这些项目，它们的作者都是无偿提供他们的工作时间和精力来做开源工作的。（向开源项目贡献者致敬！）

回到我们的正题，我们并不能确认 `classify` 方法最初实现是怎么回事，考虑到这个第一次的提交只是一个重构。现在，如果你认为，“或许、有可能、这个方法不在 176 行到 189 行的范围之内，那么就你应该在这个文件中扩大搜索范围”，这样想是对的。我们看到在它的修订提交的信息中提到了“重构”这个词，它意味着这个方法可能在那个文件中是真实存在的，只是在重构之后它才存在于那个行的范围内。

但是，我们如何去确认这一点呢？不管你信不信，`git` 可以再次帮助你。`git log` 命令有一个 `-S` 选项，它可以传递一个特定的字符串作为参数，然后去查找代码变更（添加或者删除）。也就是说，如果我们执行 `git log -S classify` 这样的命令，我们可以看到所有包含 `classify` 字符串的变更行的提交。

如果你在 Ralis 仓库上运行上述命令，首先你会发现这个命令运行有点慢。但是，你应该会发现 `git` 真的解析了在那个仓库中的所有修订来匹配这个字符串，因为仓库非常大，实际上它的运行速度是非常快的。在你的指尖下 `git` 再次展示了它的强大之处。因此，如果去找关于 `classify` 方法的第一个修订，我们可以运行如下的命令：

```
git log -S 'def classify'
```

它将返回所有这个方法的引用和修改的地方。如果你一直往下看，你将看到日志中它的最后的提交：

```
commit db045dbbf60b53dbe013ef25554fd013baf88134
Author: David Heinemeier Hansson <foo@bar.com>
Date:   Wed Nov 24 01:04:44 2004 +0000
	Initial
    git-svn-id: http://svn-commit.rubyonrails.org/rails/trunk@4 5ecf4fe2-1ee6-0310-87b1-e25e094e27de
```

很酷！是吧？它初次被提交到 Rails，是由 DHHD 在一个 `svn` 仓库上做的！这意味着 `classify` 提交到 Rails 仓库的大概时间。现在，我们去看一下这个提交的所有变更信息，我们运行如下的命令：

```
git show db045dbbf60b53dbe013ef25554fd013baf88134
```

非常好！我们终于找到它的根源了。现在，我们使用 `git log -S 'def classify'` 的输出，结合 `git log -L` 命令来跟踪这个方法都发生了哪些变更。

### 下次见

当然，我们并不会真的去修改任何 bug，因为我们只是去尝试使用一些 `git` 命令，来演示如何查看 `classify` 方法的演变历史。但是不管怎样，`git` 是一个非常强大的工具，我们必须学好它、用好它。我希望这篇文章可以帮助你掌握更多的关于如何使用 `git` 的知识。

你喜欢这些内容吗？

--------------------------------------------------------------------------------

作者简介：

后端工程师，对 Ruby、Go、微服务、构建弹性架构来解决大规模部署带来的挑战很感兴趣。我在阿姆斯特丹的 Rails Girls 担任顾问，维护着一个小而精的列表，并且经常为开源做贡献。

那个列表是我写的关于软件开发、编程语言以及任何我感兴趣的东西。

------

via: https://ieftimov.com/learn-your-tools-navigating-git-history

作者：[Ilija Eftimov ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ieftimov.com/
[1]:http://gitx.frim.nl/
[2]:https://github.com/jonas/tig
[3]:https://github.com/rails/rails/commit/5bb1d4d288d019e276335465d0389fd2f5246bfd
[4]:https://twitter.com/schneems
