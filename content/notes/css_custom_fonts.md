---
title: "using custom fonts in a web page"
tags:
- web
- CSS
---

# fonts

2022 update: now I just use system fonts. Cf. <https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/>

---

TL;DR:

+ add your own fonts by referring to them in style.css and making sure they exist
+ if the font is available on Google Fonts (and mine was), go to <https://google-webfonts-helper.herokuapp.com/fonts/ibm-plex-serif>
+ download the woff and woff2 files for the fonts you want
+ put these in a fonts directory in your website
+ link to them in your css
+ add the line `font-display: swap;` to `@font-face` to avoid invisible text during loading
+ add caching to make subsequent loads faster - `relayd(8)`

---

In making my website more minimal, but still my own, font choice seemed a good place to start. I love IBM Plex, and use it everywhere. I wanted to use it on my website, but was a little confused as to how to make it happen without needing a dynamic link to some other website to source the font (e.g. IBM Plex has been added to Google Fonts, so an easy way to get it on my website is to link to their resource). The problem with this is that it needs to query their website every time a new visitor comes to mine, and that is less efficient and makes me dependent on Google. (Btw, the most suckless thing to do would be to just use the user's system monospaced font with `font-family:monospace` -- that's exactly what suckless.org does -- but this is a *personal* blog, dammit, and I'm going to strike a balance between minimalism and personality -- call it essentialism, maybe)

I've been using Derek Sivers' website design as inspiration in a few areas (<https://sivers.org/style.css>),
and noticed that his stylesheet has a bunch of gobbledygook at the beginning that looked like a base64-encoded file,
dumped right in his plaintext CSS.
That is exactly what it is,
a font called "valkyrie_c4,"
that is loaded every time his style.css is loaded.
Inspired by that, but wanting to make my style.css a little more readable,
I poked around and found `google-webfonts-helper`,
a very cool herokuapp that lets you extract Google Fonts into various formats,
including the woff/woff2 format Derek is using.
(<https://google-webfonts-helper.herokuapp.com/fonts/ibm-plex-serif>)
It also gives you a code snippet to include in your css,
which does the same thing Derek's base64 encoding does but puts the font source code in a different file,
making the css file more readable.
It also gives the advantage that after the font is loaded the first time on a user's browser, it can be cached,
making subsequent loads of your already smoking fast static site even faster
(I currently have a Google PageSpeed of 99/100,
with the point docked for a few things including not yet having a font-display css feature,
and not having a caching policy,
which I used to think was a good idea but might just add complexity I don't really need since my load times are fast without it
- <https://ifconfig.se/simple-web-stack.html>).

Google PageSpeed gives a few tips,
and I got mine to 100/100 by just adding `font-display: swap;` to the `@font-face` sections of my style.css.
This lets the browser use an existing font while the other font is loaded. <https://web.dev/font-display/>

Adding caching takes a little more work on OpenBSD with httpd, because httpd doesn't do caching.
I love that OpenBSD fights feature creep! Instead, use `relayd(8)`.

Some resources on `relayd(8)` and caching:

- <https://github.com/reyk/httpd/wiki/Using-relayd-to-add-Cache-Control-headers-to-httpd-traffic>
- <https://parksdigital.com/httpd-and-relayd-on-openbsd.html>
- <https://ifconfig.se/simple-web-stack.html>
- <https://web.dev/uses-long-cache-ttl>

Sun 28 Jun 2020 06:36:52 AM CDT
