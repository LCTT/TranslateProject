[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (BLM Effect: Linux Kernel to Adopt an Inclusive Code Language, Blocks Terms like Blacklist-Whitelist and Master-Slave)
[#]: via: (https://itsfoss.com/linux-kernel-inclusive-code/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

BLM Effect: Linux Kernel to Adopt an Inclusive Code Language, Blocks Terms like Blacklist-Whitelist and Master-Slave
======

You probably are aware of the Black Lives Matter (BLM) movement that started in the US. After the [George Floyd case][1], the BLM movement has gone global.

This recent wave of BLM movement has inspired people to erase terms, names, statues that have racist legacy.

Some [businesses have change their product names][2]. Aunt Jemima, Mrs Butterworth’s, Uncle Ben’s, Eskimo Pie are [some of the examples][3].

Movies trivializing or casually bypassing racism are being [removed from the streaming websites][4]. That includes classic movies like Gone With the Wind.

The tech industry is not behind. They have started to adapt for more inclusive language, even in their coding style.

### What is inclusive language?

![][5]

[Inclusive language][6] aims to avoid expressions and terms that are racist, sexist, biased, prejudiced or demeaning to any particular group of people.

Inclusive language encourages the use of terms like staffing instead of manpower, homemaker instead of housewives, differently abled instead of disabled, health care consumer instead of patient, pet parent instead of pet owner.

### Inclusive language in tech industry

Using inclsuive language in code in not a recent phenomenon. Open source Drupal has [replaced master-slave with primary-replica four years ago][7]. Python also [dropped master-slave terminology][8] two years back.

But thanks to the BLM movement, more organizations in the tech industry are considering to change their policies to adopt the inclusive language.

Microsoft’s [GitHub is replacing terms][9] like master-slave, blacklist-whitelist. Twitter has gone ahead and shared a list of their list of inclusive language that even replaces terms like ‘sanity check’.

> We’re starting with a set of words we want to move away from using in favor of more inclusive language, such as: [pic.twitter.com/6SMGd9celn][10]
>
> — Twitter Engineering (@TwitterEng) [July 2, 2020][11]

Calls for replacing the blackhat, whitehat, man in the middle terms in hacking industry is also gaining momentum.

> Black hat and white hat are terms that need to change. This has nothing to do with their original meaning, and it’s not about race alone – we also need sensible gender-neutral changes like PITM vs. MITM.
>
> — David Kleidermacher (@DaveKSecure) [July 3, 2020][12]

### Linux kernel is implementing inclusive coding language

The Linux Kernel is not behind in adopting the new industry trend. Linux kernel maintainer from Intel, Dan Williams, has [shared a proposal][13] to introduce inclusive terminology in Linux kernel’s official coding-style document.

The guideline suggests avoiding terms like slave and blacklist. The suggested replacement for the term slave are secondary, subordinate, replica, responder, follower, proxy or performer. Recommended replacements for blacklist are ‘blocklist’ or ‘denylist’.

The guideline will be applicable to the new code being pushed to the kernel with hope of changing existing code to remove noninclusive terminology in the future.

Exceptions for introducing new usage is to maintain a userspace ABI, or when updating code for an existing (as of 2020) hardware or protocol specification that mandates those terms.

The proposal is already signed off by senior kernel maintainers Chris Mason and Greg Kroah-Hartman.

### Blacklist? Is it really a racist term?

People do wonder if blacklist is really a racist word. As Dan Williams point out in the proposal, etymologically, the term doesn’t have a racist connection. He points out:

> Realize that the replacement only makes sense if you have been socialized with the concepts that ‘red/green’ implies ‘stop/go’. Colors to represent a policy requires an indirection. The socialization of ‘black/white’ to have the connotation of ‘impermissible/permissible’ does not support inclusion.

This is true. If you look deeply, it indirectly implies black = bad, white = good. Black magic is bad magic, white noise is good noise, black hat hacker is an evil person, white hat hacker is a good person. Of course, this is more to do with darkness rather than the color itself.

### Changing the words alone won’t help

Changing names only won’t make a difference. Just changing the term physically disabled to differently abled won’t make the lives better for people with wheelchair if the buildings and streets don’t provide accessible infrastructure.

Big corporate and organizations are more focused on [improving their image by changing their brand names][14] and dropping supposedly noninclusive words. This is being pointed by activists as well:

> Real problem: realtors don't show black people all the properties they qualify for. Fake problem: calling the master bedroom the master bedroom. Fix the real problem, realtors. <https://t.co/Qq7yQ8Gb3g>
>
> — John Legend (@johnlegend) [June 27, 2020][15]

### What do you think?

I wonder if one day someone starts a proposal to change man page to people page in order to make it more inclusive by removing the gender-specific term ‘man’.

The only problem is that the ‘man’ in man page doesn’t indicate a man. Man is short for manual and that word originates from Latin word _manus_ meaning hand.

What are your views on adapting inclusive language in coding guidelines? Do you think it’s a step in the right direction? Will it help bring equality and inclusivity? Do share your views in the comment section.

_**I understand that it is a controversial topic. When you are expressing your views in the comment section, please don’t use abusive words, don’t use racist slurs. Let’s keep the discussion civil.**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-inclusive-code/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Killing_of_George_Floyd
[2]: https://www.eatthis.com/food-brands-changing-due-to-racial-stereotypes/
[3]: https://en.wikipedia.org/wiki/List_of_name_changes_due_to_the_George_Floyd_protests
[4]: https://www.theguardian.com/tv-and-radio/2020/jun/10/netflix-pulls-the-mighty-boosh-and-the-league-of-gentlemen-over-blackface
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/kernel-inclsuive-guideline.jpg?ssl=1
[6]: https://en.wikipedia.org/wiki/Inclusive_language
[7]: https://www.drupal.org/node/2275877
[8]: https://bugs.python.org/issue34605
[9]: https://thenextweb.com/dd/2020/06/15/github-plans-to-replace-racially-insensitive-terms-like-master-and-whitelist/
[10]: https://t.co/6SMGd9celn
[11]: https://twitter.com/TwitterEng/status/1278733305190342656?ref_src=twsrc%5Etfw
[12]: https://twitter.com/DaveKSecure/status/1279194357116006400?ref_src=twsrc%5Etfw
[13]: https://lkml.org/lkml/2020/7/4/229
[14]: https://www.revolt.tv/2020/7/6/21309699/aunt-jemima-uncle-ben-mrs-butterworths-racist-changes
[15]: https://twitter.com/johnlegend/status/1276892001208655875?ref_src=twsrc%5Etfw
