---
layout: post
title: "How SSL certificate works? In plain english."
description: "In plain english understand how does the SSL certificate works. What is HTTPs and SSL exactly. Secure socket layer make easy to understand."
tags: [web, security, the-what-series]
og_image: "posts/secure.jpg"
---

{% include image.html path="posts/secure.jpg" path-detail="posts/secure.jpg" alt="SSL certificate" %}

I am sure you must have heard about HTTPS. Ever wondered what does the "S" in HTTPS stands for? And, how does it really work? 

This article dives into the details of Security Socket Layer certificates and why you should care about it.

By the way, if you want to learn how to secure your JavaScript applications- [click here](http://ngninja.com/posts/secure-coding-javascript).

## What is SSL?

SSL stands for Secure Socket Layer.

In simple English, SSL encrypts the communication between your browser and the web server of the website you are visiting.

Basically, SSL is the answer to the following questions:

1. How do I trust this website?
2. How do I know this website is who they claim to be?
3. Is the data sent and received visible to others?
4. What if somebody modifies the data that is being transfered?

You can think of SSL as your passport. The passport identifies you and it lets the officer trust you. The information on the passport can always be trusted. Because the passport is issued by a trusted third party- the passport office.

In case of SSL too, there is a trusted third party which issue these SSL certificates. [Verisign](https://www.verisign.com/) and [Godaddy](https://www.godaddy.com/web-security/ssl-certificate) are popular examples of such third parties.

## How does SSL work?

Whenever you visit a website the SSL certificate is downloaded by your browser.

The browser runs security algorithms to check whether or not it trusts the SSL certificate. After it has trusted the certificate, it sends a message to the web server.

Upon receiving such message, SSL encrypted session is established between the web server and the browser.

Now any data shared between your browser and the server will always be encrypted.

## Make sure the website has HTTPS when-

You are making online payments or transfers.

You are entering sensitive data like username and password.

Communicating over direct messages.

## Bonus
By the way, HTTPS supported websites are potentially ranked higher in search engines! That's a good enough reason for us to get our website secured.

## Summary:
Above article was a primer on SSL certificates and HTTPS in simple language. It is basically a secret code shared between browser and web server for their secret communication.

If you want to learn how to secure your JavaScript applications- [click here](http://ngninja.com/posts/secure-coding-javascript).

