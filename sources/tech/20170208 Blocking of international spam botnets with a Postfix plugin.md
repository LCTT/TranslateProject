Blocking of international spam botnets with a Postfix plugin
============================================================

### On this page

1.  [Introduction][1]
2.  [How international botnet works][2]
3.  [Defending against botnet spammers][3]
4.  [Installation][4]

This article contains an analysis and solution for blocking of international SPAM botnets and a tutorial to install the anti-spam plugin to postfix firewall - postfwd in the postfix MTA.

### Introduction

One of the most important and hardest tasks for every company that provides mail services is staying out of the mail blacklists.

If a mail domain appears in one of the mail domain blacklists, other mail servers will stop accepting and relaying its e-mails. This will practically ban the domain from the majority of mail providers and prohibits that the provider’s customers can send e-mails. Tere is only one thing that a mail provider can do afterwards: ask the blacklist providers for removal from the list or change the IP addresses and domain names of its mail servers.

Getting into mail blacklist is very easy when a mail provider does not have a protection against spammers. Only one compromised customer mail account from which a hacker will start sending spam is needed to appear in a blacklist.

There are several ways of how hackers send spam from compromised mail accounts. In this article, I would like to show you how to completely mitigate international botnet spammers, who are characterized by logging into mail accounts from multiple IP addresses located in multiple countries worldwide.

### How international botnet works

Hackers who use an international botnet for spamming operate very efficient and are not easy to track. I started to analyze the behaviour of such an international spam botnet in October of 2016 and implemented a plugin for **postfix firewall** - **postfwd**, which intelligently bans all spammers from international botnets.

The first step was the analysis of the behavior of an international spam botnet done by tracking of one compromised mail account. I created a simple bash one-liner to select sasl login IP addresses of the compromised mail account from the postfwd login mail logs.

**Data in the following table are dumped 90 minutes after compromisation of one mail account and contains these attributes:**

*   IP addresses from which hacker logged into account (ip_address)
*   Corresponding country codes of IP addresses from GeoIP database (state_code)
*   Number of sasl logins which hacker did from one IP address (login_count)

