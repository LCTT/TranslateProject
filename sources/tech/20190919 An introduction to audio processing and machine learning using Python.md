[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to audio processing and machine learning using Python)
[#]: via: (https://opensource.com/article/19/9/audio-processing-machine-learning-python)
[#]: author: (Jyotika Singh https://opensource.com/users/jyotika-singhhttps://opensource.com/users/jroakeshttps://opensource.com/users/don-watkinshttps://opensource.com/users/clhermansenhttps://opensource.com/users/greg-p)

An introduction to audio processing and machine learning using Python
======
The pyAudioProcessing library classifies audio into different categories
and genres.
![abstract illustration with black background][1]

At a high level, any machine learning problem can be divided into three types of tasks: data tasks (data collection, data cleaning, and feature formation), training (building machine learning models using data features), and evaluation (assessing the model). Features, [defined][2] as "individual measurable propert[ies] or characteristic[s] of a phenomenon being observed," are very useful because they help a machine understand the data and classify it into categories or predict a value.

![Machine learning at a high level][3]

Different data types use very different processing techniques. Take the example of an image as a data type: it looks like one thing to the human eye, but a machine sees it differently after it is transformed into numerical features derived from the image's pixel values using different filters (depending on the application).

![Data types and feature formation in images][4]

[Word2vec][5] works great for processing bodies of text. It represents words as vectors of numbers, and the distance between two word vectors determines how similar the words are. If we try to apply Word2vec to numerical data, the results probably will not make sense.

![Word2vec for analyzing a corpus of text][6]

So, there are processing techniques specific to the audio data type that works well with audio.

### What are audio signals?

Audio signals are signals that vibrate in the audible frequency range. When someone talks, it generates air pressure signals; the ear takes in these air pressure differences and communicates with the brain. That's how the brain helps a person recognize that the signal is speech and understand what someone is saying.

There are a lot of MATLAB tools to perform audio processing, but not as many exist in Python. Before we get into some of the tools that can be used to process audio signals in Python, let's examine some of the features of audio that apply to audio processing and machine learning.

![Examples of audio terms to learn][7]

Some data features and transformations that are important in speech and audio processing are Mel-frequency cepstral coefficients ([MFCCs][8]), Gammatone-frequency cepstral coefficients (GFCCs), Linear-prediction cepstral coefficients (LFCCs), Bark-frequency cepstral coefficients (BFCCs), Power-normalized cepstral coefficients (PNCCs), spectrum, cepstrum, spectrogram, and more.

We can use some of these features directly and extract features from some others, like spectrum, to train a machine learning model.

### What are spectrum and cepstrum?

Spectrum and cepstrum are two particularly important features in audio processing.

![Spectrum and cepstrum][9]

Mathematically, a spectrum is the [Fourier transform][10] of a signal. A Fourier transform converts a time-domain signal to the frequency domain. In other words, a spectrum is the frequency domain representation of the input audio's time-domain signal.

A [cepstrum][11] is formed by taking the log magnitude of the spectrum followed by an inverse Fourier transform. This results in a signal that's neither in the frequency domain (because we took an inverse Fourier transform) nor in the time domain (because we took the log magnitude prior to the inverse Fourier transform). The domain of the resulting signal is called the quefrency.

### What does this have to do with hearing?

The reason we care about the signal in the frequency domain relates to the biology of the ear. Many things must happen before we can process and interpret a sound. One happens in the cochlea, a fluid-filled part of the ear with thousands of tiny hairs that are connected to nerves. Some of the hairs are short, and some are relatively longer. The shorter hairs resonate with higher sound frequencies, and the longer hairs resonate with lower sound frequencies. Therefore, the ear is like a natural Fourier transform analyzer!

![How the ear works][12]

Another fact about human hearing is that as the sound frequency increases above 1kHz, our ears begin to get less selective to frequencies. This corresponds well with something called the Mel filter bank.

![MFCC][13]

Passing a spectrum through the Mel filter bank, followed by taking the log magnitude and a [discrete cosine transform][14] (DCT) produces the Mel cepstrum. DCT extracts the signal's main information and peaks. It is also widely used in JPEG and MPEG compressions. The peaks are the gist of the audio information. Typically, the first 13 coefficients extracted from the Mel cepstrum are called the MFCCs. These hold very useful information about audio and are often used to train machine learning models.

Another filter inspired by human hearing is the Gammatone filter bank. This filter bank is used as a front-end simulation of the cochlea. Thus, it has many applications in speech processing because it aims to replicate how we hear.

![GFCC][15]

GFCCs are formed by passing the spectrum through Gammatone filter bank, followed by loudness compression and DCT. The first (approximately) 22 features are called GFCCs. GFCCs have a number of applications in speech processing, such as speaker identification.

Other features useful in audio processing tasks (especially speech) include LPCC, BFCC, PNCC, and spectral features like spectral flux, entropy, roll off, centroid, spread, and energy entropy.

### Building a classifier

As a quick experiment, let's try building a classifier with spectral features and MFCC, GFCC, and a combination of MFCCs and GFCCs using an open source Python-based library called [pyAudioProcessing][16].

To start, we want pyAudioProcessing to classify audio into three categories: speech, music, or birds.

![Segmenting audio into speech, music, and birds][17]

Using a small dataset (50 samples for training per class) and without any fine-tuning, we can gauge the potential of this classification model to identify audio categories.

![MFCC of speech, music, and bird signals][18]

Next, let's try pyAudioProcessing on a music genre classification problem using the [GZTAN][19] audio dataset and audio features: MFCC and spectral features.

![Music genre classification][20]

Some genres do well while others have room for improvement. Some things that can be explored from this data include:

  * Data quality check: Is more data needed?
  * Features around the beat and other aspects of music audio
  * Features other than audio, like transcription and text
  * Would a different classifier be better? There has been research on using neural networks to classify music genres.



Regardless of the results of this quick test, it is evident that these features get useful information out of the signal, a machine can work with them, and they form a good baseline to work with.

### Learn more

Here are some useful resources that can help in your journey with Python audio processing and machine learning:

  * [pyAudioAnalysis][21]
  * [pyAudioProcessing][16]
  * [Power-normalized cepstral coefficients (PNCC) for robust speech recognition][22]
  * [LPCC features][23]
  * [Speech recognition using MFCC][24]
  * [Speech/music classification using block-based MFCC features][25]
  * [Musical genre classification of audio signals][26]
  * Libraries for reading audio in Python: [SciPy][27], [pydub][28], [libROSA][29], pyAudioAnalysis
  * Libraries for getting features: libROSA, pyAudioAnalysis (for MFCC); pyAudioProcessing (for MFCC and GFCC)
  * Basic machine learning models to use on audio: sklearn, hmmlearn, pyAudioAnalysis, pyAudioProcessing



* * *

_This article is based on Jyotika Singh's presentation "[Audio processing and ML using Python][30]" from PyBay 2019._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/audio-processing-machine-learning-python

作者：[Jyotika Singh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jyotika-singhhttps://opensource.com/users/jroakeshttps://opensource.com/users/don-watkinshttps://opensource.com/users/clhermansenhttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/FeedbackLoop.png?itok=l7Sa9fHt (abstract illustration with black background)
[2]: https://en.wikipedia.org/wiki/Feature_(machine_learning)
[3]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_1.png (Machine learning at a high level)
[4]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_1a.png (Data types and feature formation in images)
[5]: https://en.wikipedia.org/wiki/Word2vec
[6]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_2b.png (Word2vec for analyzing a corpus of text)
[7]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_4.png (Examples of audio terms to learn)
[8]: https://en.wikipedia.org/wiki/Mel-frequency_cepstrum
[9]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_5.png (Spectrum and cepstrum)
[10]: https://en.wikipedia.org/wiki/Fourier_transform
[11]: https://en.wikipedia.org/wiki/Cepstrum
[12]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_6.png (How the ear works)
[13]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_7.png (MFCC)
[14]: https://en.wikipedia.org/wiki/Discrete_cosine_transform
[15]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_8.png (GFCC)
[16]: https://github.com/jsingh811/pyAudioProcessing
[17]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_10.png (Segmenting audio into speech, music, and birds)
[18]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_11.png (MFCC of speech, music, and bird signals)
[19]: http://marsyas.info/downloads/datasets.html
[20]: https://opensource.com/sites/default/files/uploads/audioprocessing-ml_12.png (Music genre classification)
[21]: https://github.com/tyiannak/pyAudioAnalysis
[22]: http://www.cs.cmu.edu/~robust/Papers/OnlinePNCC_V25.pdf
[23]: https://link.springer.com/content/pdf/bbm%3A978-3-319-17163-0%2F1.pdf
[24]: https://pdfs.semanticscholar.org/3439/454a00ef811b3a244f2b0ce770e80f7bc3b6.pdf
[25]: https://pdfs.semanticscholar.org/031b/84fb7ae3fae3fe51a0a40aed4a0dcb55a8e3.pdf
[26]: https://pdfs.semanticscholar.org/4ccb/0d37c69200dc63d1f757eafb36ef4853c178.pdf
[27]: https://www.scipy.org/
[28]: https://github.com/jiaaro/pydub
[29]: https://librosa.github.io/librosa/
[30]: https://pybay.com/speaker/jyotika-singh/
