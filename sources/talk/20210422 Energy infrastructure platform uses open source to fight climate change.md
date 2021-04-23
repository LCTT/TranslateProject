[#]: subject: (Energy infrastructure platform uses open source to fight climate change)
[#]: via: (https://opensource.com/article/21/4/seapath-open-energy-infrastructure)
[#]: author: (Dr. Shuli Goodman https://opensource.com/users/shuligoodman)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Energy infrastructure platform uses open source to fight climate change
======
SEAPATH is a Linux Foundation project that aims to modernize the power
grid through an open energy infrastructure.
![Light bulb][1]

LF Energy is a Linux Foundation project working to accelerate the energy transition of the world's grids and transportation systems through open source. In December, our project took a major step toward achieving its mission when we and our member organizations Alliander, RTE, and Savoir-faire Linux launched [SEAPATH][2], which stands for Software Enabled Automation Platform and Artifacts.

SEAPATH is a reference design and a real-time, open source platform for grid operators to run virtualized automation and protection applications. It is the second project for LF Energy's [Digital Substation Automation Systems][3] initiative and a vital step toward adopting renewable energy on the power grid. It will accelerate the grid's decarbonization, helping lead the planet to [carbon neutrality by 2050][4]. Power system transformation [leads all efforts for decarbonization][5]; it's the _key_ enabler for fighting climate change.

### Breaking down silos

Coordinating power generation, distribution, and transmission systems is a critical component of a green grid.

Currently, the grid's infrastructure operates on a centralized, point-to-point framework, requiring a source like a gas- or coal-fired power plant to distribute electricity. Essentially, the grid was built on a foundation of silos with different systems for energy generation, transmission, and distribution. However, due to the high variability of renewable energy—power can be produced only when the sun shines or the wind blows—it's difficult to integrate clean energy sources into siloed systems. The [increasing use of electric vehicles][6] is also causing power supply and demand fluctuations.

These challenges make it difficult for grid operators to control and optimize renewable sources of energy. Furthermore, the grid's infrastructure isn't sustainable for a clean energy future. In fact, the grid of the future will not be a grid at all. Rather, power system networks will process tsunamis of data that enable the orchestration, choreography, and coordination of energy supply and demand. The future energy framework will operate like the internet, digitally connecting thousands of power systems and processing data from their substations to generate, transmit, and distribute electricity.

### Interoperability through open source

In working toward clean energy integration, grid operators use digital substations, which require a growing number of computational devices to support field sensors, applications, and automation technologies.

Typically, these components are provided by multiple proprietary solutions, making interoperability difficult due to redundant hardware requirements. This challenge largely correlates with vendor lock-in throughout the energy industry. US regulators allow utility companies to sign [50-plus year contracts][7] that secure their place in specified regions. As a result, utilities use proprietary solutions for their portion of the grid, making interoperability between substations difficult. In March 2021, we launched [FledgePOWER][8], a new project that seeks to address this problem.

Solutions do not always share the same specifications, but they often handle similar data. Implementing new solutions is costly, creates technical debt, and is time-consuming. To manage these heterogeneous environments, operators tend to run deprecated legacy systems for decades. With the speed of change increasing, network operations have become increasingly complex, less flexible, and more expensive to operate. Being able to abstract this complexity offers system and network operators new tools for interoperability in a rapidly transforming environment.

SEAPATH's goal is similar to the Linux Foundation's [OpenDaylight project][9], an open source initiative that catapulted software virtualization for telecommunication networks and set the industry standard for software-defined network infrastructure. SEAPATH aims to apply the same technology OpenDaylight uses to consolidate multi-provider systems on the grid into one platform. This aims to enable operators to digitally implement electricity distribution and transmission through data from their substations. This consolidation also supports time- and cost-efficiency, scalability, flexibility, innovation, and novel technology implementations and merging utility practices.

Through cross-industry collaboration with SEAPATH, the energy sector can build customer- and vendor-agnostic virtualization technologies required by a modern, climate-conscious grid. The more flexible and scalable the grid can be for greener energy, the faster we can reach decarbonization.

### How to get involved with SEAPATH

If you are interested in learning more about SEAPATH or joining the project, here's how you can get involved:

  * **Learn about SEAPATH:** Check out LF Energy's [SEAPATH project page][2] to learn more about the initiative. We have a technical steering committee (TSC), a mailing list, open meetings, a wiki feed, and a roadmap that can help answer any questions you may have about the project.
  * **Use SEAPATH:** To access SEAPATH, you must be a member of LF Energy. Organizations can join by [becoming a member][10]. LF Energy is funded through membership dues and contributions of engineering resources. Once registered, you can access SEAPATH on its [GitHub page][11]. If you can't join as an LF Energy member, we still encourage you to contribute by participating in technical projects and discussion lists.



Time is running out for the energy industry to come together and improve the grid for our future. By joining as partners, the entire energy industry—and the entire world—can benefit from a grid powered by green energy for a brighter future.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/seapath-open-energy-infrastructure

作者：[Dr. Shuli Goodman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shuligoodman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bulb-light-energy-power-idea.png?itok=zTEEmTZB (Light bulb)
[2]: https://www.lfenergy.org/projects/seapath/
[3]: https://wiki.lfenergy.org/display/HOME/Digital+Substation+Automation+Systems+%28DSAS%29+Initiative
[4]: https://grist.org/climate/yes-the-u-s-can-go-carbon-neutral-by-2050-says-new-princeton-study/
[5]: https://e360.yale.edu/features/deep-decarbonization-a-realistic-way-forward-on-climate-change
[6]: https://www.iea.org/reports/global-ev-outlook-2020
[7]: https://apnews.com/article/7393a2dd5c69f590a8e7db3d19f1e240
[8]: https://www.lfenergy.org/projects/fledgepower/
[9]: https://opensource.com/business/14/10/opendaylight-helium-gets-out-gate
[10]: https://www.lfenergy.org/join/
[11]: https://github.com/seapath
