[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Compose music as code using Sonic Pi)
[#]: via: (https://opensource.com/article/20/3/sonic-pi)
[#]: author: (Matt Bargenquast https://opensource.com/users/mbargenquast)

Compose music as code using Sonic Pi
======
There's no need for instrumental mastery with this accessible open
source program that can turn you into a musical virtuoso.
![Bird singing and music notes][1]

Maybe you're like me, and you learned a musical instrument when you were in school. For me, it was the piano, and later, the viola. However, I've always held that, as my childhood interests shifted towards computers and coding, I subsequently neglected my music practice. I do wonder what I would have done if I'd had something like Sonic Pi when I was younger. Sonic Pi is an open source program that lets you compose and perform music through code itself. It's the perfect marriage of those two worlds.

Opensource.com is no stranger to Sonic Pi—we [featured an interview][2] with the creator, Dr. Sam Aaron, back in 2015. Since that time, a lot has changed, and Sonic Pi has grown substantially in many ways. It's reached a major new version milestone, with the long-awaited v3.2 release made publically available on February 28, 2020. A growing community of developers is actively contributing to its [GitHub project][3], while an equally thriving community of composers shares ideas and support in the [official forums][4]. The project is now also financially assisted through a [Patreon campaign][5], and Sam himself has been spreading the word of Sonic Pi through schools, conferences, and workshops worldwide.

What really shines about Sonic Pi is its approachability. Releases are available for many major flavors of OS, including Windows, macOS, Linux, and of course, the Raspberry Pi itself. In fact, getting started with Sonic Pi on a Raspberry Pi couldn't be simpler; it comes pre-installed with [Raspbian][6], so if you have an existing Raspbian-based setup, you'll find it situated in the programming menu.

Upon loading Sonic Pi for the first time, you'll be greeted with a simple interface with two main areas: an editor in which to write your code, and a section devoted to Sonic Pi's expansive tutorial. For newcomers, the tutorial is an essential resource for learning the basics, featuring accompanying music programs to reinforce each concept being taught.

If you're following along, let's code ourselves a simple bit of music and explore the potential of live-coding music. Type or paste the following code into the Sonic Pi editor:


```
live_loop :beat do
  sample :drum_heavy_kick
  sleep 1
end
```

Even if you're a Sonic Pi novice, many coders may immediately understand what's going on here. We're playing a drum kick sample, sleeping for a second, and then repeating. Click the Run button or press ALT+R (meta+R on macOS), and you should hear it begin to play.

This isn't a very exciting song yet, so let's liven it up with a snare playing on the off-beat. Replace the existing code with the block below and Run again. You can leave the existing beat playing while you do this; you'll notice that your changes will be applied naturally, in time with the beat:


```
live_loop :beat do
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_snare_soft
  sleep 0.5
end
```

While we're at it, let's add a hi-hat right before every fourth beat, just to make things a little interesting. Add this new block below our existing one and Run again:


```
live_loop :hihat do
  sleep 3.9
  sample :drum_cymbal_closed
  sleep 0.1
end
```

We've got our beat going now, so let's add a bassline! Sonic Pi comes with a variety of synths built-in, along with effects filters such as reverb and distortion. We'll use a combination of the "dsaw" and "tech_saw" synths to give it an electronic retro-synth feel. Add the block below to your existing program, Run, and have a listen:


```
live_loop :bass do
  use_synth :dsaw
  play :a2, attack: 1, release: 2, amp: 0.3
  sleep 2.5
  use_synth :tech_saws
  play :a1, attack: 1, release: 1.5, amp: 0.8
  sleep 1.5
end
```

You'll note above that we have full control over the [ADSR][7] envelope when playing notes, so we can decide when each sound should peak and fade.

Lastly, let's add a lead synth and try out one of those effects features known as the "slicer." To spice things up, we'll also introduce an element of pseudo-randomness by letting Sonic Pi pick from a series of potential chords. This is where some of the fun improvisation and "happy accidents" can begin to occur. Add the block below to your existing program and Run:


```
live_loop :lead do
  with_fx :slicer do
    chords = [(chord :A4, :minor7), (chord :A4, :minor), (chord :D4, :minor7), (chord :F4, :major7)]
    use_synth :blade
    play chords.choose, attack: 1, release: 2, amp: 1
    sleep 2
  end
end
```

Great! Now, we're certainly not going to be competing with Daft Punk any time soon, but hopefully, through this process, you've seen how we can go from a bare beat to something much bigger, in real-time, by adding some simple morsels of code. It is well worth watching one of Sam Aaron's [live coding performances][8] on YouTube for a demonstration of how creative and adaptive Sonic Pi can let you be.

![Sonic Pi composition example][9]

Our finished piece, in full

If you've ever wanted to learn a musical instrument, but felt held back by thoughts like "I don't have rhythm" or "my hands aren't nimble enough," Sonic Pi is a versatile instrument for which none of those things matter. All you need are the ideas, the inspiration, and an inexpensive computer such as the humble Raspberry Pi. The rest is at your fingertips—literally!

Here are a few handy links to get you started:

  * The Official Sonic Pi [website][10] and [tutorial][11]
  * [Getting Started with Sonic Pi][12] ([projects.raspberrypi.org][13])
  * Sonic Pi [Github project][3]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/sonic-pi

作者：[Matt Bargenquast][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbargenquast
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/music-birds-recording-520.png?itok=UoM7brl0 (Bird singing and music notes)
[2]: https://opensource.com/life/15/10/interview-sam-aaron-sonic-pi
[3]: https://github.com/samaaron/sonic-pi/
[4]: https://in-thread.sonic-pi.net/
[5]: https://www.patreon.com/samaaron
[6]: https://www.raspberrypi.org/downloads/raspbian/
[7]: https://en.wikipedia.org/wiki/Envelope_(music)
[8]: https://www.youtube.com/watch?v=JEHpS1aTKp0
[9]: https://opensource.com/sites/default/files/uploads/sonicpi.png (Sonic Pi composition example)
[10]: https://sonic-pi.net/
[11]: https://sonic-pi.net/tutorial.html
[12]: https://projects.raspberrypi.org/en/projects/getting-started-with-sonic-pi
[13]: http://projects.raspberrypi.org
