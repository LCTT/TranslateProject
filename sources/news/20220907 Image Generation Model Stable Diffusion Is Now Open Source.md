[#]: subject: "Image Generation Model Stable Diffusion Is Now Open Source"
[#]: via: "https://www.opensourceforu.com/2022/09/image-generation-model-stable-diffusion-is-now-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Image Generation Model Stable Diffusion Is Now Open Source
======
The pre-trained model weights for Stable Diffusion, a text-to-image AI model, were made available to the general public by Stability AI. When given a written prompt, Stable Diffusion can produce 512×512 pixel graphics that are photorealistic and represent the scene it describes.

Following the earlier code release and a restricted release of the model weights to the research community, the model weights have now been made available to the general public. With the most recent version, anyone can download and utilise Stable Diffusion on hardware designed for common consumers. The model not only supports text-to-image generation but also image-to-image style transfer and upscaling. Along with the release, Stable AI also made available a beta version of DreamStudio, an API and web UI for the model. Stable AI states that:

“Stable Diffusion is a text-to-image model that will empower billions of people to create stunning art within seconds. It is a breakthrough in speed and quality meaning that it can run on consumer GPUs…This will allow both researchers and…the public to run this under a range of conditions, democratizing image generation. We look forward to the open ecosystem that will emerge around this and further models to truly explore the boundaries of latent space.”

Latent diffusion models are a method of image production that Stable Diffusion is built on (LDMs). LDMs create images by iteratively “de-noising” input in a latent representation space, then decoding the representation into a complete image, in contrast to other well-known image synthesis techniques like generative adversarial networks (GANs) and the auto-regressive approach employed by DALL-E. The recent IEEE / CVF Computer Vision and Pattern Recognition Conference featured a paper on LDM, which was created by the Ludwig Maximilian University of Munich’s Machine Vision and Learning research group (CVPR). An further diffusion-based picture generating AI that InfoQ reported earlier this year was Google’s Imagen model.

Numerous operations can be supported by the Stable Diffusion model. Similar to DALL-E, it may generate a high-quality image that exactly fits a text description of a desired image. A straightforward sketch and a textual description of the desired image can also be used to create a realistic-looking image. Similar image-to-image abilities may be found in the Make-A-Scene model from Meta AI, which was just just released.

Examples of created photos from Stable Diffusion have been shared openly by several people, and Katherine Crowson, lead developer at Stability AI, has shared numerous photographs on Twitter. The effects that AI-based picture synthesis will have on artists and the art world worry some observers. Stable Diffusion was released the same week that an AI-generated piece of art took home the top honour in the Colorado State Fair’s art competition. Stable Diffusion’s source code is accessible on [GitHub][1].

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/image-generation-model-stable-diffusion-is-now-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://github.com/CompVis/stable-diffusion
