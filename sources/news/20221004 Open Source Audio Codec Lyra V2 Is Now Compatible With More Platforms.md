[#]: subject: "Open Source Audio Codec Lyra V2 Is Now Compatible With More Platforms"
[#]: via: "https://www.opensourceforu.com/2022/10/open-source-audio-codec-lyra-v2-is-now-compatible-with-more-platforms/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open Source Audio Codec Lyra V2 Is Now Compatible With More Platforms
======
*The open source Lyra V2 audio codec is now quicker, better, and more platform-compatible.*

The open source Lyra audio codec, which Google first released last year, has been updated with Lyra V2 thanks to a new architecture that enables scalable bitrate capabilities, greater performance, higher audio quality, and compatibility with more systems.

Lyra V2’s internal architecture is based on the SoundStream end-to-end neural audio codec, which has a “residual vector quantizer” (RVQ) sitting before and after the transmission channel and the ability to adjust the amount of quantizers to be used at any time to alter the audio bitrate. The three available bitrates are 3.2 kps, 6 kbps, and 9.2 kbps. Lyra V2 makes use of artificial intelligence, and a TensorFlow Lite model makes it possible for it to function on Linux, Mac, Windows, Android smartphones, and even experimentally on Android and Linux. At this time, iOS and other embedded platforms are not supported, however things might change later.

Upon comparing Lyra V2 to other audio codecs like Lyra (V1) and Opus, things get really interesting because the new audio codec offers a higher quality (MUSHRA score) than those at a given bitrate. As you can see in the chart above, Lyra V2 @ 9.2 kbps offers roughly the same quality as Opus @ 14 kbps.

The second generation codec’s latency has decreased from 100 ms to 20 ms, making it similar to Opus for WebRTC, which typically has delays of 26.5 ms, 46.5 ms, and 66.5 ms. In order to provide real-time audio encoding/decoding and reduce power consumption, Lyra V2 also encodes and decodes five times quicker than Lyra V1. On a Pixel 6 Pro phone, for example, the new audio codec encodes and decodes a 20 ms audio frame in 0.57 ms, which is nearly 35 times quicker than real-time.

While Lyra V1 would be comparable to AMR-NB, Lyra V2 provides better quality than Enhanced Voice Services (EVS) and Adaptive Multi-Rate Wideband (AMR-WB), as well as comparable quality to Opus, while only utilising around 50% to 60% of the available bandwidth.

On [Github][1], you can get the source code for the Lyra V1/V2 implementation. The C++ API is largely unchanged from the original release, with a few changes like the ability to alter the bitrate while encoding. As.tflite files, the model definitions and weights are also included.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/10/open-source-audio-codec-lyra-v2-is-now-compatible-with-more-platforms/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://github.com/google/lyra
