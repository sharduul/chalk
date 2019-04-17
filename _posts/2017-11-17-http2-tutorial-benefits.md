---
layout: post
title: "HTTP2 tutorial - Pros, Cons and other most frequently asked questions."
description: "What is HTTP/2? What do you need to know about it? Introduction to HTTP/2 in pure simple english. Pros and Congs and other popular questions."
tags: [web, http2, the-what-series]
og_image: "posts/specific/http2.jpg"
---

{% include image.html path="posts/specific/http2.jpg" path-detail="posts/specific/puzzle.jpg" alt="HTTP2" %}


One of every five people I meet is talking about this sizzling new topic- The [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2). But, I am not really sure how many of us really know what we are talking about exactly.

Some say it optimize our applications. Some clever heads talk about the speed improvements. And there are few, who actually care about security, talk about [how HTTP/2 affects the security](https://thehackernews.com/2016/08/http2-protocol-security.html).

This post dives into each of those aspects. And then, we will try to spice up the conversation by answering few of the popular questions around this topic which will help you decide is it time to switch your application to HTTP/2 yet or not.

## What is HTTP?

It stands for Hypertext Transfer Protocol.

In simple terms, it is a language that browsers use to talk to the Web servers.

For any website or a web application, its content is actually hosted on a remote machine- called the Web server. When you visit that website, your browser then makes use of this HTTP protocol to communicate with that machine. Get the contents. And display it on the screen for you.


## What is HTTP/2?

As the name suggests it is the 2nd version of the HTTP protocol. 

Ok, bye. (...just kidding)

Yes, it is a replacement of the previous version of HTTP protocol that browsers used. But, there's more to it.

HTTP/2 project was undertaken for two main purposes. Improving the performance and mitigating the cost of latency. It basically focusses on [improving the shortcomings of HTTP/1](http://vanseodesign.com/web-design/http2-performance/).


## What are the key features of HTTP/2?

### Binary data

HTTP/1 did all the communication using textual language. But, we all know that computers do not understand our language. They need the 0's and 1's. The binary language.

HTTP/2 to the rescue!

The new protocol does most of the heavy lifting here. It transfers the data in binary format instead of textual format. This saves a ton of time of the computers which would normally perform this conversion.

*It is like you are served a pre-chewed burger at the McDonald's.*

### Data compression

HTTP/2 improves compression by shrinking the average size of an HTTP header. 

This is really important. We know that every request and response contains HTTP headers. These headers can cause up to 1kb of overhead per transfer. This actually adds extra round trips just to get the headers out. Therefore, even a mild compression in the headers will help to complete the entire transfer in just one round trip. Which is a huge win. And, HTTP/2 enables us to achieve this.


### Server Push

Servers can now guess the next request and send the data proactively. Instead of just waiting for the clients to make the request. 

It makes the server smarter and pre-loads the required assets for your webpage saving the delay of one whole round trip.

If you are interested to learn HTTP/2 in-depth grab this book - [the practical guide on HTTP/2 for beginners](http://amzn.to/2AqSzt7). It's worth a read for building modern secured applications.


### Multiplexing

{% include image.html path="posts/specific/http2-multiplexing.png" path-detail="posts/specific/http2-multiplexing.png" alt="http2-multiplexing" %}

Don't freak out. It is just a fancy name for a very simple concept.

It basically allows your browser to download multiple resources with just one connection. The resource can be any message or any data. 

This overcomes the delays caused by ordered and blocking nature of TCP connections made by HTTP/1.

HTTP/1 actually had attempted to overcome this issue using something called as [pipelining](https://brianbondy.com/blog/119/what-you-should-know-about-http-pipelining). But it failed to completely address the problem as a large or a slow response still blocked the requests behind it.


English, please!

In short, HTTP/2 will give you following benefits:

1. Faster page loads
2. Longer, uninterrupted connections
3. Smarter servers- enabling Server push and Prioritization
4. Low costs of HTTP requests


## What are the drawbacks of HTTP/2? Is it worth upgrading to HTTP/2?
Older browsers are not expected to support HTTP/2. So, as a client-side user- you will have to update your browsers to the latest.

HTTP/2 requires most browsers to connect via [HTTPS encryption](http://ngninja.com/posts/how-secure-socket-layer-works) to the web server. So, if your website does not support HTTPS, the user will have to view it in some other client.

Some experts say HTTP/2 is not actually solving the real problems. It is just focussing on improving the speed, while the real problem it should have focussed on was privacy and security. Because cookie security is still an issue.

It can also create minor delays and complications in debugging, as HTTP/2 supports binary format instead of textual.


## How does HTTP/2 affect RESTful APIs?
As a backend developer working on RESTful API's, you wouldn't have to make any changes to your APIs. HTTP/2 doesn't change any semantics of the HTTP/1 protocol. Plus it is completely backward compatible.


### How does HTTP/2 affect SEO?
This is something people are really getting excited about.

HTTP/2 is expected to increase SEO rankings. This is mainly because of the performance improvements that HTTP/2 brings to our websites. And as you might know, [search engines like fast loading websites](https://moz.com/blog/how-website-speed-actually-impacts-search-ranking)!!!

If you are new to the SEO land - [this book](http://amzn.to/2zIIFD6) is a must read if you want to learn Search Engine Optimization in the year 2018 and beyond.


### Does HTTP/2 decrease or eliminate the need for CDN?
After learning about the benefits of HTTP/2 one might think that it will completely eliminate the use of CDN. Due to its speed improvements.

But, it does not.

Although HTTP/2 will definitely speed things up for you, it does not eliminate the need for a CDN. [The way CDN works](https://www.incapsula.com/cdn-guide/what-is-cdn-how-it-works.html), in short, is that it caches your assets geographically around the globe. Thus, it ensures lower latency and faster delivery to the viewers.

So, through multiplexing the requests will mitigate the cost of high latency in HTTP/2, a CDN is expected to give much faster throughputs.

Plus, a CDN is a goodie package filled up with other benefits like offloading, reliability and security of its own. So, please don't stop using CDN!


## Summary
All in all, HTTP/2 seems to be irresistible. The transition from HTTP/1 to HTTP/2 should be smooth for the users, while the backend engineers might have to tweak their web servers and applications to support it.

Users can expect to see some drastic improvements in the performances of the web application and websites. Plus, they can now worry lesser about their security and privacy.

If you want to understand HTTP in super simple language [this book](http://amzn.to/2zpdmze) will do a justice to it.

In my future post, I am planning to write about how you can start using HTTP/2 for your web applications.

Till then, here's something for you about [Web Security](http://ngninja.com/posts/how-secure-socket-layer-works).
