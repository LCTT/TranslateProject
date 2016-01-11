#translating by name1e5s

Ubuntu ‘Spyware’ Will Be Disabled In Ubuntu 16.04 LTS
================================================================================
Controversial feature scaled back to help boost Ubuntu's privacy credentials

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/as2.jpg)

**Unity’s controversial online search feature is being disabled by default in Ubuntu 16.04 LTS, due for release in April.**

Search terms typed into the Unity 7 Dash search bar will **only show local file, folder and app results**. No search terms will be sent to Canonical or passed to third party results providers, as is currently the case.

> ‘Unity online searches are now turned off by default.’

In currently supported versions of Ubuntu the Dash sends search queries the user enters to a remote web server run by Canonical, the company behind Ubuntu.

No user-identifiable data is included with these queries, which are used to retrieve contextually relevant results from over 50 online services, including Wikipedia, YouTube and The Weather Channel.

A switch to disable online search entirely is available in Ubuntu through the **Ubuntu System Settings > Privacy pane**.

But some in the open-source community object to the feature being turned on by default.

### Ubuntu Online Search Controversy ###

> ‘Richard Stallman describes the feature as ‘spyware”

Boiling over since 2012, the open-source community was quick to express concerns about user privacy in the wake of Ubuntu Amazon integration. Concerns continued with the rollout of the comprehensive ‘Smart Scopes Service’ a year later.

The furore was so big it led free software stalwart [Richard Stallman to call Ubuntu ‘spyware’][1].

[The Electronic Frontier Foundation][2] also shared its concerns in a series of blog posts and suggested that Canonical make the feature opt-in. Privacy International went further than most by awarding Ubuntu’s makers a ‘[Big Brother award][3]‘ for work on, quote: “invading personal privacy”.

[Canonical][4] maintains that the data collected through Unity’s online search feature is anonymised and “not user-identifiable”.

In [blog post from 2013 the company explains][5] that it “**make[s] users aware of what data will be collected and which third party services will be queried through a notice right in the Dash, and we only collect data that allows us to deliver a great search experience to Ubuntu users.**”

### Ubuntu Gets Serious About Data Privacy ###

Canonical disabled Amazon product results on fresh installs of Ubuntu 14.04 LTS and up (though results from other online sources and services continue to appear until the opt-out is chosen).

For the next LTS, Ubuntu 16.04, Canonical curtails the contentious online searching feature entirely, right out of the box, just like the EFF asked them to do in 2012.

“None of your search terms will leave your computer,” [Ubuntu desktop manager Will Cooke][6] explains, noting that the “finer control over what is searched and [the] more targeted results” that Unity 8 offers “cannot be added into Unity 7.”

It’s for this reason that “the online search features [of Unity 7] will be retired.”

The change will also lower the support and infrastructure burden of Unity 7. With fewer Unity search results to handle Canonical can redirect time and engineering effort to more exciting avenues, like the promising Unity 8 desktop.

### You Will Need to Opt-In To Get Online Results ###

![Privacy settings in Ubuntu let you opt in to seeing online results](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/privacy.jpg)

Privacy settings in Ubuntu let you opt in to seeing online results

The decision to disable the online search element of the Ubuntu desktop will be greeted with considerable cheer by many in the open-source and free software communities.

But not everyone is antagonised by the semantic search skills being served up in the Dash.

If you think you’ll miss the efficiency of searching and previewing weather, news and other content through the Dash, **you can re-enable online search results** in a couple of clicks. Just head to Ubuntu **System Settings > Privacy > Search** and set the slider to ‘**On**‘.

Flicking this won’t automatically bring back Amazon product results. The ‘shopping lens’ is decoupled from the opt-in toggle. You’ll need to okay a second opt-in to see product results from Amazon (and Skimlinks).

### Summary ###

- Ubuntu 16.04 LTS will no longer search online sources in the Dash by default
- Online results can be turned back on manually using a toggle
- A second opt-in allows Amazon product results
- The change only affects new installs. In-place upgrades will retain user preferences

Do you agree with this decision? Or is Canonical about to reduce the experience of Ubuntu for new users? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2016/01/ubuntu-online-search-feature-disabled-16-04

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://arstechnica.com/information-technology/2012/12/richard-stallman-calls-ubuntu-spyware-because-it-tracks-searches/?utm_source=omgubuntu
[2]:https://www.eff.org/deeplinks/2012/10/privacy-ubuntu-1210-amazon-ads-and-data-leaks?utm_source=omgubuntu
[3]:http://www.omgubuntu.co.uk/2013/10/ubuntu-wins-big-brother-austria-privacy-award
[4]:http://blog.canonical.com/2012/12/07/searching-in-the-dash-in-ubuntu-13-04/
[5]:http://blog.canonical.com/2012/12/07/searching-in-the-dash-in-ubuntu-13-04/?utm_source=omgubuntu
[6]:http://www.whizzy.org/2015/12/online-searches-in-the-dash-to-be-off-by-default?utm_source=omgubuntu
