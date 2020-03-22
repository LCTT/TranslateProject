[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 open hardware projects working to solve COVID-19)
[#]: via: (https://opensource.com/article/20/3/open-hardware-covid19)
[#]: author: (Harris Kenny https://opensource.com/users/harriskenny)

7 open hardware projects working to solve COVID-19
======
Open hardware solutions can prevent the spread and suffering of the
novel coronavirus.
![open on blue background with heartbeat symbol][1]

The open source [hardware][2] movement has long championed the importance of the right to repair, fully own the technology you buy, and be able to remix and reproduce gadgets, just like you can with music. And so, during this challenging time, open hardware is providing some answers to some of the problems created by the coronavirus pandemic.

### An overview of what's happening

For one, hardware developers around the world are working to resolve supply chain weaknesses using open source, the same philosophy that has driven a proliferation of new software technologies over the last 30 years. The hardware movement's past successes include the [RepRap Project][3], [Open Source Ecology][4], and [Open Source Beehives][5], proving this can be done.

There has been increasing interest in creators using 3D printing and other technologies to create replacement parts for and manufacturing of safety equipment on demand. For example, the Polytechnic University lab in Hong Kong [3D printed face shields][6] for hospital workers. And Italian startup Isinnova partnered with the FabLab in Milan to [3D-print replacement valves][7] for reanimation devices in hard-hit Northern Italy. Companies are also releasing designs to adapt our physical interactions, like this [3D printed hands-free door opener][8] from Materialise. These examples of replacing parts and solving problems are an excellent start and appear to be saving lives.

Another traditional hardware technique is picking up steam: sewing. The AFP reports that there is an acute need for face masks around the world and guidance from the World Health Organization about their importance. With single-use, disposable masks being prioritized for healthcare workers, in the Czech Republic people are [taking to sewing to make their own masks][9]. (Repeat-use masks do introduce sterility concerns.) The Facebook group "Czechia sews face masks" started to address this problem in their country, with tens of thousands of members using their at-home sewing machines.

Open source hardware equipment and machinery projects are also gaining traction. First, there is testing equipment that is sophisticated and highly capable. Next, there is medical equipment that can be categorized as field-grade (at best) for scenarios with no other option. These projects are outlined in detail below.

To learn more, I spoke with Jason Huggins, founder and CEO of Chicago-based [Tapster Robotics][10]. Tapster Robotics designs and manufactures desktop robots using 3D printing, computer numerical control (CNC) machining, and open electronics like [Arduino][11]. He has both the technical know-how and the industrial capacity to make an impact. And he wants to commit his company's resources to help in this fight.

"Basically, we're in a World War II mobilization moment right now. Even though I'm not a doctor, we should still all follow the Hippocratic Oath. Whatever I do, I don't want to make the problem worse," Huggins explains. "As a counterpoint, there is WHO executive director Dr. Michael Ryan's comment: 'Speed trumps perfection,'" Huggins argues.

> Wow.
>
> This man is the global authority on the spread of disease. If you are a leader (in any capacity) watch this. If you are not, watch it too. [pic.twitter.com/bFogaekehM][12]
>
> — Jim Richards Sh🎙wgram (@JIMrichards1010) [March 15, 2020][13]

Huggins has extensive experience with delivering during times of need. His efforts were instrumental in helping [Healthcare.gov][14] scale after its challenging initial launch. He also created the software industry-standard testing frameworks Selenium and Appium. With this experience, his advice is well worth considering.

I also spoke with Seattle-based attorney Mark Tyson of [Tyson Law][15], who works with startups and small businesses. He has direct experience working with nimble companies in rapidly evolving industries. In framing the overall question, Tyson begins:

> Good Samaritan laws protect volunteers—i.e., “Good Samaritans”—from being held liable as a result of their decision to give aid during an emergency. While the specifics of these laws vary by state, they share a common public policy rationale: namely, encouraging bystanders to help others facing an emergency. Conceivably, this rationale could justify application of these types of laws in less traditional settings than, say, pulling the victim of a car accident out of harm’s way.

Applying this specific situation, Tyson notes:

> "Before taking action, creators would be wise to speak with an attorney to conduct a state-specific risk assessment. It would also be prudent to ask larger institutions, like hospitals or insurers, to accept potential liability exposure via contract—for instance, through the use of indemnification agreements, whereby the hospital or its insurer agrees to indemnify the creator for liability."

Tyson understands the urgency and gravity of the situation. This option to use contracts is not meant to be a roadblock; instead, it may be a way to help adoption happen at scale to make a bigger difference faster. It is up to you or your organization to make this determination.

With all that said, let's explore the projects that are in use or in development (and may be available for deployment soon).

### 7 open hardware projects fighting COVID-19

#### Opentrons

[Opentrons][16]' open source lab automation platform is comprised of a suite of open source hardware, verified labware, consumables, reagents, and workstations. Opentrons says its products can help dramatically [scale-up COVID-19 testing][17] with systems that can "automate up to 2,400 tests per day within days of an order being placed." It plans to ramp up to 1 million tested samples by July 1.

![Opentrons roadmap graphic][18]

From the Opentrons [website][17], Copyright

The company is already working with federal and local government agencies to determine if its systems can be used for clinical diagnosis under an [emergency use authorization][19]. Opentrons is shared under an [Apache 2.0 license][20]. I first learned of it from biologist Kristin Ellis, who is affiliated with the project.

#### Chai Open qPCR

Chai's [Open qPCR][21] device uses [polymerase chain reaction][22] (PCR) to rapidly test swabs from surfaces (e.g., door handles and elevator buttons) to see if the novel coronavirus is present. This open source hardware shared under an [Apache 2.0 license][23] uses a [BeagleBone][24] low-power Linux computer. Data from the Chai Open qPCR can enable public health, civic, and business leaders to make more informed decisions about cleaning, mitigation, facility closures, contract tracing, and testing.

#### OpenPCR

[OpenPCR][25] is a PCR testing device kit from Josh Perfetto and Jessie Ho, the creators behind the Chai Open qPCR. This is more of a DIY open source device than their previous project, but it has the same use case: using environmental testing to identify the coronavirus in the field. As the project page states, "traditional real-time PCR machines capable of detecting these pathogens typically cost upwards of $30,000 US dollars and are not suitable for field usage." Because OpenPCR is a kit users build and is shared under a [GPLv3.0 license][26], the device aims to democratize access to molecular diagnostics.

![OpenPCR][27]

From the OpenPCR [website][25], Copyright

And, like any good open source project, there is a derivative! [WildOpenPCR][28] by [GaudiLabs][29] in Switzerland is also shared under a [GPLv3.0 license][30].

#### PocketPCR

Gaudi Labs' [PocketPCR][31] thermocycler is used to activate biological reactions by raising and lowering the temperature of a liquid in small test tubes. It can be powered with a simple USB power adapter, either tethered to a device or on its own, with preset parameters that don't require a computer or smartphone.

![PocketPCR][32]

From the PocketPCR [website][31], Copyright

Like the other PCR options described in this article, this device may facilitate environmental testing for coronavirus, although its project page does not explicitly state so. PocketPCR is shared under a [GPLv3.0 license][33].

#### Open Lung Low Resource Ventilator

The [Open Lung Low Resource Ventilator][34] is a quick-deployment ventilator that utilizes a [bag valve mask][35] (BVM), also known as an Ambu-bag, as a core component. Ambu-bags are mass-produced, certified, small, mechanically simple, and adaptable to both invasive tubing and masks. The OPEN LUNG ventilator will use micro-electronics to sense and control air pressure and flow, with the goal to enable semi-autonomous operation.

![Open Lung ventilator][36]

Open Lung [on GitLab][37]

This early-stage project boasts a large team with hundreds of contributors, led by: Colin Keogh, David Pollard, Connall Laverty, and Gui Calavanti. It is shared under a [GPLv3.0 license][38].

#### Pandemic Ventilator

The [Pandemic Ventilator][39] is a DIY ventilator prototype. Like the RepRap project, it uses commonly available hardware components in its design. The project was uploaded by user Panvent to Instructables more than 10 years ago, and there are six major steps to producing it. The project is shared under a [CC BY-NC-SA license][39]. This video shows the system in action:

#### Folding at Home

[Folding at Home][40] is a distributed computing project for simulating protein dynamics, including the process of protein folding and the movements of proteins implicated in a variety of diseases. It is a call-to-action for citizen scientists, researchers, and volunteers to use their computers at home to help run simulations, similar to the decommissioned [SETI@Home project][41]. If you're a technologist with capable computer hardware, Folding at Home is for you.

![Markov state model][42]

Vincent Voelz, CC BY-SA 3.0

Folding at Home uses Markov state models (shown above) to model the possible shapes and folding pathways a protein can take in order to look for new therapeutic opportunities. You can find out more about the project in Washington University biophysicist Greg Bowman's post on [how it works and how you can help][43].

The project involves a consortium of academic laboratories, contributors, and corporate sponsors from many countries, including Hong Kong, Croatia, Sweden, and the United States. Folding at Home is shared under a [mix of GPL and proprietary licenses][44] on [GitHub][45] and is multi-platform for Windows, macOS, and GNU/Linux (e.g., Debian, Ubuntu, Mint, RHEL, CentOS, Fedora).

### Many other interesting projects

These projects are just a fraction of the activity happening in the open hardware space to solve or treat COVID-19. In researching this article, I discovered other projects worth exploring, such as:

  * [Open source ventilators, oxygen concentrators, etc.][46] by Coronavirus Tech Handbook
  * [Helpful engineering][47] by ProjectOpenAir
  * [Open source ventilator hackathon][48] on Hackaday
  * [Specifications for simple open source mechanical ventilator][49] by Johns Hopkins emergency medicine resident Julian Botta
  * [Coronavirus-related phishing, malware, and randomware on the rise][50] by Shannon Morse
  * [Converting a low-cost CPAP blower into a rudimentary ventilator][51] by jcl5m1
  * [Forum A.I.R.E. discussion on open respirators and fans][52] (Spanish/español)
  * [Special Issue on Open-Source COVID19 Medical Hardware][53] by Elsevier HardwareX



These projects are based all over the world, and this type of global cooperation is exactly what we need, as the virus ignores borders. The novel coronavirus pandemic affects countries at different times and in different ways, so we need a distributed approach.

As my colleague Steven Abadie and I write in the [OSHdata 2020 Report][54], the open source hardware movement is a global movement. Participating individuals and organizations with certified projects are located in over 35 countries around the world and in every hemisphere.

![Open source hardware map][55]

OSHdata, CC BY-SA 4.0 International

If you are interested in joining this conversation with open source hardware developers around the world, join the [Open Hardware Summit Discord][56] server with a dedicated channel for conversations about COVID-19. You can find roboticists, designers, artists, firmware and mechanical engineers, students, researchers, and others who are fighting this war together. We hope to see you there.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-hardware-covid19

作者：[Harris Kenny][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/harriskenny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/health_heartbeat.png?itok=P-GXea-p (open on blue background with heartbeat symbol)
[2]: https://opensource.com/resources/what-open-hardware
[3]: https://reprap.org/wiki/RepRap
[4]: https://www.opensourceecology.org/
[5]: https://www.osbeehives.com/
[6]: https://www.scmp.com/news/hong-kong/health-environment/article/3052135/polytechnic-university-lab-3d-printing-face
[7]: https://www.3dprintingmedia.network/covid-19-3d-printed-valve-for-reanimation-device/
[8]: https://www.3dprintingmedia.network/materialise-shows-3d-printed-door-opener-for-coronavirus-containment-efforts/
[9]: https://news.yahoo.com/stitch-time-czechs-sew-combat-virus-mask-shortage-205213804.html
[10]: http://tapster.io/
[11]: https://opensource.com/life/15/5/arduino-or-raspberry-pi
[12]: https://t.co/bFogaekehM
[13]: https://twitter.com/JIMrichards1010/status/1239140710558969857?ref_src=twsrc%5Etfw
[14]: http://Healthcare.gov
[15]: https://www.marktysonlaw.com/
[16]: https://opentrons.com/
[17]: https://blog.opentrons.com/testing-for-covid-19-with-opentrons/
[18]: https://opensource.com/sites/default/files/uploads/opentrons.png (Opentrons roadmap graphic)
[19]: https://www.fda.gov/regulatory-information/search-fda-guidance-documents/policy-diagnostics-testing-laboratories-certified-perform-high-complexity-testing-under-clia-prior
[20]: https://github.com/Opentrons/opentrons/blob/edge/LICENSE
[21]: https://www.chaibio.com/openqpcr
[22]: https://en.wikipedia.org/wiki/Polymerase_chain_reaction
[23]: https://github.com/chaibio/chaipcr
[24]: https://beagleboard.org/bone
[25]: https://openpcr.org/
[26]: https://github.com/jperfetto/OpenPCR/blob/master/license.txt
[27]: https://opensource.com/sites/default/files/uploads/openpcr.png (OpenPCR)
[28]: https://github.com/GenericLab/WildOpenPCR
[29]: http://www.gaudi.ch/GaudiLabs/?page_id=328
[30]: https://github.com/GenericLab/WildOpenPCR/blob/master/license.txt
[31]: http://gaudi.ch/PocketPCR/
[32]: https://opensource.com/sites/default/files/uploads/pocketpcr.png (PocketPCR)
[33]: https://github.com/GaudiLabs/PocketPCR/blob/master/LICENSE
[34]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor
[35]: https://en.wikipedia.org/wiki/Bag_valve_mask
[36]: https://opensource.com/sites/default/files/uploads/open-lung.png (Open Lung ventilator)
[37]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor/-/blob/master/images/CONCEPT_1_MECH.png
[38]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor/-/blob/master/LICENSE
[39]: https://www.instructables.com/id/The-Pandemic-Ventilator/
[40]: https://foldingathome.org/
[41]: https://setiathome.ssl.berkeley.edu/
[42]: https://opensource.com/sites/default/files/uploads/foldingathome.png (Markov state model)
[43]: https://foldingathome.org/2020/03/15/coronavirus-what-were-doing-and-how-you-can-help-in-simple-terms/
[44]: https://en.wikipedia.org/wiki/Folding@home
[45]: https://github.com/FoldingAtHome
[46]: https://coronavirustechhandbook.com/hardware
[47]: https://app.jogl.io/project/121#about
[48]: https://hackaday.com/2020/03/12/ultimate-medical-hackathon-how-fast-can-we-design-and-deploy-an-open-source-ventilator/
[49]: https://docs.google.com/document/d/1FNPwrQjB1qW1330s5-S_-VB0vDHajMWKieJRjINCNeE/edit?fbclid=IwAR3ugu1SGMsacwKi6ycAKJFOMduInSO4WVM8rgmC4CgMJY6cKaGBNR14mpM
[50]: https://www.youtube.com/watch?v=dmQ1twpPpXA
[51]: https://github.com/jcl5m1/ventilator
[52]: https://foro.coronavirusmakers.org/
[53]: https://www.journals.elsevier.com/hardwarex/call-for-papers/special-issue-on-open-source-covid19-medical-hardware
[54]: https://oshdata.com/2020-report
[55]: https://opensource.com/sites/default/files/uploads/oshdata-country.png (Open source hardware map)
[56]: https://discord.gg/duAtG5h
