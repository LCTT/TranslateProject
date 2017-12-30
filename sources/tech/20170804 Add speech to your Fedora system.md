translating by lujun9972
Add speech to your Fedora system
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/espeak-945x400.png)
By default, Fedora Workstation ships a small package called espeak. It adds a speech synthesizer -- that is, text-to-speech software.

In today's world, talking devices are nothing impressive as they're very common. You can find speech synthesizers even in your smartphone, a product like Amazon Alexa, or in the announcements at the train station. In addition, synthesized voices are nowadays more or less similar to human speech. We live in a 1980s science fiction movie!

The voice produced by espeak may sound a bit primitive compared to the aforementioned tools. But at the end of the day espeak produces good quality speech. And whether you find it useful or not, at least it can provide some amusement.

### Running espeak

In espeak you can set various parameters using command line options. Examples include:

  * amplitude (-a)
  * pitch adjustment (-p)
  * speed of sentences (-s)
  * gap between words (-g)



Each of these options produces various effects and may help you achieve a cleaner voice.

You can also select different voice variants with command line options. For example, try -ven+m3 for a different English male voice, and -ven+f1 for a female one. You can also use different languages. For a list, run this command:
```
espeak --voices
```

Note that many languages other than English are experimental attempts.

To create a WAV file instead of actually speaking something, use the -w option:
```
espeak -w out.wav "Audio file test"
```

The espeak utility also reads the content of a file for you.
```
espeak -f plaintextfile
```

Or you can pass the text to speech from the standard input. In this way, as a simple example, you can build a talking box that alerts you to an event using a voice. Your backup is completed? Add this command to the end of your script:
```
echo "Backup completed" | espeak -s 160 -a 100 -g 4
```

Suppose an error shows up in a log file:
```
tail -1F /your/log/file | grep --line-buffered 'ERROR' | espeak
```

Or perhaps you want a speaking clock telling you every minute what time it is:
```
while true; do date +%S | grep '00' && date +%H:%M | espeak; sleep 1; done
```

As you can guess, use cases are limited only by your imagination. Enjoy your new talking Fedora system!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/add-speech-fedora-system/

作者：[Author Archive][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://alciregi.id.fedoraproject.org/