```
 +-----------------+------------+-------------+
 | ip_address      | state_code | login_count |
 +-----------------+------------+-------------+
 | 41.63.176.___   | AO         |           8 |
 | 200.80.227.___  | AR         |          41 |
 | 120.146.134.___ | AU         |          18 |
 | 79.132.239.___  | BE         |          15 |
 | 184.149.27.___  | CA         |           1 |
 | 24.37.20.___    | CA         |          13 |
 | 70.28.77.___    | CA         |          21 |
 | 70.25.65.___    | CA         |          23 |
 | 72.38.177.___   | CA         |          24 |
 | 174.114.121.___ | CA         |          27 |
 | 206.248.139.___ | CA         |           4 |
 | 64.179.221.___  | CA         |           4 |
 | 184.151.178.___ | CA         |          40 |
 | 24.37.22.___    | CA         |          51 |
 | 209.250.146.___ | CA         |          66 |
 | 209.197.185.___ | CA         |           8 |
 | 47.48.223.___   | CA         |           8 |
 | 70.25.41.___    | CA         |          81 |
 | 184.71.9.___    | CA         |          92 |
 | 84.226.27.___   | CH         |           5 |
 | 59.37.9.___     | CN         |           6 |
 | 181.143.131.___ | CO         |          24 |
 | 186.64.177.___  | CR         |           6 |
 | 77.104.244.___  | CZ         |           1 |
 | 78.108.109.___  | CZ         |          18 |
 | 185.19.1.___    | CZ         |          58 |
 | 95.208.250.___  | DE         |           1 |
 | 79.215.89.___   | DE         |          15 |
 | 47.71.223.___   | DE         |          23 |
 | 31.18.251.___   | DE         |          27 |
 | 2.164.183.___   | DE         |          32 |
 | 79.239.97.___   | DE         |          32 |
 | 80.187.103.___  | DE         |          54 |
 | 109.84.1.___    | DE         |           6 |
 | 212.97.234.___  | DK         |          49 |
 | 190.131.134.___ | EC         |          42 |
 | 84.77.172.___   | ES         |           1 |
 | 91.117.105.___  | ES         |          10 |
 | 185.87.99.___   | ES         |          14 |
 | 95.16.51.___    | ES         |          15 |
 | 95.127.182.___  | ES         |          16 |
 | 195.77.90.___   | ES         |          19 |
 | 188.86.18.___   | ES         |           2 |
 | 212.145.210.___ | ES         |          38 |
 | 148.3.169.___   | ES         |          39 |
 | 95.16.35.___    | ES         |           4 |
 | 81.202.61.___   | ES         |          45 |
 | 88.7.246.___    | ES         |           7 |
 | 81.36.5.___     | ES         |           8 |
 | 88.14.192.___   | ES         |           8 |
 | 212.97.161.___  | ES         |           9 |
 | 193.248.156.___ | FR         |           5 |
 | 82.34.32.___    | GB         |           1 |
 | 86.180.214.___  | GB         |          11 |
 | 81.108.174.___  | GB         |          12 |
 | 86.11.209.___   | GB         |          13 |
 | 86.150.224.___  | GB         |          15 |
 | 2.102.31.___    | GB         |          17 |
 | 93.152.88.___   | GB         |          18 |
 | 86.178.68.___   | GB         |          19 |
 | 176.248.121.___ | GB         |           2 |
 | 2.97.227.___    | GB         |           2 |
 | 62.49.34.___    | GB         |           2 |
 | 79.64.78.___    | GB         |          20 |
 | 2.126.140.___   | GB         |          22 |
 | 87.114.222.___  | GB         |          23 |
 | 188.29.164.___  | GB         |          24 |
 | 82.11.14.___    | GB         |          26 |
 | 81.168.46.___   | GB         |          29 |
 | 86.136.125.___  | GB         |           3 |
 | 90.199.85.___   | GB         |           3 |
 | 86.177.93.___   | GB         |          31 |
 | 82.32.186.___   | GB         |           4 |
 | 79.68.153.___   | GB         |          46 |
 | 151.226.42.___  | GB         |           6 |
 | 2.123.234.___   | GB         |           6 |
 | 90.217.211.___  | GB         |           6 |
 | 212.159.148.___ | GB         |          68 |
 | 88.111.94.___   | GB         |           7 |
 | 77.98.186.___   | GB         |           9 |
 | 41.222.232.___  | GH         |           4 |
 | 176.63.29.___   | HU         |          30 |
 | 86.47.237.___   | IE         |          10 |
 | 37.46.22.___    | IE         |           4 |
 | 95.83.249.___   | IE         |           4 |
 | 109.79.69.___   | IE         |           6 |
 | 79.176.100.___  | IL         |          13 |
 | 122.175.34.___  | IN         |          19 |
 | 114.143.5.___   | IN         |          26 |
 | 115.112.159.___ | IN         |           4 |
 | 79.62.179.___   | IT         |          11 |
 | 79.53.217.___   | IT         |          19 |
 | 188.216.54.___  | IT         |           2 |
 | 46.44.203.___   | IT         |           2 |
 | 80.86.57.___    | IT         |           2 |
 | 5.170.192.___   | IT         |          27 |
 | 80.23.42.___    | IT         |           3 |
 | 89.249.177.___  | IT         |           3 |
 | 93.39.141.___   | IT         |          31 |
 | 80.183.6.___    | IT         |          34 |
 | 79.25.107.___   | IT         |          35 |
 | 81.208.25.___   | IT         |          39 |
 | 151.57.154.___  | IT         |           4 |
 | 79.60.239.___   | IT         |          42 |
 | 79.47.25.___    | IT         |           5 |
 | 188.216.114.___ | IT         |           7 |
 | 151.31.139.___  | IT         |           8 |
 | 46.185.139.___  | JO         |           9 |
 | 211.180.177.___ | KR         |          22 |
 | 31.214.125.___  | KW         |           2 |
 | 89.203.17.___   | KW         |           3 |
 | 94.187.138.___  | KW         |           4 |
 | 209.59.110.___  | LC         |          18 |
 | 41.137.40.___   | MA         |          12 |
 | 189.211.204.___ | MX         |           5 |
 | 89.98.64.___    | NL         |           6 |
 | 195.241.8.___   | NL         |           9 |
 | 195.1.82.___    | NO         |          70 |
 | 200.46.9.___    | PA         |          30 |
 | 111.125.66.___  | PH         |           1 |
 | 89.174.81.___   | PL         |           7 |
 | 64.89.12.___    | PR         |          24 |
 | 82.154.194.___  | PT         |          12 |
 | 188.48.145.___  | SA         |           8 |
 | 42.61.41.___    | SG         |          25 |
 | 87.197.112.___  | SK         |           3 |
 | 116.58.231.___  | TH         |           4 |
 | 195.162.90.___  | UA         |           5 |
 | 108.185.167.___ | US         |           1 |
 | 108.241.56.___  | US         |           1 |
 | 198.24.64.___   | US         |           1 |
 | 199.249.233.___ | US         |           1 |
 | 204.8.13.___    | US         |           1 |
 | 206.81.195.___  | US         |           1 |
 | 208.75.20.___   | US         |           1 |
 | 24.149.8.___    | US         |           1 |
 | 24.178.7.___    | US         |           1 |
 | 38.132.41.___   | US         |           1 |
 | 63.233.138.___  | US         |           1 |
 | 68.15.198.___   | US         |           1 |
 | 72.26.57.___    | US         |           1 |
 | 72.43.167.___   | US         |           1 |
 | 74.65.154.___   | US         |           1 |
 | 74.94.193.___   | US         |           1 |
 | 75.150.97.___   | US         |           1 |
 | 96.84.51.___    | US         |           1 |
 | 96.90.244.___   | US         |           1 |
 | 98.190.153.___  | US         |           1 |
 | 12.23.72.___    | US         |          10 |
 | 50.225.58.___   | US         |          10 |
 | 64.140.101.___  | US         |          10 |
 | 66.185.229.___  | US         |          10 |
 | 70.63.88.___    | US         |          10 |
 | 96.84.148.___   | US         |          10 |
 | 107.178.12.___  | US         |          11 |
 | 170.253.182.___ | US         |          11 |
 | 206.127.77.___  | US         |          11 |
 | 216.27.83.___   | US         |          11 |
 | 72.196.170.___  | US         |          11 |
 | 74.93.168.___   | US         |          11 |
 | 108.60.97.___   | US         |          12 |
 | 205.196.77.___  | US         |          12 |
 | 63.159.160.___  | US         |          12 |
 | 204.93.122.___  | US         |          13 |
 | 206.169.117.___ | US         |          13 |
 | 208.104.106.___ | US         |          13 |
 | 65.28.31.___    | US         |          13 |
 | 66.119.110.___  | US         |          13 |
 | 67.84.164.___   | US         |          13 |
 | 69.178.166.___  | US         |          13 |
 | 71.232.229.___  | US         |          13 |
 | 96.3.6.___      | US         |          13 |
 | 205.214.233.___ | US         |          14 |
 | 38.96.46.___    | US         |          14 |
 | 67.61.214.___   | US         |          14 |
 | 173.233.58.___  | US         |         141 |
 | 64.251.53.___   | US         |          15 |
 | 73.163.215.___  | US         |          15 |
 | 24.61.176.___   | US         |          16 |
 | 67.10.184.___   | US         |          16 |
 | 173.14.42.___   | US         |          17 |
 | 173.163.34.___  | US         |          17 |
 | 104.138.114.___ | US         |          18 |
 | 23.24.168.___   | US         |          18 |
 | 50.202.9.___    | US         |          19 |
 | 96.248.123.___  | US         |          19 |
 | 98.191.183.___  | US         |          19 |
 | 108.215.204.___ | US         |           2 |
 | 50.198.37.___   | US         |           2 |
 | 69.178.183.___  | US         |           2 |
 | 74.190.39.___   | US         |           2 |
 | 76.90.131.___   | US         |           2 |
 | 96.38.10.___    | US         |           2 |
 | 96.60.117.___   | US         |           2 |
 | 96.93.6.___     | US         |           2 |
 | 74.69.197.___   | US         |          21 |
 | 98.140.180.___  | US         |          21 |
 | 50.252.0.___    | US         |          22 |
 | 69.71.200.___   | US         |          22 |
 | 71.46.59.___    | US         |          22 |
 | 74.7.35.___     | US         |          22 |
 | 12.191.73.___   | US         |          23 |
 | 208.123.156.___ | US         |          23 |
 | 65.190.29.___   | US         |          23 |
 | 67.136.192.___  | US         |          23 |
 | 70.63.216.___   | US         |          23 |
 | 96.66.144.___   | US         |          23 |
 | 173.167.128.___ | US         |          24 |
 | 64.183.78.___   | US         |          24 |
 | 68.44.33.___    | US         |          24 |
 | 23.25.9.___     | US         |          25 |
 | 24.100.92.___   | US         |          25 |
 | 107.185.110.___ | US         |          26 |
 | 208.118.179.___ | US         |          26 |
 | 216.133.120.___ | US         |          26 |
 | 75.182.97.___   | US         |          26 |
 | 107.167.202.___ | US         |          27 |
 | 66.85.239.___   | US         |          27 |
 | 71.122.125.___  | US         |          28 |
 | 74.218.169.___  | US         |          28 |
 | 76.177.204.___  | US         |          28 |
 | 216.165.241.___ | US         |          29 |
 | 24.178.50.___   | US         |          29 |
 | 63.149.147.___  | US         |          29 |
 | 174.66.84.___   | US         |           3 |
 | 184.183.156.___ | US         |           3 |
 | 50.233.39.___   | US         |           3 |
 | 70.183.165.___  | US         |           3 |
 | 71.178.212.___  | US         |           3 |
 | 72.175.83.___   | US         |           3 |
 | 74.142.22.___   | US         |           3 |
 | 98.174.50.___   | US         |           3 |
 | 98.251.168.___  | US         |           3 |
 | 206.74.148.___  | US         |          30 |
 | 24.131.201.___  | US         |          30 |
 | 50.80.199.___   | US         |          30 |
 | 69.251.49.___   | US         |          30 |
 | 108.6.53.___    | US         |          31 |
 | 74.84.229.___   | US         |          31 |
 | 172.250.78.___  | US         |          32 |
 | 173.14.75.___   | US         |          32 |
 | 216.201.55.___  | US         |          33 |
 | 40.130.243.___  | US         |          33 |
 | 164.58.163.___  | US         |          34 |
 | 70.182.187.___  | US         |          35 |
 | 184.170.168.___ | US         |          37 |
 | 198.46.110.___  | US         |          37 |
 | 24.166.234.___  | US         |          37 |
 | 65.34.19.___    | US         |          37 |
 | 75.146.12.___   | US         |          37 |
 | 107.199.135.___ | US         |          38 |
 | 206.193.215.___ | US         |          38 |
 | 50.254.150.___  | US         |          38 |
 | 69.54.48.___    | US         |          38 |
 | 172.8.30.___    | US         |           4 |
 | 24.106.124.___  | US         |           4 |
 | 65.127.169.___  | US         |           4 |
 | 71.227.65.___   | US         |           4 |
 | 71.58.72.___    | US         |           4 |
 | 74.9.236.___    | US         |           4 |
 | 12.166.108.___  | US         |          40 |
 | 174.47.56.___   | US         |          40 |
 | 66.76.176.___   | US         |          40 |
 | 76.111.90.___   | US         |          41 |
 | 96.10.70.___    | US         |          41 |
 | 97.79.226.___   | US         |          41 |
 | 174.79.117.___  | US         |          42 |
 | 70.138.178.___  | US         |          42 |
 | 64.233.225.___  | US         |          43 |
 | 97.89.203.___   | US         |          43 |
 | 12.28.231.___   | US         |          44 |
 | 64.235.157.___  | US         |          45 |
 | 76.110.237.___  | US         |          45 |
 | 71.196.10.___   | US         |          46 |
 | 173.167.177.___ | US         |          49 |
 | 24.7.92.___     | US         |          49 |
 | 68.187.225.___  | US         |          49 |
 | 184.75.77.___   | US         |           5 |
 | 208.91.186.___  | US         |           5 |
 | 71.11.113.___   | US         |           5 |
 | 75.151.112.___  | US         |           5 |
 | 98.189.112.___  | US         |           5 |
 | 69.170.187.___  | US         |          51 |
 | 97.64.182.___   | US         |          51 |
 | 24.239.92.___   | US         |          52 |
 | 72.211.28.___   | US         |          53 |
 | 66.179.44.___   | US         |          54 |
 | 66.188.47.___   | US         |          55 |
 | 64.60.22.___    | US         |          56 |
 | 73.1.95.___     | US         |          56 |
 | 75.140.143.___  | US         |          58 |
 | 24.199.140.___  | US         |          59 |
 | 216.240.53.___  | US         |           6 |
 | 216.26.16.___   | US         |           6 |
 | 50.242.1.___    | US         |           6 |
 | 65.83.137.___   | US         |           6 |
 | 68.119.102.___  | US         |           6 |
 | 68.170.224.___  | US         |           6 |
 | 74.94.231.___   | US         |           6 |
 | 96.64.21.___    | US         |           6 |
 | 71.187.41.___   | US         |          60 |
 | 184.177.173.___ | US         |          61 |
 | 75.71.114.___   | US         |          61 |
 | 75.82.232.___   | US         |          61 |
 | 97.77.161.___   | US         |          63 |
 | 50.154.213.___  | US         |          65 |
 | 96.85.169.___   | US         |          67 |
 | 100.33.70.___   | US         |          68 |
 | 98.100.71.___   | US         |          68 |
 | 24.176.214.___  | US         |          69 |
 | 74.113.89.___   | US         |          69 |
 | 204.116.101.___ | US         |           7 |
 | 216.216.68.___  | US         |           7 |
 | 65.188.191.___  | US         |           7 |
 | 69.15.165.___   | US         |           7 |
 | 74.219.118.___  | US         |           7 |
 | 173.10.219.___  | US         |          71 |
 | 97.77.209.___   | US         |          72 |
 | 173.163.236.___ | US         |          73 |
 | 162.210.13.___  | US         |          79 |
 | 12.236.19.___   | US         |           8 |
 | 208.180.242.___ | US         |           8 |
 | 24.221.97.___   | US         |           8 |
 | 40.132.97.___   | US         |           8 |
 | 50.79.227.___   | US         |           8 |
 | 64.130.109.___  | US         |           8 |
 | 66.80.57.___    | US         |           8 |
 | 74.68.130.___   | US         |           8 |
 | 74.70.242.___   | US         |           8 |
 | 96.80.61.___    | US         |          81 |
 | 74.43.153.___   | US         |          83 |
 | 208.123.153.___ | US         |          85 |
 | 75.149.238.___  | US         |          87 |
 | 96.85.138.___   | US         |          89 |
 | 208.117.200.___ | US         |           9 |
 | 208.68.71.___   | US         |           9 |
 | 50.253.180.___  | US         |           9 |
 | 50.84.132.___   | US         |           9 |
 | 63.139.29.___   | US         |           9 |
 | 70.43.78.___    | US         |           9 |
 | 74.94.154.___   | US         |           9 |
 | 50.76.82.___    | US         |          94 |
 +-----------------+------------+-------------+
```

