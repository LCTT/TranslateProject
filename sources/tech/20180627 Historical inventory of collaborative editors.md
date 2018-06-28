Historical inventory of collaborative editors
======
A quick inventory of major collaborative editor efforts, in chronological order.

As with any such list, it must start with an honorable mention to [the mother of all demos][25] during which [Doug Engelbart][26] presented what is basically an exhaustive list of all possible software written since 1968\. This includes not only a collaborative editor, but graphics, programming and math editor.

Everything else after that demo is just a slower implementation to compensate for the acceleration of hardware.

> Software gets slower faster than hardware gets faster. - Wirth's law

So without further ado, here is the list of notable collaborative editors that I could find. By "notable" i mean that they introduce a notable feature or implementation detail.

   
| Project | Date | Platform | Notes |
| --- | --- | --- | --- |
| [SubEthaEdit][1] | 2003-2015? | Mac-only | first collaborative, real-time, multi-cursor editor I could find. [reverse-engineering attempt in Emacs][2] |
| [DocSynch][3] | 2004-2007 | ? | built on top of IRC 
![(!)](https://anarc.at/smileys/idea.png)
 |
| [Gobby][4] | 2005-now | C, multi-platform | first open, solid and reliable implementation. still around! protocol ("[libinfinoted][5]") notoriously hard to port to other editors (e.g. [Rudel][6] failed to implement this in Emacs. 0.7 release in jan 2017 adds possible python bindings that might improve this. Interesting plugins: autosave to disk. |
| [moonedit][7] | 2005-2008? | ? | Original website died. Other user's cursors visible and emulated keystrokes noises. Calculator and music sequencer. |
| [synchroedit][8] | 2006-2007 | ? | First web app. |
| [Etherpad][9] | 2008-now | Web | First solid webapp. Originally developped as a heavy Java app in 2008, acquired and opensourced by google in 2009, then rewritten in Node.js in 2011\. Widely used. |
| [CRDT][10] | 2011 | Specification | Standard for replicating a document's datastructure among different computers reliably. |
| [Operational transform][11] | 2013 | Specification | Similar to CRDT, yet, well, different. |
| [Floobits][12] | 2013-now | ? | Commercial, but opensource plugins for different editors |
| [HackMD][13] | 2015-now | ? | Commercial but [opensource][14]. Inspired by hackpad, which was bought up by Dropbox. |
| [Cryptpad][15] | 2016-now | web? | spin-off of xwiki. encrypted, "zero-knowledge" on server |
| [Prosemirror][16] | 2016-now | Web, Node.JS | "Tries to bridge the gap between Markdown text editing and classical WYSIWYG editors." Not really an editor, but something that can be used to build one. |
| [Qill][17] | 2013-now | Web, Node.JS | Rich text editor, also javascript. Not sure it is really collaborative. |
| [Nextcloud][18] | 2017-now | Web | Some sort of Google docs equivalent |
| [Teletype][19] | 2017-now | WebRTC, Node.JS | For the GitHub's [Atom editor][20], introduces "portal" idea that makes guests follow what the host is doing across multiple docs. p2p with webRTC after visit to introduction server, CRDT based. |
| [Tandem][21] | 2018-now | Node.JS? | Plugins for atom, vim, neovim, sublime... uses a relay to setup p2p connexions CRDT based. [Dubious license issues][22] were resolved thanks to the involvement of Debian developers, which makes it a promising standard to follow in the future. |

### Other lists

*   [Emacs wiki][23]

*   [Wikipedia][24]



--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-06-26-collaborative-editors-history/

作者：[Anacr][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://anarc.at
[1]:https://www.codingmonkeys.de/subethaedit/
[2]:https://www.emacswiki.org/emacs/SubEthaEmacs
[3]:http://docsynch.sourceforge.net/
[4]:https://gobby.github.io/
[5]:http://infinote.0x539.de/libinfinity/API/libinfinity/
[6]:https://www.emacswiki.org/emacs/Rudel
[7]:https://web.archive.org/web/20060423192346/http://www.moonedit.com:80/
[8]:http://www.synchroedit.com/
[9]:http://etherpad.org/
[10]:https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type
[11]:http://operational-transformation.github.io/
[12]:https://floobits.com/
[13]:https://hackmd.io/
[14]:https://github.com/hackmdio/hackmd
[15]:https://cryptpad.fr/
[16]:https://prosemirror.net/
[17]:https://quilljs.com/
[18]:https://nextcloud.com/collaboraonline/
[19]:https://teletype.atom.io/
[20]:https://atom.io
[21]:http://typeintandem.com/
[22]:https://github.com/typeintandem/tandem/issues/131
[23]:https://www.emacswiki.org/emacs/CollaborativeEditing
[24]:https://en.wikipedia.org/wiki/Collaborative_real-time_editor
[25]:https://en.wikipedia.org/wiki/The_Mother_of_All_Demos
[26]:https://en.wikipedia.org/wiki/Douglas_Engelbart
