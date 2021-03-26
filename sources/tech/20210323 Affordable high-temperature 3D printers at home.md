[#]: subject: (Affordable high-temperature 3D printers at home)
[#]: via: (https://opensource.com/article/21/3/desktop-3d-printer)
[#]: author: (Joshua Pearce https://opensource.com/users/jmpearce)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Affordable high-temperature 3D printers at home
======
How affordable? Under $1,000 USD
![High-temperature 3D-printed mask][1]

3D printers have been around since the 1980s, but they didn't gain popular attention until they became open source, thanks to the [RepRap][2] project. RepRap stands for self-replicating rapid prototyper; it's a 3D printer that can largely print itself. The open source plans were released [in 2004][3] and led to 3D printer costs dropping from hundreds of thousands of dollars to a few hundred dollars.

These open source desktop tools have been limited to low-performance, low-temperature thermoplastics like ABS (e.g., Lego blocks). There are several high-temperature printers on the market, but their high costs (tens to hundreds of thousands of dollars) make them inaccessible to most people. They didn't have a lot of competition until recently because they were locked up by a patent (US6722872B1), which [expired][4] on February 27, 2021.

With this roadblock removed, we are about to see an explosion of high-temperature, low-cost, fused-filament 3D printers.

How low? How about under $1,000.

During the height of the pandemic, my team rushed to publish designs for an [open source high-temperature 3D printer][5] for manufacturing heat-sterilizable personal protective equipment (PPE). The project's idea is to enable people [to print PPE][6] (e.g., masks) with high-temperature materials and pop them in their home oven to sterilize them. We call our device the Cerberus, and it has the following features:

  1. 200°C capable heated bed
  2. 500°C capable hot end
  3. Isolated heated chamber with 1kW space heater core
  4. Mains (AC power) voltage chamber and bed heating for rapid start



You can build this project from readily available parts, some of which you can print, for under $1,000. It successfully prints polyetherketoneketone (PEKK) and polyetherimide (PEI, which sells under the trade name Ultem). Both materials are much stronger than anything that can be printed today on low-cost printers.

![PPE printer][7]

(J.M.Pearce, [GNU Free Documentation License][8])

The high-temperature 3D printer was designed to have three heads, but we released it with only one. The Cerberus is named after Greek mythology's three-headed watchdog of the underworld. Normally we would not have released the printer with only one head, but the pandemic shifted our priorities. The [open source community rallied][9] to help solve supply deficits early on, and many desktop 3D printers were spitting out useful products to help protect people from COVID.

What about the other two heads?

The other two heads were intended for high-temperature fused particle fabricators (e.g., the high-temperature version of this open source [3D printer hack][10]) and laying in metal wire (like in [this design][11]) to build an open source heat exchanger. Other functionalities for the Cerberus printer might be an automatic nozzle cleaner and a method to print continuous fibers at high temperatures. Also, you can mount anything you like on the turret to manufacture high-end products.

The expiration of the [obvious patent][12] for putting a box around a 3D printer while leaving the electronics on the outside paves the way for high-temperature home 3D printers, which will enable these devices to graduate from mere toys to industrial tools at reasonable costs.

Companies are already building on the RepRap tradition and bringing these low-cost systems to the market (e.g., the $1,250 [Creality3D CR-5 Pro][13] 3D printer that can get to 300°C). Creality sells the most popular desktop 3D printer and has open sourced some of its designs.

To print super-high-end engineering polymers, however, these printers will need to get over 350°C. Open source plans are already available to help desktop 3D printer manufacturers start competing with the lumbering companies that have held back 3D printing for 20 years as they hid behind patents. Expect the competition for low-cost, high-temperature desktop 3D printers to really heat up!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/desktop-3d-printer

作者：[Joshua Pearce][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/3d_printer_mask.jpg?itok=5ePZghTW (High-temperature 3D-printed mask)
[2]: https://reprap.org/wiki/RepRap
[3]: https://reprap.org/wiki/Wealth_Without_Money
[4]: https://3dprintingindustry.com/news/stratasys-heated-build-chamber-for-3d-printer-patent-us6722872b1-set-to-expire-this-week-185012/
[5]: https://doi.org/10.1016/j.ohx.2020.e00130
[6]: https://www.appropedia.org/Open_Source_High-Temperature_Reprap_for_3-D_Printing_Heat-Sterilizable_PPE_and_Other_Applications
[7]: https://opensource.com/sites/default/files/uploads/ppe-hight3dp.png (PPE printer)
[8]: https://www.gnu.org/licenses/fdl-1.3.html
[9]: https://opensource.com/article/20/3/volunteer-covid19
[10]: https://www.liebertpub.com/doi/10.1089/3dp.2019.0195
[11]: https://www.appropedia.org/Open_Source_Multi-Head_3D_Printer_for_Polymer-Metal_Composite_Component_Manufacturing
[12]: https://www.academia.edu/17609790/A_Novel_Approach_to_Obviousness_An_Algorithm_for_Identifying_Prior_Art_Concerning_3-D_Printing_Materials
[13]: https://creality3d.shop/collections/cr-series/products/cr-5-pro-h-3d-printer