**In next table we can see the distribution of IP addresses by country:**

```
 +--------+
 | 214 US |
 | 28 GB  |
 | 17 IT  |
 | 15 ES  |
 | 15 CA  |
 |  8 DE  |
 |  4 IE  |
 |  3 KW  |
 |  3 IN  |
 |  3 CZ  |
 |  2 NL  |
 |  1 UA  |
 |  1 TH  |
 |  1 SK  |
 |  1 SG  |
 |  1 SA  |
 |  1 PT  |
 |  1 PR  |
 |  1 PL  |
 |  1 PH  |
 |  1 PA  |
 |  1 NO  |
 |  1 MX  |
 |  1 MA  |
 |  1 LC  |
 |  1 KR  |
 |  1 JO  |
 |  1 IL  |
 |  1 HU  |
 |  1 GH  |
 |  1 FR  |
 |  1 EC  |
 |  1 DK  |
 |  1 CR  |
 |  1 CO  |
 |  1 CN  |
 |  1 CH  |
 |  1 BE  |
 |  1 AU  |
 |  1 AR  |
 |  1 AO  |
 +--------+
```

Based on these tables can be drawn multiple facts according to which we designed our plugin:

*   Spam was spread from a botnet. This is indicated by logins from huge amount of client IP addresses.
*   Spam was spread with a low cadence of messages in order to avoid rate limits.
*   Spam was spread from IP addresses from multiple countries (more than 30 countries after few minutes) which indicates an international botnet.

