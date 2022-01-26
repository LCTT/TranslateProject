[#]: subject: "Use Mozilla DeepSpeech to enable speech to text in your application"
[#]: via: "https://opensource.com/article/22/1/voice-text-mozilla-deepspeech"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use Mozilla DeepSpeech to enable speech to text in your application
======
Speech recognition in applications isn't just a fun trick but an
important accessibility feature.
![Colorful sound wave graph][1]

One of the primary functions of computers is to parse data. Some data is easier to parse than other data, and voice input continues to be a work in progress. There have been many improvements in the area in recent years, though, and one of them is in the form of DeepSpeech, a project by Mozilla, the foundation that maintains the Firefox web browser. DeepSpeech is a voice-to-text command and library, making it useful for users who need to transform voice input into text and developers who want to provide voice input for their applications.

### Install DeepSpeech

DeepSpeech is open source, released under the Mozilla Public License (MPL). You can download the source code from its [GitHub][2] page.

To install, first create a virtual environment for Python:


```
`$ python3 -m pip install deepspeech --user`
```

DeepSpeech relies on machine learning. You can train it yourself, but it's easiest just to download pre-trained model files when you're just starting.


```


$ mkdir DeepSpeech
$ cd Deepspeech
$ curl -LO \
<https://github.com/mozilla/DeepSpeech/releases/download/vX.Y.Z/deepspeech-X.Y.Z-models.pbmm>
$ curl -LO \
<https://github.com/mozilla/DeepSpeech/releases/download/vX.Y.Z/deepspeech-X.Y.Z-models.scorer>

```

### Applications for users

With DeepSpeech, you can transcribe recordings of speech to written text. You get the best results from speech cleanly recorded under optimal conditions. However, in a pinch, you can try any recording, and you'll probably get something you can use as a starting point for manual transcription.

For test purposes, you might record an audio file containing the simple phrase, "This is a test. Hello world, this is a test." Save the audio as a `.wav` file called `hello-test.wav`.

In your DeepSpeech folder, launch a transcription by providing the model file, the scorer file, and your audio:


```


$ deepspeech --model deepspeech*pbmm \
\--scorer deepspeech*scorer \
\--audio hello-test.wav

```

Output is provided to the standard out (your terminal):


```
`this is a test hello world this is a test`
```

You can get output in JSON format by using the `--json` option:


```


$ deepspeech --model deepspeech*pbmm \
\-- json
\--scorer deepspeech*scorer \
\--audio hello-test.wav

```

This renders each word along with a timestamp:


```


{
  "transcripts": [
    {
      "confidence": -42.7990608215332,
      "words": [
        {
          "word": "this",
          "start_time": 2.54,
          "duration": 0.12
        },
        {
          "word": "is",
          "start_time": 2.74,
          "duration": 0.1
        },
        {
          "word": "a",
          "start_time": 2.94,
          "duration": 0.04
        },
        {
          "word": "test",
          "start_time": 3.06,
          "duration": 0.74
        },
[...]

```

### Developers

DeepSpeech isn't just a command to transcribe pre-recorded audio. You can also use it to process audio streams in real time. The GitHub repository [DeepSpeech-examples][3] is full of JavaScript, Python, C#, and Java for Android.

Most of the hard work is already done, so integrating DeepSpeech usually is just a matter of referencing the DeepSpeech library and knowing how to obtain the audio from the host device (which you generally do through the `/dev` filesystem on Linux or an SDK on Android and other platforms.)

### Speech recognition

As a developer, enabling speech recognition for your application isn't just a fun trick but an important accessibility feature that makes your application easier to use by people with mobility issues, low vision, and chronic multi-taskers who like to keep their hands full. As a user, DeepSpeech is a useful transcription tool that can convert audio files into text. Regardless of your use case, try DeepSpeech and see what it can do for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/voice-text-mozilla-deepspeech

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://github.com/mozilla/DeepSpeech
[3]: https://github.com/mozilla/DeepSpeech-examples
