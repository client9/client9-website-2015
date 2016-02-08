+++
date = "2015-01-17"
aliases = [ "20150117" ]
title = "Comparison of Linux Distributions on AWS EC2"
+++

How do various Linux distributions implement a operating system for
use in virtualized or cloud environments?  One proxy for
size and complexity is the number of packages installed.  While not a perfect
comparison, in general, less is more.  In Amazon's US-WEST-1 region, I fired up
the a number of Linux distributions and counted the number of packages
installed.<!--more-->


<table class="table">
<tr><th> OS Distribution </th><th> AMI </th><th> Packages </th></tr>
<tr><td> SUSE Linux Enterprise Server 12 </td><td> `ami-b95b4ffc` </td><td> 724      </td></tr>
<tr><td> Ubuntu 14.10 Utopic             </td><td> `ami-b7515af2` </td><td> 461      </td></tr>
<tr><td> Ubuntu 14.04 LTS Precise        </td><td> `ami-076e6542` </td><td> 450      </td></tr>
<tr><td> Ubuntu 12.04 LTS Trusty         </td><td> `ami-b7515af2` </td><td> 396      </td></tr>
<tr><td> Amazon Linux AMI 2014.09.1      </td><td> `ami-4b6f650e` </td><td> 361      </td></tr>
<tr><td> Red Hat Enterprise Linux 7.0    </td><td> `ami-33cdd876` </td><td> 347      </td></tr>
<tr><td> Debian 8.0 (experimental)       </td><td> `ami-17899452` </td><td> 271      </td></tr>
<tr><td> CentOS 7                        </td><td> `ami-33c1ca76` </td><td> 246      </td></tr>
<tr><td> Fedora-Cloud-Base-20141203-21   </td><td> `ami-970310d2` </td><td> 226      </td></tr>
<tr><td> Debian 7.7                      </td><td> `ami-b12e39f4` </td><td> 194      </td></tr>
</table>

### Notes:

* Unsurprisingly, commercial-based distributions had more packages
  installed than more-community driven ones.  I'll let you decide if
  they add value or not.
* To be fair to SUSE, it specifically said it came with everything.
  With 724 packages installed by default, it better.
* Ubuntu 12 is filled with stuff that doesn't belong on a (cloud)
  server: bluetooth drivers, wireless drivers, NFS, etc.
* Ubuntu 12 and 14 package up various X (the windows system) libraries, apparently for a
  graphic boot system.  Probably not so useful in a cloud environment.
* Even after removing fluff from Ubuntu 12 and 14, it's still over 150 more
  packages than its matching Debian counterparts.
* Debian 8 added around 50 packages compared to Debian 7.  It also uses
  the notorious `systemd` but I think the increase in the number of
  packages is due to other structural changes to Debian 8 (see below).
* Debian 8 and Ubuntu 14 are a bit odd.  They provide two pythons and
  two libc versions that are essential for `cloudinit`, but not sure
  why it is so complicated.
* Fedora has a cloud-based version?  Apparently, [I'm not the only one confused by it](http://www.infoworld.com/article/2843687/Linux/red-hat-fedora-confuses-Linux-users.html)

### Not-Linux and Not-Quite Linux

* Of course, one doesn't have to run Linux either.  I launched a
  [FreeBSD ami](http://www.daemonology.net/freebsd-on-ec2/), and
  according to `pkg version` only 22 packages were added to the base
  install to make it run on Amazon's services (mostly around python
  and cloudinit which are optional).  I'm not an expert in FreeBSD but
  I certainly like the holistic approach they use.
* Docker. Sure, but Docker still needs a host system, and a guest OS
  (or some type).  CoreOS is likely the first of many minimal OSs
  coming out in 2015.  One could argue that
  [CoreOS](https://coreos.com/) plus a single docker container such
  [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)
  is "better" than regular Ubuntu.

Obviously there is more to deciding what OS to use than how small the
base install is, but it is a useful reflection of the goals and
designs of the distribution.
