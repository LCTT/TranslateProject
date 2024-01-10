[#]: subject: "AI Tools Are Here for Open-Source Audio Editor 'Audacity'"
[#]: via: "https://news.itsfoss.com/audacity-ai-tools/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AI Tools Are Here for Open-Source Audio Editor 'Audacity'
======
Audacity is now equipped with new AI tools.
Over the past couple of years, we have seen notable developments in AI, including AI-powered functionalities being added to various popular tools. And, more AI is something we already mentioned in our [predictions for Linux and open source for 2024][1].

This time it is Audacity, [one of the best audio editors for Linux][2], that has welcomed AI. Users can now enhance their audio editing experience by leveraging the power of AI.

Let's take a look at what these fascinating features bring to the table.

### Intel Makes AI Tools 🛠️

The folks over at Intel have introduced new features for working with spoken audio and music, all powered by AI.

These features are a part of the **OpenVINO** plugin suite. For those unaware, Intel's OpenVINO is an AI framework that helps accelerate deep-learning models.

One cool, yet important, aspect to note is that all these features run on your PC locally! More specifically, the PC's CPU or GPU will be utilized for the processing part.

#### Podcast Editing

Ever wanted to quickly transcribe or even translate the audio?
**Transcription** , which is powered by OpenAI's Whisper, allows users to do exactly this.

![Transcription | Source: GitHub Intel][3]

  * It produces a new label track that includes transcribed/translated text based on a given audio sample.
  * Translation will always produce the output in English, while transcribing will produce the output in the same language as the source audio.
  * For now, only the _Whisper Base_ model is supported by default. Support for more models may arrive later.



Similar to the existing Noise Removal effect, there's **Noise Suppression** which helps remove unwanted background noise from a spoken audio sample.

  * Since it's powered by AI, you can expect this feature to perform better than the Noise Removal effect.
  * For now, only the _denseunet_ model is supported by default. Support for more models may arrive later.



#### Music Generation

Yes, you read it right: You can now generate new music right inside your machine!

**Music Generation** allows users to generate a snippet of music. This is possible thanks to an open-source project called **Riffusion** , which is a music generation model based on **Stable Diffusion** (a popular open-source model used to generate images.)

![Music Generation | Source: GitHub Intel repo][4]

  * You generate music by giving a text prompt and adjusting some other parameters like the duration.
  * In the text prompt, you specify the genre of music to be generated and the AI will try its best to maintain the genre when generating music.
  * There exists an option to switch between the default Simple mode and an optional Advance mode for more control like specifying a start prompt and end prompt.



Furthermore, you can even remix music with **Music Style Remix** by selecting a portion of a music track!

#### Music Separation

What if you wished to create your own instrumental track of your favourite song? Maybe even have a fun karaoke session with your friends?

**Music Separation** allows you to split a song into either a vocal or instrumental version. There are two separation modes offered:

![Music Separation. Source: github.com/intel/openvino-plugins-ai-audacity][5]

  * 2-Stem produces two new tracks for vocals and instrumental.
  * 4-Stem produces four new tracks for vocals, drums, bass and the last one of other instruments combined.



### How to Use The AI Tools? 📥

If you're a Linux user, hold on to your horses.

While the [Windows version][6] of the plugin is available for download, its Linux counterpart isn't available... just yet.

If you still want to try it out, you will need to compile the project yourself. [You can refer to the official instructions for this.][7]

Hopefully, a Linux build arrives soon!🤞

_💬 What do you think about these new AI goodies for Audacity? Let us know your thoughts in the comments!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/audacity-ai-tools/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/predictions-linux-open-source-2024/
[2]: https://itsfoss.com/best-audio-editors-linux/
[3]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/whisper_transcription/properties.png
[4]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/music_generation/simple_properties.png
[5]: https://github.com/intel/openvino-plugins-ai-audacity/raw/main/doc/feature_doc/music_separation/properties.png
[6]: https://github.com/intel/openvino-plugins-ai-audacity/releases
[7]: https://github.com/intel/openvino-plugins-ai-audacity/blob/main/doc/build_doc/linux/README.md
