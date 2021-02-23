[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 open source teaching tools for virtual classrooms)
[#]: via: (https://opensource.com/article/20/4/open-source-remote-teaching-tools)
[#]: author: (Mathias Hoffmann https://opensource.com/users/mhopensource)

6 open source teaching tools for virtual classrooms
======
Create podcasts, online lectures, tutorials, and other teaching
resources for learning at home with open source tools.
![Person reading a book and digital copy][1]

As schools and universities are shutting down around the globe due to COVID-19, many of us in academia are wondering how we can get up to speed and establish a stable workflow to get our podcasts, online lectures, and tutorials out there for our students.

Open source software (OSS) has a key role to play in this situation for many reasons, including:

  * **Speed:** OSS can roll out quickly and in large numbers (e.g., to an army of teaching assistants for multiple tutorial sessions in big lectures) without licensing issues and in a decentralized manner.
  * **Cost:** OSS does not cost anything upfront, which is important for financially stretched schools and universities that need solutions to complex challenges on very short notice.



With everything going online, we need new ways to engage with students. Here is a list of tools that I have found useful to share my own lectures. 

### Create podcasts, videos, or live streams with OBS

[Open Broadcast Studio (OBS)][2] is a professional, open source audio and video recording tool that allows you to record, stream instantly, and do much more. OBS is available for all major platforms (Windows, macOS, and Linux), so interoperability with your colleagues and their various devices is ensured.

Even if you're already using online conferencing software as a recording system, OBS can be a great backup solution. Since it records locally, you're protected against any network lags or disconnections. You also have complete control over your data, so many educational institutions may find it to be a more secure solution than some other options.

Compatibility is also an advantage: OBS stores recordings in a standard intermediate format (MKV), which can be transferred to MP4 or other formats. Also, support for Nvidia graphics cards under OBS is great, as the company is one of the main sponsors of the OBS project. This allows you to make full use of your hardware and speed up the recording process.

### Video and sound editing

After you record your podcast or video, you may find that it needs editing. There are many reasons you may need to edit your audio or video. For example, many university online platforms restrict the size of files you can upload, so you may have to cut long videos. Or, the sound may be too quiet, or maybe it was too noisy when you recorded it, so you need to make adjustments to the audio.

Two of the open source apps to explore are [OpenShot][3] and [Shotcut][4]. Of the two, Shotcut is a more advanced program, which implies a slightly steeper learning curve. Both are cross-platform and have full support for hardware encoding with NVidia and other graphics cards, which will substantially lower processing time compared to CPU-only processing.

You can also extract a soundtrack in either program (although I have found it to be much faster with Shotcut) and export it to an audio-editing program. I find [Audacity][5], another open source, cross-platform (Mac, Linux, Windows) tool, to work extremely well.

My typical workflow looks something like this:

  * Import the recording into Shotcut
  * Extract the audio, save it to an audio file
  * Import it into Audacity, normalize and amplify the audio, maybe do some noise reduction
  * Save the audio to a new file
  * Import the new audio file into Shotcut, align it with the audio-free video, and cut appropriately
  * Export into an MP4 video (this last step usually takes some time, so have a coffee…)



### Electronic blackboards

If you want to annotate your slides or develop ideas on an electronic blackboard, you need note-taking software and a device with a touchscreen or a graphics tablet. A great open source tool (developed with Swiss taxpayer funding) for blackboarding is [OpenBoard][6]. It is cross-platform; although it is officially only available for Linux on Ubuntu 16.04, you can install a [Flatpak][7] and it will work on any Linux flavor. It is really a nice tool; its only shortcoming is that annotating slides is not very good.

My main open source annotation and electric blackboard tool is [Xournal++][8], which is available in some Linux distros repos (e.g., Linux Mint) and otherwise via [Flathub][9]. Like all the tools mentioned earlier, it is also available on Mac and Windows. If you know of any open source, cross-platform note-taking tools, please share them in the comments.

### Built-in solutions have their limits

You might wonder why you should bother with alternative recording software in the first place. After all, most modern operating systems have built-in screen recorders that will also capture audio. However, these built-in solutions have their limits. One key limitation is that you cannot usually capture more than one video source at a time (e.g., a webcam with your talking head and a set of slides plus a whiteboard from a graphics tablet).

The ability to use multiple video sources is very useful, though, since it can be dull for students to just listen to your voice and see your slides for extended periods. Face-to-face interactions—even if done virtually—help keep listeners' attention and make it easier for them to cope with imperfect recording quality and background noise. In addition, many of the built-in tools do not allow you to capture selected areas of the screen, and in general, you cannot change the resolution or the number of frames per second, which can be important for keeping your podcast's memory and bandwidth usage in check.

### Conclusion

When planning your online teaching, you will want to use a blend of audio, video, slides, and electronic blackboards to create an immersive experience even while students are learning remotely. Open source software offers advanced, effective tools for creating such online educational experiences.

* * *

_This article is based on "[Open source software for online teaching in the times of corona][10]" on Mathias Hoffman's blog and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/open-source-remote-teaching-tools

作者：[Mathias Hoffmann][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhopensource
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://obsproject.com/
[3]: http://www.openshot.org/
[4]: http://www.shotcut.org/
[5]: https://www.audacityteam.org/
[6]: http://www.openboard.ch/
[7]: http://www.flathub.org
[8]: https://github.com/xournalpp/xournalpp
[9]: https://flathub.org/apps/details/com.github.xournalpp.xournalpp
[10]: http://mathiashoffmann.net/2020/03/22/open-source-software-for-online-teaching-in-the-times-of-corona