From these tables were taken out the statistics of IP addresses used, number of logins and countries from which were users logged in:

*   Total number of logins 7531. 
*   Total number of IP addresses used 342. 
*   Total number of unique countries 41. 

### Defending against botnet spammers

The solution to this kind of spam behavior was to make a plugin for the postfix firewall - postfwd. Postfwd is program that can be used to block users by rate limits, by using mail blacklists and by other means.

We designed and implemented the plugin that counts the number of unique countries from which a user logged in to his account by sasl authentication. Then in the postfwd configuration, you can set limits to the number of countries and after getting above the limit, user gets selected smtp code reply and is blocked from sending emails.

I am using this plugin in a medium sized internet provider company for 6 months and currently the plugin automatically caught over 50 compromised users without any intervention from administrator's side. Another interesting fact after 6 months of usage is that after finding spammer and sending SMTP code 544 (Host not found - not in DNS) to compromised account (sended directly from postfwd), botnets stopped trying to log into compromised accounts. It looks like the botnet spam application is intelligent and do not want to waste botnet resources. Sending other SMTP codes did not stopped botnet from trying.

The plugin is available at my company's github - [https://github.com/Vnet-as/postfwd-anti-geoip-spam-plugin][5]

### Installation

In this part I will give you a basic tutorial of how to make postfix work with postfwd and how to install the plugin and add a postfwd rule to use it. Installation was tested and done on Debian 8 Jessie. Instructions for parts of this installation are also available on the github project page.

