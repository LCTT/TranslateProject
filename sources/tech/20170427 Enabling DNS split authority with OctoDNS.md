[Enabling DNS split authority with OctoDNS][1]
============================================================

Building robust systems involves designing for failure. As Site Reliability Engineers at GitHub, we’re always on the lookout for places where redundancy can help to mitigate problems, and today we’ll be talking about steps we’ve recently taken to shore up how you locate our servers via DNS.

Large [DNS][4] providers have many levels of redundancy built into their services, but issues will arise causing outages and there are steps that can be taken to lessen their impact. One of the best options available is to split authority for your zones across multiple providers. Enabling split authority is straightforward, you just configure two or more sets of [name servers][5] for your zones in the registrar and DNS requests will be split across the full list. However, the catch is that you now have to keep the records for those zones in sync across multiple providers and depending on the details, that can either be complex to set up or a completely manual process.

```
$ dig NS github.com. @a.gtld-servers.net.

...

;; QUESTION SECTION:
;github.com.			IN	NS

;; AUTHORITY SECTION:
github.com.		172800	IN	NS	ns4.p16.dynect.net.
github.com.		172800	IN	NS	ns-520.awsdns-01.net.
github.com.		172800	IN	NS	ns1.p16.dynect.net.
github.com.		172800	IN	NS	ns3.p16.dynect.net.
github.com.		172800	IN	NS	ns-421.awsdns-52.com.
github.com.		172800	IN	NS	ns-1283.awsdns-32.org.
github.com.		172800	IN	NS	ns2.p16.dynect.net.
github.com.		172800	IN	NS	ns-1707.awsdns-21.co.uk.

...

```

The above query is asking a [TLD name server][6] for `github.com.` `NS` records. It returns the values configured in our registrar, in this case four each of two providers. If one of those providers was to experience an outage, the other would hopefully still be available to service requests. We keep our records in sync in further places and can safely change over to them without having to worry about stale or incorrect state.

The last piece of fully configuring split authority is to add all of the name servers as apex `NS` records, the root of the zone, in both providers.

```
$ dig NS github.com. @ns1.p16.dynect.net.

...

;; QUESTION SECTION:
;github.com.			IN	NS

;; ANSWER SECTION:
github.com.		551	IN	NS	ns1.p16.dynect.net.
github.com.		551	IN	NS	ns2.p16.dynect.net.
github.com.		551	IN	NS	ns-520.awsdns-01.net.
github.com.		551	IN	NS	ns3.p16.dynect.net.
github.com.		551	IN	NS	ns-421.awsdns-52.com.
github.com.		551	IN	NS	ns4.p16.dynect.net.
github.com.		551	IN	NS	ns-1283.awsdns-32.org.
github.com.		551	IN	NS	ns-1707.awsdns-21.co.uk.

```

At GitHub we have dozens of zones and thousands of records, and while the majority of those aren’t critical enough to require redundancy, we have a fair number that do. We wanted a solution that was able to keep these records in sync in multiple providers and more generally manage all of our DNS records, both internal and external. So today we’re announcing [OctoDNS][7].

![octoDNS logo](https://githubengineering.com/images/enabling-split-authority-dns-with-octodns/octodns-logo.png)

#### Configuration

OctoDNS has allowed us to revamp our DNS workflow. Our zones and records are laid out in config files stored in a Git repo. Changes now use the [GitHub Flow][8] and are [branch deployed just like the site][9]. We can even do “noop” deploys to preview what records will be modified by a change. The config files are yaml dictionaries, one per zone, where the top-level keys are record names and the values lay out the ttl, type, and type-specific data. For example, the following config will create the `A` record `octodns.github.com.` when included in the zone file `github.com.yaml`.

```
octodns:
  type: A
  values:
    - 1.2.3.4
    - 1.2.3.5

```

The second piece of configuration maps sources of record data to providers. The snippet below tells OctoDNS to load the zone `github.com` from the `config` provider and to sync the results to `dyn` and `route53`.

```
zones:
  github.com.:
    sources:
      - config
    targets:
      - dyn
      - route53

```

#### Synchronizing

Once our configuration is in place OctoDNS can evaluate the current state and build a plan listing the set of changes it would need to match the targets’ state to the source’s. In the example below, `octodns.github.com` is a new record so the required action is to create the record in both.

```
$ octodns-sync --config-file=./config/production.yaml
...
********************************************************************************
* github.com.
********************************************************************************
* route53 (Route53Provider)
*   Create <ARecord A 60, octodns.github.com., [u'1.2.3.4', '1.2.3.5']>
*   Summary: Creates=1, Updates=0, Deletes=0, Existing Records=0
* dyn (DynProvider)
*   Create <ARecord A 60, octodns.github.com., [u'1.2.3.4', '1.2.3.5']>
*   Summary: Creates=1, Updates=0, Deletes=0, Existing Records=0
********************************************************************************
...

```

By default `octodns-sync` is in dry-run mode, so no action was taken. Once we’ve reviewed the changes and we’re happy with them, we can run the command again and add the `--doit` flag. OctoDNS will run through it’s process and this time continue on to make the necessary changes in Route53 and Dynect so that the new record exists.

```
$ octodns-sync --config-file=./config/production.yaml --doit
...

```

At this point we have consistent record data stored in both providers and can comfortably split our DNS requests across them knowing they’ll be providing the accurate results. While we’re running OctoDNS commands directly above, our internal workflow relies on deploy scripts and chatops. You can find more about that in the [workflow section of the README][10].

#### Conclusion

Split authority is something we feel most sites can benefit from and the hope is that with [OctoDNS][11], one of the biggest obstacles to enabling it has been removed. Even if split authority isn’t of interest, OctoDNS may still be worth a look as it brings the benefits of [Infrastructure as Code][12] to DNS.

Want to help the GitHub SRE team solve interesting problems like this? We’d love for you to join us. [Apply Here][13]

--------------------------------------------------------------------------------

via: https://githubengineering.com/enabling-split-authority-dns-with-octodns/

作者：[ross ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/ross
[1]:https://githubengineering.com/enabling-split-authority-dns-with-octodns/
[2]:https://github.com/ross
[3]:https://github.com/ross
[4]:https://en.wikipedia.org/wiki/Domain_Name_System
[5]:https://en.wikipedia.org/wiki/Name_server
[6]:https://en.wikipedia.org/wiki/Top-level_domain
[7]:https://github.com/github/octodns/
[8]:https://guides.github.com/introduction/flow/
[9]:https://githubengineering.com/deploying-branches-to-github-com/
[10]:https://github.com/github/octodns#workflow
[11]:https://github.com/github/octodns/
[12]:https://en.wikipedia.org/wiki/Infrastructure_as_Code
[13]:https://boards.greenhouse.io/github/jobs/669805#.WPVqJlPyvUI
