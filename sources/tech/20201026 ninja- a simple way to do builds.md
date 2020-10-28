[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ninja: a simple way to do builds)
[#]: via: (https://jvns.ca/blog/2020/10/26/ninja--a-simple-way-to-do-builds/)
[#]: author: (Julia Evans https://jvns.ca/)

ninja: a simple way to do builds
======

Hello! Every so often I find a new piece of software I really like, and today I want to talk about one of my recent favourites: [ninja][1]!

### incremental builds are useful

I do a lot of small projects where I want to set up incremental builds – for example, right now I’m writing a zine about bash, and I have one `.svg` file for each page of the zine. I need to convert the SVGs to PDFs, and I’d been doing it something like this:

```
for i in *.svg
do
    svg2pdf $i $i.pdf # or ${i/.svg/.pdf} if you want to get really fancy
done
```

This works fine, but my `svg2pdf` script is a little slow (it uses Inkscape), and it’s annoying to have to wait 90 seconds or whatever to rebuild all the PDFs when I’ve just updated 1 page.

### build systems are confusing

In the past I’ve been pretty put off by using a Build System like make or bazel for my small projects because bazel is this Big Complicated Thing and `make` feels a little arcane to me. I don’t really know how to use either of them.

So for a long time I’ve just written a bash script or something for my builds and resigned myself to just waiting for a minute sometimes.

### ninja is an EXTREMELY SIMPLE build system

But ninja is not complicated! Here is literally everything I know about ninja build file syntax: how to create a `rule` and a `build`:

a `rule` has a command and description (the description is just for humans to read so you can tell what it’s doing when it’s building your code)

```
rule svg2pdf
  command = inkscape $in --export-text-to-path --export-pdf=$out
  description = svg2pdf $in $out
```

the syntax for `build` is `build output_file: rule_name input_files`. Here’s one using the `svg2pdf` rule. The output goes in `$out` in the rule and the input goes in `$in`.

```
build pdfs/variables.pdf: svg2pdf variables.svg
```

That’s it! If you put those two things in a file called `build.ninja` and then run `ninja`, ninja will run `inkscape variables.svg --export-text-to-path --export-pdf=pdfs/variables.pdf`. And then if you run it again, it won’t run anything (because it can tell that you’ve already built `pdfs/variables.pdf` and you’re up to date)

Ninja has a few more features than this (see [the manual][2]), but I haven’t used them yet. It was originally built [for Chromium][3], so even with a small feature set it can support large builds.

### ninja files are usually automatically generated

The magic of ninja is that instead of having to use some confusing Build Language that’s hard to remember because you use it so infrequently (like make), instead the ninja language is SUPER simple, and if you want to do something complicated then you just generate the build file you want using any programming language you want.

I like to make a `build.py` file or that looks something like this, that creates the ninja build file and then runs `ninja`:

```
with open('build.ninja', 'w') as ninja_file:
    # write some rules
    ninja_file.write("""
rule svg2pdf
  command = inkscape $in --export-text-to-path --export-pdf=$out
  description = svg2pdf $in $out
""")

    # some for loop with every file I need to build
    for filename in things_to_convert:
        ninja_file.write(f"""
build {filename.replace('svg', 'pdf')}: svg2pdf {filename}
""")

# run ninja
import subprocess
subprocess.check_call(['ninja'])
```

I’m sure there are a bunch of ninja best practices, but I don’t know them and for my small projects I find this works well.

### meson is a build system that generates ninja files

I don’t know too much about [Meson][4] yet, but recently I was building a C program ([plocate][5], a faster alternative to `locate`) and I noticed that instead of the usual `./configure; make; make install`, there were different build instructions:

```
meson builddir
cd builddir
ninja
```

It seems like Meson is a build system for C/C++/Java/Rust/Fortran that can use ninja as a backend.

### that’s all!

I’ve been using ninja for a few months now. I really like it and it’s caused me approximately 0 build-related headaches which feels pretty magical to me.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/10/26/ninja--a-simple-way-to-do-builds/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://ninja-build.org/
[2]: https://ninja-build.org/manual.html
[3]: http://neugierig.org/software/chromium/notes/2011/02/ninja.html
[4]: https://mesonbuild.com/Tutorial.html
[5]: https://blog.sesse.net/blog/tech/2020-09-28-00-37_introducing_plocate