1\. First install and configure postfix with sasl authentication. There are a lot of great tutorials on installation and configuration of postfix, therefore I will continue right next with postfwd installation. 

2\. The next thing after you have postfix with sasl authentication installed is to install postfwd. On Debian systems, you can do it with the apt package manager by executing following command (This will also automatically create a user **postfw** and file **/etc/default/postfwd** which we need to update with correct configuration for autostart).

apt-get install postfwd

3\. Now we proceed with downloading the git project with our postfwd plugin:

apt-get install git
git clone https://github.com/Vnet-as/postfwd-anti-geoip-spam-plugin /etc/postfix/postfwd-anti-geoip-spam-plugin
chown -R postfw:postfix /etc/postfix/postfwd-anti-geoip-spam-plugin/

4\. If you do not have git or do not want to use git, you can download raw plugin file:

mkdir /etc/postfix/postfwd-anti-geoip-spam-plugin
wget https://raw.githubusercontent.com/Vnet-as/postfwd-anti-geoip-spam-plugin/master/postfwd-anti-spam.plugin -O /etc/postfix/postfwd-anti-geoip-spam-plugin/postfwd-anti-spam.plugin
chown -R postfw:postfix /etc/postfix/postfwd-anti-geoip-spam-plugin/

5. Then update the postfwd default config in the **/etc/default/postfwd** file and add the plugin parameter '**--plugins /etc/postfix/postfwd-anti-geoip-spam-plugin/postfwd-anti-spam.plugin'** to it**:**

