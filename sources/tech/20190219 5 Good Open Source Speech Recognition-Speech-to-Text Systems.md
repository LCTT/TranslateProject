[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Good Open Source Speech Recognition/Speech-to-Text Systems)
[#]: via: (https://fosspost.org/lists/open-source-speech-recognition-speech-to-text)
[#]: author: (Simon James https://fosspost.org/author/simonjames)

5 Good Open Source Speech Recognition/Speech-to-Text Systems
======

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/open-source-speech-recognition-speech-to-text.png?resize=1237%2C527&ssl=1)

A speech-to-text (STT) system is as its name implies; A way of transforming the spoken words via sound into textual files that can be used later for any purpose.

Speech-to-text technology is extremely useful. It can be used for a lot of applications such as a automation of transcription, writing books/texts using your own sound only, enabling complicated analyses on information using the generated textual files and a lot of other things.

In the past, the speech-to-text technology was dominated by proprietary software and libraries; Open source alternatives didn’t exist or existed with extreme limitations and no community around. This is changing, today there are a lot of open source speech-to-text tools and libraries that you can use right now.

Here we list 5 of them.

### Open Source Speech Recognition Libraries

#### Project DeepSpeech

![5 Good Open Source Speech Recognition/Speech-to-Text Systems 15 open source speech recognition][1]

This project is made by Mozilla; The organization behind the Firefox browser. It’s a 100% free and open source speech-to-text library that also implies the machine learning technology using TensorFlow framework to fulfill its mission.

In other words, you can use it to build training models yourself to enhance the underlying speech-to-text technology and get better results, or even to bring it to other languages if you want. You can also easily integrate it to your other machine learning projects that you are having on TensorFlow. Sadly it sounds like the project is currently only supporting English by default.

It’s also available in many languages such as Python (3.6); Which allows you to have it working in seconds:

```
pip3 install deepspeech
deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio my_audio_file.wav
```

You can also install it using npm:

```
npm install deepspeech
```

For more information, refer to the [project’s homepage][2].

#### Kaldi

![5 Good Open Source Speech Recognition/Speech-to-Text Systems 17 open source speech recognition][3]

Kaldi is an open source speech recognition software written in C++, and is released under the Apache public license. It works on Windows, macOS and Linux. Its development started back in 2009.

Kaldi’s main features over some other speech recognition software is that it’s extendable and modular; The community is providing tons of 3rd-party modules that you can use for your tasks. Kaldi also supports deep neural networks, and offers an [excellent documentation on its website][4].

While the code is mainly written in C++, it’s “wrapped” by Bash and Python scripts. So if you are looking just for the basic usage of converting speech to text, then you’ll find it easy to accomplish that via either Python or Bash.

[Project’s homepage][5].

#### Julius

![5 Good Open Source Speech Recognition/Speech-to-Text Systems 19 open source speech recognition][6]

Probably one of the oldest speech recognition software ever; It’s development started in 1991 at the University of Kyoto, and then its ownership was transferred to an independent project team in 2005.

Julius main features include its ability to perform real-time STT processes, low memory usage (Less than 64MB for 20000 words), ability to produce N-best/Word-graph output, ability to work as a server unit and a lot more. This software was mainly built for academic and research purposes. It is written in C, and works on Linux, Windows, macOS and even Android (on smartphones).

Currently it supports both English and Japanese languages only. The software is probably availbale to install easily in your Linux distribution’s repository; Just search for julius package in your package manager. The latest version was [released][7] around one and half months ago.

[Project’s homepage][8].

#### Wav2Letter++

![5 Good Open Source Speech Recognition/Speech-to-Text Systems 21 open source speech recognition][9]

If you are looking for something modern, then this one is for you. Wav2Letter++ is an open source speech recognition software that was released by Facebook’s AI Research Team just 2 months ago. The code is released under the BSD license.

Facebook is [describing][10] its library as “the fastest state-of-the-art speech recognition system available”. The concepts on which this tool is built makes it optimized for performance by default; Facebook’s also-new machine learning library [FlashLight][11] is used as the underlying core of Wav2Letter++.

Wav2Letter++ needs you first to build a training model for the language you desire by yourself in order to train the algorithms on it. No pre-built support of any language (including English) is available; It’s just a machine-learning-driven tool to convert speech to text. It was written in C++, hence the name (Wav2Letter++).

[Project’s homepage][12].

#### DeepSpeech2

![5 Good Open Source Speech Recognition/Speech-to-Text Systems 23 open source speech recognition][13]

Researchers at the Chinese giant Baidu are also working on their own speech-to-text engine, called DeepSpeech2. It’s an end-to-end open source engine that uses the “PaddlePaddle” deep learning framework for converting both English & Mandarin Chinese languages speeches into text. The code is released under BSD license.

The engine can be trained on any model and for any language you desire. The models are not released with the code; You’ll have to build them yourself, just like the other software. DeepSpeech2’s source code is written in Python; So it should be easy for you to get familiar with it if that’s the language you use.

[Project’s homepage][14].

### Conclusion

The speech recognition category is still mainly dominated by proprietary software giants like Google and IBM (which do provide their own closed-source commercial services for this), but the open source alternatives are promising. Those 5 open source speech recognition engines should get you going in building your application, all of them are still under heavy development by time. In few years, we expect open source to become the norm for those technologies just like in the other industries.

If you have any other recommendations for this list, or comments in general, we’d love to hear them below!

**

Shares


--------------------------------------------------------------------------------

via: https://fosspost.org/lists/open-source-speech-recognition-speech-to-text

作者：[Simon James][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/simonjames
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/hero_speech-machine-learning2.png?resize=820%2C280&ssl=1 (5 Good Open Source Speech Recognition/Speech-to-Text Systems 16 open source speech recognition)
[2]: https://github.com/mozilla/DeepSpeech
[3]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Screenshot-at-2019-02-19-1134.png?resize=591%2C138&ssl=1 (5 Good Open Source Speech Recognition/Speech-to-Text Systems 18 open source speech recognition)
[4]: http://kaldi-asr.org/doc/index.html
[5]: http://kaldi-asr.org
[6]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/mic_web.png?resize=385%2C100&ssl=1 (5 Good Open Source Speech Recognition/Speech-to-Text Systems 20 open source speech recognition)
[7]: https://github.com/julius-speech/julius/releases
[8]: https://github.com/julius-speech/julius
[9]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/fully_convolutional_ASR.png?resize=850%2C177&ssl=1 (5 Good Open Source Speech Recognition/Speech-to-Text Systems 22 open source speech recognition)
[10]: https://code.fb.com/ai-research/wav2letter/
[11]: https://github.com/facebookresearch/flashlight
[12]: https://github.com/facebookresearch/wav2letter
[13]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/ds2.png?resize=850%2C313&ssl=1 (5 Good Open Source Speech Recognition/Speech-to-Text Systems 24 open source speech recognition)
[14]: https://github.com/PaddlePaddle/DeepSpeech
