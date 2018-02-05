HeRM’s - A Commandline Food Recipes Manager
======
![配图](https://www.ostechnix.com/wp-content/uploads/2017/12/herms-720x340.jpg)

Cooking is love made visible, isn't? Indeed! Either cooking is your passion or hobby or profession, I am sure you will maintain a cooking journal. Keeping a cooking journal is one way to improve your cooking practice. There are many ways to take notes about the recipes. You could maintain a small diary/notebook or store the recipe's notes in the smartphone or save them in a word document in your computer. There are multitude of options. Today, I introduce **HeRM 's**, a Haskell-based commandline food recipes manager to make notes about your delicious food recipes. Using Herm's, you can add, view, edit, and delete food recipes and even can make your shopping lists. All from your Terminal! It is free, and open source utility written using Haskell programming language. The source code is freely available in GitHub, so you can fork it, add more features or improve it.

### HeRM's - A Commandline Food Recipes Manager

#### **Installing HeRM 's**

Since it is written using Haskell, we need to install Cabal first. Cabal is a command-line program for downloading and building software written in Haskell programming language. Cabal is available in the core repositories of most Linux distributions, so you can install it using your distribution's default package manager.

For instance, you can install cabal in Arch Linux and its variants such as Antergos, Manjaro Linux using command:
```
sudo pacman -S cabal-install
```

On Debian, Ubuntu:
```
sudo apt-get install cabal-install
```

After installing Cabal, make sure you have added it your PATH. To do so, edit your **~/.bashrc** file:
```
vi ~/.bashrc
```

Add the following line:
```
PATH=$PATH:~/.cabal/bin
```

Press **:wq** to save and quit the file. Then, run the following command to update the changes made.
```
source ~/.bashrc
```

Once cabal installed, run the following command to install herms:
```
cabal install herms
```

Have a cup of coffee! This will take a while. After couple minutes, you will see an output, something like below.
```
[...]
Linking dist/build/herms/herms ...
Installing executable(s) in /home/sk/.cabal/bin
Installed herms-1.8.1.2
```

Congratulations! Herms is installed.

#### **Adding recipes**

Let us add a food recipe, for example **Dosa**. For those wondering, Dosa is a popular south Indian food served hot with **sambar** and **chutney**. It is a healthy, and arguably most delicious food. It contains no added sugars or saturated fats. It is also easy to make one. There are couple types of different Dosas, the most common served in our home is Plain Dosa.

To add a recipe, type:
```
herms add
```

You will see a screen something like below. Start entering the recipe's details.

[![][1]][2]

To navigate through fields,use the following keyboard shortcuts:

  * **Tab / Shift+Tab** - Next / Previous field
  * **Ctrl + <Arrow keys>** - Navigate fields
  * **[Meta or Alt] + <h-j-k-l>** - Navigate fields
  * **Esc** - Save or Cancel.



Once you added the recipe's details, press ESC key and hit Y to save it. Similarly, you can add as many recipes as you want.

To list the added recipes, type:
```
herms list
```

[![][1]][3]

To view the details of any recipes listed above, just use the respective number like below.
```
herms view 1
```

[![][1]][4]

To edit any recipes, use:
```
herms edit 1
```

Once you made the changes, press ESC key. You'll be asked whether you want to save or not. Just choose the appropriate option.

[![][1]][5]

To delete a recipe, the command would be:
```
herms remove 1
```

To generate a shopping list for a given recipe(s), run:
```
herms shopping 1
```

[![][1]][6]

For help, run:
```
herms -h
```

The next time you overhear a conversation about a good recipe from your colleague or friend or somewhere else, just open Herms and quickly take a note and share them to your spouse. She would be delighted!

And, that's all. More good stuffs to come. Stay tuned!

Cheers!!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/herms-commandline-food-recipes-manager/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/12/Make-Dosa-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-1-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-2.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-3.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/herms-4.png ()