sed -i 's/STARTUP=0/STARTUP=1/' /etc/default/postfwd # Auto-Startup

sed -i 's/ARGS="--summary=600 --cache=600 --cache-rdomain-only --cache-no-size"/#ARGS="--summary=600 --cache=600 --cache-rdomain-only --cache-no-size"/' /etc/default/postfwd # Comment out old startup parameters

echo 'ARGS="--summary=600 --cache=600 --cache-rdomain-only --cache-no-size --plugins /etc/postfix/postfwd-anti-geoip-spam-plugin/postfwd-anti-spam.plugin"' >> /etc/default/postfwd # Add new startup parameters

6\. Now create a basic postfwd configuration file with the anti spam botnet rule:

cat <<_EOF_ >> /etc/postfix/postfwd.cf
# Anti spam botnet rule
# This example shows how to limit e-mail address defined by sasl_username to be able to login from max. 5 different countries, otherwise they will be blocked to send messages.
id=COUNTRY_LOGIN_COUNT ; \
sasl_username=~^(.+)$ ; \
incr_client_country_login_count != 0 ; \
action=dunno
id=BAN_BOTNET ; \
sasl_username=~^(.+)$ ; \
client_uniq_country_login_count > 5 ; \
action=rate(sasl_username/1/3600/554 Your mail account was compromised. Please change your password immediately after next login.)
_EOF_

