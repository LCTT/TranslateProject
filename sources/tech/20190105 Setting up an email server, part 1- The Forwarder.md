[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Setting up an email server, part 1: The Forwarder)
[#]: via: (https://blog.jak-linux.org/2019/01/05/setting-up-an-email-server-part1/)
[#]: author: (Julian Andres Klode https://blog.jak-linux.org/)

Setting up an email server, part 1: The Forwarder
======

This week, I’ve been working on rolling out mail services on my server. I started working on a mail server setup at the end of November, while the server was not yet in use, but only for about two days, and then let it rest.

As my old shared hosting account expired on January 1, I had to move mail forwarding duties over to the new server. Yes forwarding - I do plan to move hosting the actual email too, but at the moment it’s “just” forwarding to gmail.

### The Software

As you might know from the web server story, my server runs on Ubuntu 18.04. I set up a mail server on this system using

  * [Postfix][1] for SMTP duties (warning, they oddly do not have an https page)
  * [rspamd][2] for spam filtering, and signing DKIM / ARC
  * [bind9][3] for DNS resolving
  * [postsrsd][4] for SRS



You might wonder why bind9 is in there. It turns out that DNS blacklists used by spam filters block the caching DNS servers you usually use, so you have to use your own recursive DNS server. Ubuntu offers you the choice between bind9 and dnsmasq in main, and it seems like bind9 is more appropriate here than dnsmasq.

### Setting up postfix

Most of the postfix configuration is fairly standard. So, let’s skip TLS configuration and outbound SMTP setups (this is email, and while they support TLS, it’s all optional, so let’s not bother that much here).

The most important part is restrictions in `main.cf`.

First of all, relay restrictions prevent us from relaying emails to weird domains:

```
# Relay Restrictions
smtpd_relay_restrictions = reject_non_fqdn_recipient reject_unknown_recipient_domain permit_mynetworks permit_sasl_authenticated defer_unauth_destination
```

We also only accept mails from hosts that know their own full qualified name:

```
# Helo restrictions (hosts not having a proper fqdn)
smtpd_helo_required = yes
smtpd_helo_restrictions = permit_mynetworks reject_invalid_helo_hostname reject_non_fqdn_helo_hostname reject_unknown_helo_hostname
```

We also don’t like clients (other servers) that send data too early, or have an unknown hostname:

```
smtpd_data_restrictions = reject_unauth_pipelining
smtpd_client_restrictions = permit_mynetworks reject_unknown_client_hostname
```

I also set up a custom apparmor profile that’s pretty lose, I plan to migrate to the one in the apparmor git eventually but it needs more testing and some cleanup.

### Sender rewriting scheme

For SRS using postsrsd, we define the `SRS_DOMAIN` in `/etc/default/postsrsd` and then configure postfix to talk to it:

```
# Handle SRS for forwarding
recipient_canonical_maps = tcp:localhost:10002
recipient_canonical_classes= envelope_recipient,header_recipient

sender_canonical_maps = tcp:localhost:10001
sender_canonical_classes = envelope_sender
```

This has a minor issue that it also rewrites the `Return-Path` when it delivers emails locally, but as I am only forwarding, I’m worrying about that later.

### rspamd basics

rspamd is a great spam filtering system. It uses a small core written in C and a bunch of Lua plugins, such as:

  * IP score, which keeps track of how good a specific server was in the past
  * Replies, which can check whether an email is a reply to another one
  * DNS blacklisting
  * DKIM and ARC validation and signing
  * DMARC validation
  * SPF validation



It also has a nice web UI:

![rspamd web ui status][5]

rspamd web ui status

![rspamd web ui investigating a spam message][6]

rspamd web ui investigating a spam message

Setting up rspamd is quite easy. You basically just drop a bunch of configuration overrides into `/etc/rspamd/local.d` and you’re done. Heck, it mostly works out of the box. There’s a fancy `rspamadm configwizard` too.

What you do want for rspamd is a redis server. redis is needed in [many places][7], such as rate limiting, greylisting, dmarc, reply tracking, ip scoring, neural networks.

I made a few changes to the defaults:

  * I enabled subject rewriting instead of adding headers, so spam mail subjects get `[SPAM]` prepended, in `local.d/actions.conf`:

```
 reject = 15;
rewrite_subject = 6;
add_header = 6;
greylist = 4;
subject = "[SPAM] %s";
```

  * I set `autolearn = true;` in `local.d/classifier-bayes.conf` to make it learn that an email that has a score of at least 15 (those that are rejected) is spam, and emails with negative scores are ham.

  * I set `extended_spam_headers = true;` in `local.d/milter_headers.conf` to get a report from rspamd in the header seeing the score and how the score came to be.




### ARC setup

[ARC][8] is the ‘Authenticated Received Chain’ and is currently a DMARC working group work item. It allows forwarders / mailing lists to authenticate their forwarding of the emails and the checks they have performed.

rspamd is capable of validating and signing emails with ARC, but I’m not sure how much influence ARC has on gmail at the moment, for example.

There are three parts to setting up ARC:

  1. Generate a DKIM key pair (use `rspamadm dkim_keygen`)
  2. Setup rspamd to sign incoming emails using the private key
  3. Add a DKIM `TXT` record for the public key. `rspamadm` helpfully tells you how it looks like.



For step two, what we need to do is configure `local.d/arc.conf`. You can basically use the example configuration from the [rspamd page][9], the key point for signing incoming email is to specifiy `sign_incoming = true;` and `use_domain_sign_inbound = "recipient";` (FWIW, none of these options are documented, they are fairly new, and nobody updated the documentation for them).

My configuration looks like this at the moment:

```
# If false, messages with empty envelope from are not signed
allow_envfrom_empty = true;
# If true, envelope/header domain mismatch is ignored
allow_hdrfrom_mismatch = true;
# If true, multiple from headers are allowed (but only first is used)
allow_hdrfrom_multiple = false;
# If true, username does not need to contain matching domain
allow_username_mismatch = false;
# If false, messages from authenticated users are not selected for signing
auth_only = true;
# Default path to key, can include '$domain' and '$selector' variables
path = "${DBDIR}/arc/$domain.$selector.key";
# Default selector to use
selector = "arc";
# If false, messages from local networks are not selected for signing
sign_local = true;
#
sign_inbound = true;
# Symbol to add when message is signed
symbol_signed = "ARC_SIGNED";
# Whether to fallback to global config
try_fallback = true;
# Domain to use for ARC signing: can be "header" or "envelope"
use_domain = "header";
use_domain_sign_inbound = "recipient";
# Whether to normalise domains to eSLD
use_esld = true;
# Whether to get keys from Redis
use_redis = false;
# Hash for ARC keys in Redis
key_prefix = "ARC_KEYS";
```

This would also sign any outgoing email, but I’m not sure that’s necessary - my understanding is that we only care about ARC when forwarding/receiving incoming emails, not when sending them (at least that’s what gmail does).

### Other Issues

There are few other things to keep in mind when running your own mail server. I probably don’t know them all yet, but here we go:

  * You must have a fully qualified hostname resolving to a public IP address

  * Your public IP address must resolve back to the fully qualified host name

  * Again, you should run a recursive DNS resolver so your DNS blacklists work (thanks waldi for pointing that out)

  * Setup an SPF record. Mine looks like this:

`jak-linux.org. 3600 IN TXT "v=spf1 +mx ~all"`

this states that all my mail servers may send email, but others probably should not (a softfail). Not having an SPF record can punish you; for example, rspamd gives missing SPF and DKIM a score of 1.

  * All of that software is sandboxed using AppArmor. Makes you question its security a bit less!




### Source code, outlook

As always, you can find the Ansible roles on [GitHub][10]. Feel free to point out bugs! 😉

In the next installment of this series, we will be looking at setting up Dovecot, and configuring DKIM. We probably also want to figure out how to run notmuch on the server, keep messages in matching maildirs, and have my laptop synchronize the maildir and notmuch state with the server. Ugh, sounds like a lot of work.

--------------------------------------------------------------------------------

via: https://blog.jak-linux.org/2019/01/05/setting-up-an-email-server-part1/

作者：[Julian Andres Klode][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.jak-linux.org/
[b]: https://github.com/lujun9972
[1]: http://www.postfix.org/
[2]: https://rspamd.com/
[3]: https://www.isc.org/downloads/bind/
[4]: https://github.com/roehling/postsrsd
[5]: https://blog.jak-linux.org/2019/01/05/setting-up-an-email-server-part1/rspamd-status.png
[6]: https://blog.jak-linux.org/2019/01/05/setting-up-an-email-server-part1/rspamd-spam.png
[7]: https://rspamd.com/doc/configuration/redis.html
[8]: http://arc-spec.org/
[9]: https://rspamd.com/doc/modules/arc.html
[10]: https://github.com/julian-klode/ansible.jak-linux.org
