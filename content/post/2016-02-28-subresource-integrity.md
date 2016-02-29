+++
aliases = [ "20160229" ]
date = "2016-02-29"
draft = false
title = "Using Subresource Integrity to Secure Externally Hosted Content"
+++

One simple trick that can prevent you from distributing malware or aiding a DDoS attack from your CDN.
<!--more-->

Many CDNs provide hosting of common JavaScript libraries and CSS
frameworks.  Everyone loves using them since it's basically free
hosting and free performance. But since you don't control the CDN or
the content it is hosting, it's possible the content could be
compromised and is sending data that harms you or your customers.
Sound crazy?  It's happened before.

* The CDN itself it compromised and is sending malicious content.
  Fortunately I'm not aware of any examples here, but if it happened,
  it would be a very bad day for the Internet.
* The Origin is compromised and bad data is uploaded to the CDN. A
  variation of this happened recently with [Mint
  Linux](http://blog.linuxmint.com/?p=2994).
* A MITM attack (with or without TLS) that intercepts and alters
  externally hosted data mid-stream. This is how the [Great
  Cannon](https://en.wikipedia.org/wiki/Great_Cannon) was able to
  [cripple GitHub in March 2015](http://arstechnica.com/security/2015/03/github-battles-largest-ddos-in-sites-history-targeted-at-anti-censorship-tools/).

[Subresource integrity](http://www.w3.org/TR/SRI/) is easy to add and
prevents most if not all cases above.  You add the appropriate
cryptographic hash to your `script` and `link` tags that point to your
CDN.  If the data downloaded doesn't match the hash, the data is
discarded.  Your site might break, but you also won't be distributing
malware or unintentionally aiding DDoS attack.

Here's a sample from
[getbootstrap.com](http://getbootstrap.com/getting-started/#download)
(This is actually how I found out subresource integrity in the first
place).

```html
<link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
      integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
      crossorigin="anonymous">
```

The `integrity` attribute contains the cryptographic hash and
`crossorigin` attribute is for [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).  Much more detail can be found in
the [Mozilla Developer
Network](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity).
It's so simple and so effective, it's amazing it wasn't developed
years ago.

It would be fantastic if the CDNs started to publish SHA-384 hashes of
the content they are hosting.  I suspect in time they will.  Until
then, there are a number of ways to add subresource integrity hashes:

* Using the online tool [srihash](https://www.srihash.org)
* Manually using `cat FILENAME.js | openssl dgst -sha384 -binary | openssl enc -base64 -A` (accordiing to [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
* Automatically with a number of tools.  See the [subresource integrity wiki](https://github.com/w3c/webappsec-subresource-integrity/wiki/Links) for details.

According to
[caniuse.com](http://caniuse.com/#feat=subresource-integrity), as of
2016-02-29, somewhere between 40-50% of all web browsers supports
subresouce integrity.  If you add subresource integrity tags, be sure
to test in either the latest Chrome or Firefox browsers.  Sadly
[Safari](https://bugs.webkit.org/show_bug.cgi?id=148363) and
[IE](https://wpdev.uservoice.com/forums/257854-microsoft-edge-developer/suggestions/6263699-subresource-integrity)
do not support it yet.

It is good to know if a subresource integrity checks fails.  [Frederik
Braun](https://frederik-braun.com/using-subresource-integrity.html)
wrote up some tips on how to check and report failures (he's also one
of the editors of the
[specification](https://w3c.github.io/webappsec-subresource-integrity/)).
It's not clear to me if on failure an `event` is created or not.

While this is mostly focused on CDNs hosting *external* content, it's
also valuable if you are using a CDN to host your own content.  The
authenication mechanisms to deploy to your web site and deploy to a
CDN are different.  With SRI, you can detect possible compromise.
Considering how easy it is to add, and given the severity of the
issues it prevents, there is very little reason not to add subresource
integrity attributes.

### Link Farm

* [W3C Specification](https://w3c.github.io/webappsec-subresource-integrity/)
* [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
* [A CDN that can not XSS you: Using Subresource Integrity](https://frederik-braun.com/using-subresource-integrity.html)
* [GitHub Engineering: Subresource Integrity](http://githubengineering.com/subresource-integrity/)
* [Chrome Platform Status: Subresource Integrity](https://www.chromestatus.com/feature/6183089948590080)