7\. Update the postfix configuration file **/etc/postfix/main.cf** to use the policy service on the default postfwd port **10040** (or different port according to the configuration in **/etc/default/postfwd**). Your configuration should have following option in the **smtpd_recipient_restrictions** line. Note that the following restriction does not work without other restrictions such as one of **reject_unknown_recipient_domain** or **reject_unauth_destination**.

echo 'smtpd_recipient_restrictions = check_policy_service inet:127.0.0.1:12525' >> /etc/postfix/main.cf

8\. Install the dependencies of the plugin: 

`apt-get install -y libgeo-ip-perl libtime-piece-perl libdbd-mysql-perl libdbd-pg-perl`

9\. Install MySQL or PostgreSQL database and configure one user which will be used in plugin.

10\. Update database connection part in plugin to refer to your database backend configuration. This example shows the MySQL configuration for a user testuser and database test.

```
# my $driver = "Pg"; 
my $driver = "mysql"; 
my $database = "test";
my $host = "127.0.0.1";
my $port = "3306";
# my $port = "5432";
my $dsn = "DBI:$driver:database=$database;host=$host;port=$port";
my $userid = "testuser";
my $password = "password";
```

11\. Now restart postfix and postfwd service.

```
service postfix restart && service postfwd restart
```

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/

作者：[Ondrej Vasko][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/
[1]:https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/#introduction
[2]:https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/#how-international-botnet-works
[3]:https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/#defending-against-botnet-spammers
[4]:https://www.howtoforge.com/tutorial/blocking-of-international-spam-botnets-postfix-plugin/#installation
[5]:https://github.com/Vnet-as/postfwd-anti-geoip-spam-plugin
