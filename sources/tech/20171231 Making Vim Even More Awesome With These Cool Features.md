Making Vim Even More Awesome With These Cool Features
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/making-vim-even-more-awesome-with-these-cool-features_orig.jpg)

**Vim** is quite an integral part of Every [Linux Distribution][1] and the most useful tool (of course after the terminal) for Linux Users. At least, this theory holds for me. People might argue that for programming, Vim might not be a good choice as there are different IDEs or other sophisticated text editors like Sublime Text 3, Atom etc. which make the programming job pretty easier.

#### My Thoughts

But what I think is that Vim works the way we want it to right from the very start, while other editors make us work the way they have been designed, not the way we actually want them to work. I can’t say much about other editors cause I haven’t used them much ( I’m biased with Vim ).

Anyway, Let’s make something out of Vim, that really does the Job god damn well.

### ​Vim for Programming

#### Executing the Code

Consider a scenario, What we do when we are working on a C++ code on Vim and we need to compile and run it.

(a). We get back to the terminal either through (Ctrl + Z) thing or we just save and quit it (:wq).

(b). And the trouble’s ain’t over, we now need to type on something on terminal like this { g++ fileName.cxx }.

​

(c). And after that execute it by typing { ./a.out } .

Certainly a lot of things needed to be done in order to get our C++ code running over the shell. But it doesn’t seem to be a Vim way of doing this (as Vim always tends to keep almost everything under one/two keypresses). So, What is the Vim way of doing this stuff?

#### The Vim Way

Vim isn’t just a Text Editor, It is sort of a Programming Language for Editing Text. And that programming language that helps us extending the features of Vim is “VimScript”.

So, with the help of VimScript, we can easily automate our task of Compiling and Running code with just a KeyPress.

 [![create functions in vim .vimrc](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_orig.png)][2] 

Above is a snippet out of my .vimrc configuration file where i created a function called CPP().

#### Creating Functions in VimScript

The syntax for creating a function in VimScript is pretty easy. It starts with keyword “

**func**

” and is followed by the name of Function [Function Name must start with a capital letter in VimScript, otherwise Vim will give an error]. And the end of the function is denoted by keyword “

**endfunc**

”.

In the function’s body, you can see an

**exec**

statement, whatever you write after the exec keyword is executed over the Vim’s Command Mode (remember the thing starting with: at the bottom of Vim’s window). Now, the string that I passed to the exec is -

 [![vim functions commands & symbols](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_1_orig.png)][3] 

What happens is when this function is called, it first clears the Terminal Screen, so that only you will be viewing is your output, then it executes g++ over the filename you are working on and after that executes the a.out file formed due to compilation.

Mapping Ctrl+r to run C++ code

-------------------------------------------------------------

I mapped the statement :call CPP() to the key-combination (Ctrl+r) so that I could now press Ctrl+r to execute my C++ Code without manually typing :call CPP() and then pressing Enter.

#### End Result

We finally managed to find the Vim Way of doing that stuff. So now, You just hit a button and the output of your C++ code is on your screen, you don’t need to type all that lengthy thing. It sort of saves your time too.

We can achieve this sort of functionality for other languages too.

 [![create function in vim for python](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_2_orig.png)][4] 

​So For Python: Now you could press to interpret your code.

 [![create function in vim for java](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_3_orig.png)][5] 

For Java: You could now press , it will first Compile your Java Code then interpret your java class file and show you the output.

### Picture ain’t over, Marching a level deep

So, this was all about how you could manipulate things to work your way in Vim. Now, it comes to how we implement all this in Vim. We can use these Code Snippets directly in Vim and the other way around is by using the AutoCommands in Vim (autocmd’s). The beauty of autocmd is these commands need not be called by users, they execute by themselves at any certain condition which is provided by the user.

What I want to do with this [autocmd] thing is that, instead of using different mappings to perform execution of codes in different Programming Languages, I would like a single mapping for execution for every language.

 [![autocmd in vimrc](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_4_orig.png)][6] 

​What we did here is that I wrote autocommands for all the File Types for which I had functions for Executing the code.

What’s going to happen is as soon as I open any buffer of any of the above-mentioned file types, Vim will automatically map my (Ctrl + r) to the function call and represents Enter Key, so that I don’t need to press “Enter key” everytime I press and alone does the job.

To achieve this Functionality, you just need to add the function snippets to your [dot]vimrc and after that just put all those autocmds . And with that, the next time you open Vim, Vim will have all the Functionalities to execute all the Codes with the very same KeyBindings.

### Conclusion

That’s all for now. Hope this thing makes you love your Vim even more. I am currently exploring things in Vim, reading Documentations etc. and doing additions in [.vimrc] file and I will reach to you again when I will have something wonderful to share with you all.

If you want to have a look at my current [.vimrc] file, here is the link to my Github account: [MyVimrc][7]

. 

Please do Comment on how you liked the article.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/making-vim-even-more-awesome-with-these-cool-features

作者：[LINUXANDUBUNTU][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/distros
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_orig.png
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_1_orig.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_2_orig.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_3_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_4_orig.png
[7]:https://github.com/phenomenal-ab/VIm-Configurations/blob/master/.vimrc
