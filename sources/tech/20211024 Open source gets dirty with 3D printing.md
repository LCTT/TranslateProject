[#]: subject: "Open source gets dirty with 3D printing"
[#]: via: "https://opensource.com/article/21/10/open-source-soil-science"
[#]: author: "Joshua Pearce https://opensource.com/users/jmpearce"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source gets dirty with 3D printing
======
3D printing and open source technology enable advanced research for soil
science.
![Green sprout grass in dirt soil][1]

Open source has touched a lot of scientific disciplines, but one area where it is missing is soil science. Until recently, you could only find it [in educational materials][2]. A team from the Université de Lorraine, INRAE in France, and Western University in Canada [bring open source to the soil science community][3].

Soil science experiments saw significant impact by the technological advances developed over the past decades. However, support for these experiments evolved very slowly, and soil science literally languished in the dirt. Researchers still take soil samples in the "traditional" way from specific fields. For this purpose, agricultural researchers determine which areas might contain the most suitable soil for an experiment in advance. This method leads to many approximations and uncontrolled parameters, which significantly complicates the analysis of the results. Thus, some studies require identical replicates. 3D printing offers an excellent opportunity to meet this need.

![Collecting soil samples][4]

Farmer-scientist field collaboration in collecting soil
and plant samples ([Flickr][5], [CC BY-NC-SA 4.0][6])

Modeling a porous structure for soil science must consider a combination of specifications (nature of the material, porosity, and location of specific substances or living organisms). In addition, using an engineering design approach improves the modeling process, and these become customizable and reproducible models—some of the bedrock properties of open source science. The model's main characteristics are identified and studied according to the complexity of the specific soil phenomena. With that modeling, you can achieve a design approach for defining a manufacturing process.

One main challenge to support this design approach is developing software that allows soil scientists to create soil models according to their needs in terms of the soil structure. This software should be dedicated to scientific research and promote data sharing and exchange across an international community.

Reproducing soil samples digitally helps academics and researchers conduct reproducible and participatory research networks that help better understand the specific soil parameters. One of the most critical challenges for soil modeling is the manufacturing of a soil structure. Until now, the most widespread method to replicate porous soil structures is using X-ray tomography to scan an actual sample. This process is expensive and time-consuming and does not readily provide an approach to customization. A new open source approach makes it possible for any soil scientist to design a porous soil structure. It is based on mathematical models rather than the dirty samples themselves—allowing researchers to design and parameterize their samples according to their desired experiments.

![Settings and model of monolith with mix of different grain sizes][7]

Settings and model of monolith with mix of different
grain sizes (Joshua Pearce, [CC BY-SA 4.0][8])

Developing an open source toolchain using a [Lua script][9], in the [IceSL][10] slicer with a GUI enables researchers to create and configure their digital soil models, called monoliths. Done without using meshing algorithms or STereoLithography (STL) files because those reduce the model's resolution. 

Monolith examples are fabricated in polylactic acid using [open source fused filament fabrication technology][11] with a layer thickness of 0.20, 0.12, and 0.08 mm. The images generated from the digital model slicing are analyzed using open source [ImageJ][12] software. ImageJ provides information about internal geometrical shape (porosity, tortuosity, grain size distribution, and hydraulic conductivities). The results show that the developed script enables designing reproducible numerical models that imitate soil structures with defined pore and grain sizes in a range between coarse sand (from 1 mm diameter) to fine gravel (up to 12 mm diameter).

![Monolith with offset root system][13]

Monolith with offset root system 
(Joshua Pearce, [CC BY-SA 4.0][8])

Samples generated using the developed script would be expected to increase reproducibility and be more accessible because of the open source and low-cost methods involved.

You can read the complete open access study here: [Open-Source Script for Design and 3D Printing of Porous Structures for Soil Science][14] by Romain Bedell, Alaa Hassan, Anne-Julie Tinet, Javier Arrieta-Escobar, Delphine Derrien, Marie-France Dignac, Vincent Boly, Stéphanie Ouvrard, and Joshua M. Pearce 2021, published in _Technologies_ 9, no. 3: 67.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/open-source-soil-science

作者：[Joshua Pearce][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/roman-synkevych-unsplash.jpg?itok=lIeB57IW (Green sprout grass in dirt soil)
[2]: https://doi.org/10.4195/nse2017.06.0013
[3]: https://doi.org/10.3390/technologies9030067
[4]: https://opensource.com/sites/default/files/uploads/collecting_soil_samples.jpg (Collecting soil samples)
[5]: https://www.flickr.com/photos/cgiarclimate/38600771315/in/photostream/
[6]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/monolith-w-mix-grain-sizes.png (Settings and model of monolith with mix of different grain sizes)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://github.com/RomainBedell/Porous_medium_generator
[10]: https://icesl.loria.fr/
[11]: https://www.reprap.org/wiki/RepRap
[12]: https://imagej.nih.gov/ij/
[13]: https://opensource.com/sites/default/files/uploads/monolith-w-offset-roots.png (Monolith with offset root system)
[14]: https://www.mdpi.com/2227-7080/9/3/67
