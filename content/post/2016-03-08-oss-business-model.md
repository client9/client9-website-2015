+++
aliases = [ "20160308" ]
date = "2016-03-08"
title = "How do Open Source Software Product Companies Make Money?"
+++

How do Open Source product companies make money? As a consumer, user
and producer of OSS, I looked at a number of venture
capital-backed, open source software product (OSSP) companies to help
understand what their motivations are and where they might be going.
<!--more-->

Here's a few I took a look at:

* Elastic
* Chef (nee OpsCode)
* Puppet Labs
* Docker
* InfluxDB
* Mongo
* NGINX
* RedHat
* CloudBees (for JenkinsCI)

There are a bunch of Hadoop-based companies as well, but I'm less
familiar with them.

Some took existing open-source technology and built a business around
it (e.g. NGINX, Elastic).  Others were ground up (Mongo,
InfluxDB). RedHat is the oldest of the bunch and the only public
company in the group.

In all cases, the fact the core technology is "open source" is for
the most part irrelevant for the business.  I don't know of any case
where some other company took the open code, and built something that
was competitive and made any difference business-wise (with the
possible exception of CentOS and RedHat).

There are three main sources of income for OSS company:

## Support, Training and User Conferences

Support and training are obvious choices, especially for complicated
products that frequently require tuning and optimization.

If you are really good, you can start offering *certification*.

OSSP companies that are *not* VC-backed typically only do this.  THink Jenkins and CloudBees
## Debugging and Monitoring Tools

An extension of the the above is selling specialized user interfaces
and tooling.  The command-line interface is free.  If you want a web
page or GUI, it costs extra (and might not be open source).

Examples:

* Elastic sells "Marvel" a debugging monitor
* Chef has various GUI tools in their paid-for version

## SaaS / PaaS / Hosting

If you have a complicated product, then managing it seems like a natural extension.

* On shared, or pooled infrastructure.
* On private infrastructure

## "Enterprise Features"

Enterprises features typically include things related to the "real word":

* Integration with internal systems
* Authentication and Authorization
* Encryption (TLS)
* Compliance
* SLAs - Backup, Disaster Recovery, Failover

And that's it!  Most of the companies on the list do all four items.
And if they aren't, you can expect they will.

With the exception of enterprise features, the rest are turning the
core product into a service.  That's typically low margin, and low
growth.  This might explain why we havent seen too many IPOs or even
aquistions of OSS product companies -- there just isn't any compelling
reasons to do so.  In the past, Oracle and IBM have scooped up
database companies, but it's not clear that they will continue to do
so.

For OSS companies, the roadmap is simple.  Get more customers (fine),
but also upsell existing customers.  For any problem a customer might
have the answer is likely "more": more training, more support, more
product, more upgrade... and likely more complexity.  I don't mean
that to be cynical or even wrong.  If the OSS product were simple, no
one would be paying for it. But as a purchaser of OSS products, one
needs to evaluate if the added complexity added by the upsell is
solving the your business problem or if you are solving an OSS problem
and perhaps a simpler solution would be better.
