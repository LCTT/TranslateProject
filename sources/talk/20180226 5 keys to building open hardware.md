translating by kennethXia

5 keys to building open hardware
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openhardwaretools.png?itok=DC1RC_1f)

The science community is increasingly embracing free and open source hardware ([FOSH][1]). Researchers have been busy [hacking their own equipment][2] and creating hundreds of devices based on the distributed digital manufacturing model to advance their scientific experiments.

A major reason for all this interest in distributed digital manufacturing of scientific FOSH is money: Research indicates that FOSH [slashes costs by 90% to 99%][3] compared to proprietary tools. Commercializing scientific FOSH with [open hardware business models][4] has supported the rapid growth of an engineering subfield to develop FOSH for science, which comes together annually at the [Gathering for Open Science Hardware][5].

Remarkably, not one, but [two new academic journals][6] are devoted to the topic: the [Journal of Open Hardware][7] (from Ubiquity Press, a new open access publisher that also publishes the [Journal of Open Research Software][8] ) and [HardwareX][9] (an [open access journal][10] from Elsevier, one of the world's largest academic publishers).

Because of the academic community's support, scientific FOSH developers can get academic credit while having fun designing open hardware and pushing science forward faster.

### 5 steps for scientific FOSH

Shane Oberloier and I co-authored a new [article][11] published in Designs, an open access engineering design journal, about the principles of designing FOSH scientific equipment. We used the example of a slide dryer, fabricated for under $20, which costs up to 300 times less than proprietary equivalents. [Scientific][1] and [medical][12] equipment tends to be complex with huge payoffs for developing FOSH alternatives.

I've summarized the five steps (including six design principles) that Shane and I detail in our Designs article. These design principles can be generalized to non-scientific devices, although the more complex the design or equipment, the larger the potential savings.

If you are interested in designing open hardware for scientific projects, these steps will maximize your project's impact.

  1. Evaluate similar existing tools for their functions but base your FOSH design on replicating their physical effects, not pre-existing designs. If necessary, evaluate a proof of concept.


  2. Use the following design principles:


  * Use only free and open source software toolchains (e.g., open source CAD packages such as [OpenSCAD][13], [FreeCAD][14], or [Blender][15]) and open hardware for device fabrication.
  * Attempt to minimize the number and type of parts and the complexity of the tools.
  * Minimize the amount of material and the cost of production.
  * Maximize the use of components that can be distributed or digitally manufactured by using widespread and accessible tools such as the open source [RepRap 3D printer][16].
  * Create [parametric designs][17] with predesigned components, which enable others to customize your design. By making parametric designs rather than solving a specific case, all future cases can also be solved while enabling future users to alter the core variables to make the device useful for them.
  * All components that are not easily and economically fabricated with existing open hardware equipment in a distributed fashion should be chosen from off-the-shelf parts that are readily available throughout the world.


  3. Validate the design for the targeted function(s).


  4. Meticulously document the design, manufacture, assembly, calibration, and operation of the device. This should include the raw source of the design, not just the files used for production. The Open Source Hardware Association has extensive [guidelines][18] for properly documenting and releasing open source designs, which can be summarized as follows:


  * Share design files in a universal type.
  * Include a fully detailed bill of materials, including prices and sourcing information.
  * If software is involved, make sure the code is clear and understandable to the general public.
  * Include many photos so that nothing is obscured, and they can be used as a reference while manufacturing.
  * In the methods section, the entire manufacturing process must be detailed to act as instructions for users to replicate the design.
  * Share online and specify a license. This gives users information on what constitutes fair use of the design.


  5. Share aggressively! For FOSH to proliferate, designs must be shared widely, frequently, and noticeably to raise awareness of their existence. All documentation should be published in the open access literature and shared with appropriate communities. One nice universal repository to consider is the [Open Science Framework][19], hosted by the Center for Open Science, which is set up to take any type of file and handle large datasets.



This article was supported by [Fulbright Finland][20], which is sponsoring Joshua Pearce's research in open source scientific hardware in Finland as the Fulbright-Aalto University Distinguished Chair.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/5-steps-creating-successful-open-hardware

作者：[Joshua Pearce][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jmpearce
[1]:https://opensource.com/business/16/4/how-calculate-open-source-hardware-return-investment
[2]:https://opensource.com/node/16840
[3]:http://www.appropedia.org/Open-source_Lab
[4]:https://www.academia.edu/32004903/Emerging_Business_Models_for_Open_Source_Hardware
[5]:http://openhardware.science/
[6]:https://opensource.com/life/16/7/hardwarex-open-access-journal
[7]:https://openhardware.metajnl.com/
[8]:https://openresearchsoftware.metajnl.com/
[9]:https://www.journals.elsevier.com/hardwarex
[10]:https://opensource.com/node/30041
[11]:https://www.academia.edu/35603319/General_Design_Procedure_for_Free_and_Open-Source_Hardware_for_Scientific_Equipment
[12]:https://www.academia.edu/35382852/Maximizing_Returns_for_Public_Funding_of_Medical_Research_with_Open_source_Hardware
[13]:http://www.openscad.org/
[14]:https://www.freecadweb.org/
[15]:https://www.blender.org/
[16]:http://reprap.org/
[17]:https://en.wikipedia.org/wiki/Parametric_design
[18]:https://www.oshwa.org/sharing-best-practices/
[19]:https://osf.io/
[20]:http://www.fulbright.fi/en
