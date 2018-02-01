Translating by cncuckoo

Rediscovering make: the power behind rules
======

![](https://user-images.githubusercontent.com/4419992/35015638-0529f1c0-faf4-11e7-9801-4995fc4b54f0.jpg)

I used to think makefiles were just a convenient way to list groups of shell commands; over time I've learned how powerful, flexible, and full-featured they are. This post brings to light over some of those features related to rules.

### Rules

Rules are instructions that indicate `make` how and when a file called the target should be built. The target can depend on other files called prerequisites.

You instruct `make` how to build the target in the recipe, which is no more than a set of shell commands to be executed, one at a time, in the order they appear. The syntax looks like this:
```
target_name : prerequisites
    recipe
```

Once you have defined a rule, you can build the target from the command line by executing:
```
$ make target_name
```

Once the target is built, `make` is smart enough to not run the recipe ever again unless at least one of the prerequisites has changed.

### More on prerequisites

Prerequisites indicate two things:

  * When the target should be built: if a prerequisite is newer than the target, `make` assumes that the target should be built.
  * An order of execution: since prerequisites can, in turn, be built by another rule on the makefile, they also implicitly set an order on which rules are executed.



If you want to define an order, but you don't want to rebuild the target if the prerequisite changes, you can use a special kind of prerequisite called order only, which can be placed after the normal prerequisites, separated by a pipe (`|`)

### Patterns

For convenience, `make` accepts patterns for targets and prerequisites. A pattern is defined by including the `%` character, a wildcard that matches any number of literal characters or an empty string. Here are some examples:

  * `%`: match any file
  * `%.md`: match all files with the `.md` extension
  * `prefix%.go`: match all files that start with `prefix` that have the `.go` extension



### Special targets

There's a set of target names that have special meaning for `make` called special targets.

You can find the full list of special targets in the [documentation][1]. As a rule of thumb, special targets start with a dot followed by uppercase letters.

Here are a few useful ones:

**.PHONY** : Indicates `make` that the prerequisites of this target are considered to be phony targets, which means that `make` will always run it's recipe regardless of whether a file with that name exists or what its last-modification time is.

**.DEFAULT** : Used for any target for which no rules are found.

**.IGNORE** : If you specify prerequisites for `.IGNORE`, `make` will ignore errors in execution of their recipes.

### Substitutions

Substitutions are useful when you need to modify the value of a variable with alterations that you specify.

A substitution has the form `$(var:a=b)` and its meaning is to take the value of the variable `var`, replace every `a` at the end of a word with `b` in that value, and substitute the resulting string. For example:
```
foo := a.o
bar : = $(foo:.o=.c) # sets bar to a.c
```

note: special thanks to [Luis Lavena][2] for letting me know about the existence of substitutions.

### Archive Files

Archive files are used to collect multiple data files together into a single file (same concept as a zip file), they are built with the `ar` Unix utility. `ar` can be used to create archives for any purpose, but has been largely replaced by `tar` for any other purposes than [static libraries][3].

In `make`, you can use an individual member of an archive file as a target or prerequisite as follows:
```
archive(member) : prerequisite 
    recipe
```

### Final Thoughts

There's a lot more to discover about make, but at least this counts as a start, I strongly encourage you to check the [documentation][4], create a dumb makefile, and just play with it.

--------------------------------------------------------------------------------

via: https://monades.roperzh.com/rediscovering-make-power-behind-rules/

作者：[Roberto Dip][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://monades.roperzh.com
[1]:https://www.gnu.org/software/make/manual/make.html#Special-Targets
[2]:https://twitter.com/luislavena/
[3]:http://tldp.org/HOWTO/Program-Library-HOWTO/static-libraries.html
[4]:https://www.gnu.org/software/make/manual/make.html
