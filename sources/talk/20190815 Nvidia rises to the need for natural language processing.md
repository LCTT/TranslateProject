[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nvidia rises to the need for natural language processing)
[#]: via: (https://www.networkworld.com/article/3432203/nvidia-rises-to-the-need-for-natural-language-processing.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Nvidia rises to the need for natural language processing
======
As the demand for natural language processing grows for chatbots and AI-powered interactions, more companies will need systems that can provide it. Nvidia says its platform can handle it.
![andy.brandon50 \(CC BY-SA 2.0\)][1]

Nvidia is boasting of a breakthrough in conversation natural language processing (NLP) training and inference, enabling more complex interchanges between customers and chatbots with immediate responses.

The need for such technology is expected to grow, as digital voice assistants alone are expected to climb from 2.5 billion to 8 billion within the next four years, according to Juniper Research, while Gartner predicts that by 2021, 15% of all customer service interactions will be completely handled by AI, an increase of 400% from 2017.

The company said its DGX-2 AI platform trained the BERT-Large AI language model in less than an hour and performed AI inference in 2+ milliseconds, making it possible “for developers to use state-of-the-art language understanding for large-scale applications.”

**[ Also read: [What is quantum computing (and why enterprises should care)][2] ]**

BERT, or Bidirectional Encoder Representations from Transformers, is a Google-powered AI language model that many developers say has better accuracy than humans in some performance evaluations. It’s all discussed [here][3].

### Nvidia sets natural language processing records

All told, Nvidia is claiming three NLP records:

**1\. Training:** Running the largest version of the BERT language model, a Nvidia DGX SuperPOD with 92 Nvidia DGX-2H systems running 1,472 V100 GPUs cut training from several days to 53 minutes. A single DGX-2 system, which is about the size of a tower PC, trained BERT-Large in 2.8 days.

“The quicker we can train a model, the more models we can train, the more we learn about the problem, and the better the results get,” said Bryan Catanzaro, vice president of applied deep learning research, in a statement.

**2\. Inference**: Using Nvidia T4 GPUs on its TensorRT deep learning inference platform, Nvidia performed inference on the BERT-Base SQuAD dataset in 2.2 milliseconds, well under the 10 millisecond processing threshold for many real-time applications, and far ahead of the 40 milliseconds measured with highly optimized CPU code.

**3\. Model:** Nvidia said its new custom model, called Megatron, has 8.3 billion parameters, making it 24 times larger than the BERT-Large and the world's largest language model based on Transformers, the building block used for BERT and other natural language AI models.

In a move sure to make FOSS advocates happy, Nvidia is also making a ton of source code available via [GitHub][4].

  * NVIDIA GitHub BERT training code with PyTorch
  * NGC model scripts and check-points for TensorFlow
  * TensorRT optimized BERT Sample on GitHub
  * Faster Transformer: C++ API, TensorRT plugin, and TensorFlow OP
  * MXNet Gluon-NLP with AMP support for BERT (training and inference)
  * TensorRT optimized BERT Jupyter notebook on AI Hub
  * Megatron-LM: PyTorch code for training massive Transformer models



Not that any of this is easily consumed. We’re talking very advanced AI code. Very few people will be able to make heads or tails of it. But the gesture is a positive one.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3432203/nvidia-rises-to-the-need-for-natural-language-processing.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/alphabetic_letters_characters_language_by_andybrandon50_cc_by-sa_2-0_1500x1000-100794409-large.jpg
[2]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[3]: https://medium.com/ai-network/state-of-the-art-ai-solutions-1-google-bert-an-ai-model-that-understands-language-better-than-92c74bb64c
[4]: https://github.com/NVIDIA/TensorRT/tree/release/5.1/demo/BERT/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
