Ten Great Zsh Tips
==================

1: Use ** as a wildcard to descend into directories:

	$ ls **/*.pyc
	foo.pyc bar.pyc lib/wibble.pyc
	$ rm **/*.pyc
	$ ls **/*.pyc

2: Use patterns in file globs:

	$ ls *.(py|sh)

3: Use glob modifiers, e.g. (@) restricts glob to matching symlinks

	$ ls -l *(@)

4: Use tab completion everywhere! e.g. using man…

 	$ man zsh[TAB]

5: …for completing command options…

 	$ python -[TAB]

6: …for kill

 	$ kill Dock[TAB]

7: Navigate the tab completion options with your cursor keys

 	$ man zsh[TAB][DOWN][RIGHT][LEFT][UP]

8: Auto-correct your typos

 	$ pythn -V
 	zsh: correct 'pythn' to 'python' [nyae]? y
 	Python 2.7.1

9: Use r to repeat the last command – with substitutions!

 	$ touch foo.htm bar.htm
 	$ mv foo.htm foo.html
 	$ r foo=bar
 	mv bar.htm bar.html

10: Highly customisable prompt, including RPROMPT to set a prompt on the right hand side

	$ RPROMPT="%t"

via: http://blog.goosoftware.co.uk/2012/05/22/ten-great-zsh-tips/
