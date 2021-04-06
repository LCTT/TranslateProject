[#]: subject: (Managing deb Content in Foreman)
[#]: via: (https://opensource.com/article/21/3/linux-foreman)
[#]: author: (Maximilian Kolb https://opensource.com/users/kolb)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Managing deb Content in Foreman
======
Use Foreman to serve software packages and errata for certain Linux
systems.
![Package wrapped with brown paper and red bow][1]

Foreman is a data center automation tool to deploy, configure, and patch hosts. It relies on Katello for content management, which in turn relies on Pulp to manage repositories. See [_Manage content using Pulp Debian_][2] for more information.

Pulp offers many plugins for different content types, including RPM packages, Ansible roles and collections, PyPI packages, and deb content. The latter is called the **pulp_deb** plugin.

### Content management in Foreman

The basic idea for providing content to hosts is to mirror repositories and provide content to hosts via either the Foreman server or attached Smart Proxies.

This tutorial is a step-by-step guide to adding deb content to Foreman and serving hosts running Debian 10. "Deb content" refers to software packages and errata for Debian-based Linux systems (e.g., Debian and Ubuntu). This article focuses on [Debian 10 Buster][3] but the instructions also work for [Ubuntu 20.04 Focal Fossa][4], unless noted otherwise.

### 1\. Create the operating system

#### 1.1. Create an architecture

Navigate to **Hosts &gt; Architectures** and create a new architecture (if the architecture where you want to deploy Debian 10 hosts is missing). This tutorial assumes your hosts run on the x86_64 architecture, as Foreman does.

#### 1.2. Create an installation media

Navigate to **Hosts &gt; Installation Media** and create new Debian 10 installation media. Use the upstream repository URL <http://ftp.debian.org/debian/>.

Select the Debian operating system family for either Debian or Ubuntu.

Alternatively, you can also use a Debian mirror. However, content synced via Pulp does not work for two reasons: first, the `linux` and `initrd.gz` files are not in the expected locations; second, the `Release` file is not signed.

#### 1.3. Create an operating system

Navigate to **Hosts &gt; Operating Systems** and create a new operating system called Debian 10. Use **10** as the major version and leave the minor version field blank. For Ubuntu, use **20.04** as the major version and leave the minor version field blank.

![Creating an operating system entry][5]

(Maximilian Kolb, [CC BY-SA 4.0][6])

Select the Debian operating system family for Debian or Ubuntu, and specify the release name (e.g., **Buster** for Debian 10 or **Stretch** for Debian 9). Select the default partition tables and provisioning templates, i.e., **Preseed default ***.

#### 1.4. Adapt default Preseed templates (optional)

Navigate to **Hosts &gt; Partition Tables** and **Hosts &gt; Provisioning Templates** and adapt the default **Preseed** templates if necessary. Note that you need to clone locked templates before editing them. Cloned templates will not receive updates with newer Foreman versions. All Debian-based systems use **Preseed** templates, which are included with Foreman by default.

#### 1.5. Associate the templates

Navigate to **Hosts &gt; Provisioning Templates** and search for **Preseed**. Associate all desired provisioning templates to the operating system. Then, navigate to **Hosts &gt; Operating Systems** and select **Debian 10** as the operating system. Select the **Templates** tab and associate any provisioning templates that you want.

### 2\. Synchronize content

#### 2.1. Create content credentials for Debian upstream repositories and Debian client

Navigate to **Content &gt; Content Credentials** and add the required GPG public keys as content credentials for Foreman to verify the deb packages' authenticity. To obtain the necessary GPG public keys, verify the **Release** file and export the corresponding GPG public key as follows:

  * **Debian 10 main:** [code] wget <http://ftp.debian.org/debian/dists/buster/Release> &amp;&amp; wget <http://ftp.debian.org/debian/dists/buster/Release.gpg>
gpg --verify Release.gpg Release
gpg --keyserver keys.gnupg.net --recv-key 16E90B3FDF65EDE3AA7F323C04EE7237B7D453EC
gpg --keyserver keys.gnupg.net --recv-key 0146DC6D4A0B2914BDED34DB648ACFD622F3D138
gpg --keyserver keys.gnupg.net --recv-key 6D33866EDD8FFA41C0143AEDDCC9EFBF77E11517
gpg --armor --export E0B11894F66AEC98 DC30D7C23CBBABEE DCC9EFBF77E11517 &gt; debian_10_main.txt 
```
  * **Debian 10 security:** [code] wget <http://security.debian.org/debian-security/dists/buster/updates/Release> &amp;&amp; wget <http://security.debian.org/debian-security/dists/buster/updates/Release.gpg>
gpg --verify Release.gpg Release
gpg --keyserver keys.gnupg.net --recv-key 379483D8B60160B155B372DDAA8E81B4331F7F50
gpg --keyserver keys.gnupg.net --recv-key 5237CEEEF212F3D51C74ABE0112695A0E562B32A
gpg --armor --export EDA0D2388AE22BA9 4DFAB270CAA96DFA &gt; debian_10_security.txt
```
  * **Debian 10 updates:** [code] wget <http://ftp.debian.org/debian/dists/buster-updates/Release> &amp;&amp; wget <http://ftp.debian.org/debian/dists/buster-updates/Release.gpg>
gpg --verify Release.gpg Release
gpg --keyserver keys.gnupg.net --recv-key 16E90B3FDF65EDE3AA7F323C04EE7237B7D453EC
gpg --keyserver keys.gnupg.net --recv-key 0146DC6D4A0B2914BDED34DB648ACFD622F3D138
gpg --armor --export E0B11894F66AEC98 DC30D7C23CBBABEE &gt; debian_10_updates.txt 
```
* **Debian 10 client:** [code]`wget --output-document=debian_10_client.txt https://apt.atix.de/atix_gpg.pub`
```



You can select the respective ASCII-armored TXT files to upload to your Foreman instance.

#### 2.2. Create products called Debian 10 and Debian 10 client

Navigate to **Content &gt; Hosts** and create two new products.

#### 2.3. Create the necessary Debian 10 repositories

Navigate to **Content &gt; Products** and select the **Debian 10** product. Create three **deb** repositories:

  * **Debian 10 main:**
    * URL: `http://ftp.debian.org/debian/`
    * Releases: `buster`
    * Component: `main`
    * Architecture: `amd64`


  * **Debian 10 security:**
    * URL: `http://deb.debian.org/debian-security/`
    * Releases: `buster/updates`
    * Component: `main`
    * Architecture: `amd64`



If you want, you can add a self-hosted errata service: `https://github.com/ATIX-AG/errata_server` and `https://github.com/ATIX-AG/errata_parser`

  * **Debian 10 updates:**
    * URL: `http://ftp.debian.org/debian/`
    * Releases: `buster-updates`
    * Component: `main`
    * Architecture: `amd64`



Select the content credentials that you created in step 2.1. Adjust the components and architecture as needed. Navigate to **Content &gt; Products** and select the **Debian 10 client** product. Create a **deb** repository as follows:

  * **Debian 10 subscription-manager**
    * URL: `https://apt.atix.de/Debian10/`
    * Releases: `stable`
    * Component: `main`
    * Architecture: `amd64`



Select the content credentials you created in step 2.1. The Debian 10 client contains the **subscription-manager** package, which runs on each content host to receive content from the Foreman Server or an attached Smart Proxy. Navigate to [apt.atix.de][7] for further instructions.

#### 2.4. Synchronize the repositories

If you want, you can create a sync plan to sync the **Debian 10** and **Debian 10 client** products periodically. To sync the product once, click the **Select Action &gt; Sync Now** button on the **Products** page.

#### 2.5. Create content views

Navigate to **Content &gt; Content Views** and create a content view called **Debian 10** comprising the Debian upstream repositories created in the **Debian 10** product and publish a new version. Do the same for the **Debian 10 client** repository of the **Debian 10 client** product.

#### 2.6. Create a composite content view

Create a new composite content view called **Composite Debian 10** comprising the previously published **Debian 10** and **Debian 10 client** content views and publish a new version. You may optionally add other content views of your choice (e.g., Puppet).

![Composite content view][8]

(Maximilian Kolb, [CC BY-SA 4.0][6])

#### 2.7. Create an activation key

Navigate to **Content &gt; Activation Keys** and create a new activation key called **debian-10**:

  * Select the **Library** lifecycle environment and add the **Composite Debian 10** content view.
  * On the **Details** tab, assign the correct lifecycle environment and composite content view.
  * On the **Subscriptions** tab, assign the necessary subscriptions, i.e., the **Debian 10** and **Debian 10 client** products.



### 3\. Deploy a host

#### 3.1. Enable provisioning via Port 8000

Connect to your Foreman instance via SSH and edit the following file:


```
`/etc/foreman-proxy/settings.yml`
```

Search for `:http_port: 8000` and make sure it is not commented out (i.e., the line does not start with a `#`).

#### 3.2. Create a host group

Navigate to **Configure &gt; Host Groups** and create a new host group called **Debian 10**. Check out the Foreman documentation on [creating host groups][9], and make sure to select the correct entries on the **Operating System** and **Activation Keys** tabs.

#### 3.3. Create a new host

Navigate to **Hosts &gt; Create Host** and either select the host group as described above or manually enter the identical information.

> Tip: Deploying hosts running Ubuntu 20.04 is even easier, as you can use its official installation media ISO image and do offline installations. Check out orcharhino's [Managing Ubuntu Systems Guide][10] for more information.

[ATIX][11] has developed several Foreman plugins, and is an integral part of the [Foreman open source ecosystem][12]. The community's feedback on our contributions is passed back to our customers, as we continuously strive to improve our downstream product, [orcharhino][13].

This May I started my internship at Red Hat with the Pulp team . Since it was my first ever...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/linux-foreman

作者：[Maximilian Kolb][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kolb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://opensource.com/article/20/10/pulp-debian
[3]: https://wiki.debian.org/DebianBuster
[4]: https://releases.ubuntu.com/20.04/
[5]: https://opensource.com/sites/default/files/uploads/foreman-debian_content_deb_operating_system_entry.png (Creating an operating system entry)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://apt.atix.de/
[8]: https://opensource.com/sites/default/files/uploads/foreman-debian_content_deb_composite_content_view.png (Composite content view)
[9]: https://docs.theforeman.org/nightly/Managing_Hosts/index-foreman-el.html#creating-a-host-group
[10]: https://docs.orcharhino.com/or/docs/sources/usage_guides/managing_ubuntu_systems_guide.html#musg_deploy_hosts
[11]: https://atix.de/
[12]: https://theforeman.org/2020/10/atix-in-the-foreman-community.html
[13]: https://orcharhino.com/
