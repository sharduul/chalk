---
layout: post
title: "5 Practices to write a secure JavaScript web application"
description: "Actionable items to make your JavaScript based Web application more secure. Security principles to make your JavaScript code hack-secure."
tags: [javascript, the-how-series, security]
og_image: "posts/secure.jpg"
---

{% include image.html path="posts/secure.jpg" path-detail="posts/secure.jpg" alt="Service vs Factory vs Providers" %}

[Studies](http://www.hackmageddon.com/category/security/cyber-attacks-statistics/) have shown that cyber crimes are at all time high, and they are increasing as you are reading this. 

As software programmers, it is our duty to take the things in our hand and do something about it. Not everyone might be a pro in security and know how hackers work. But, at the very least, we can follow some of the best practices to mitigate such attacks and avoid them as much as possible. And trust me, they work.

So, let's dive into some actionable items that you can follow to make your code more secure.

### 1. Trust nobody.
When writing code for web applications, do yourself a favor- trust nobody. In terms of data at least. 

One super important technique to avoid JavaScript vulnerabilities is to have a good validation architecture in place.

May it be the data coming from users. Or may it be the data coming from your servers. Always validate the data before it enters the application.

In the case of user input forms- validate each and every field. [Sql injections and XSS](https://www.codeproject.com/Articles/102284/SQL-Injection-and-Cross-Site-Scripting) are dramatically increasing these days. So, make sure you validate each and every field on the form before you save the data to the server.

Even when the data is saved on the servers, do not trust them. Always sanitize the data coming from the servers.

If your's is a node based application have a look at [validator.js](https://github.com/chriso/validator.js). It's something you should start using right away.


### 2. Minify and Obfuscate:
One of the ways hackers work is they first try to understand your JavaScript code- which is readily available in the browsers. After they understand your code, you can be sure of one thing- you app is in danger!

So, a simple practice you should always follow is to minify and obfuscate your JavaScript code.

To minify is to remove unnecessary characters from your JavaScript code. And to obfuscate is to modify your JavaScript code in such a way that it would be hard to understand it.

Below are some tools you can use to minify your code:
1. [JavaScript compression tool](https://jscompress.com/)
2. [Minify your JavaScript](http://javascript-minifier.com/)
3. [Online JavaScript Compression](http://refresh-sf.com/)


Below are some tools you can use to obfuscate your code:
1. [JavaScript Obfuscator](https://javascriptobfuscator.com/)
2. [UglifyJS](https://github.com/mishoo/UglifyJS)


### 3. Lint your code
If you have been following my blogs you might have heard this sentence a lot- JavaScript is a dynamic and very flexible language. But, it is worth repeating. 

JavaScript is a dynamic and very flexible language.

And that is the very reason developers can accidentally introduce mistakes which can backfire at them.

Linting is a process through which you can have someone keep an eye on you and shout at you when you write something which you are not supposed to. Except it's not a real person, but a tool at your disposal.

You can read more on [Linting in JavaScript here](http://stackoverflow.com/questions/8503559/what-is-linting). But in short, linting is a process which analyzes your code and warns you if something looks suspicious.

Some of the tools you can play around with are:
1. [JSLint](http://www.jslint.com/)
2. [JSHint](http://jshint.com/)
3. [ESLint](http://eslint.org/)


### 4. Always have the Strict mode on
I have always wondered why ECMA does not make this mode a default. By the way, if you start using any of the above linting tools mentioned above- first warning you are going to get is about not using the strict mode. So, please make sure you have the strict mode on when coding in JavaScript.

To turn on the strict mode add "use strict" as the first statement in your JavaScript file.

Long and short, strict mode throws more exceptions. It does not allow us to take any unsafe actions, like accessing declaring global objects. Basically, it makes sure your code is well thought out.


### 5. Keep it simple
This is true in programming world too, as much as it is true in real life. Always strive to keep things simple. Your UI design. The overall architecture of your software. Because the more complexity you will introduce in your app, the more vulnerable it will be and easier it will be for the invaders to breach it.

So, always follow the best coding practices and style guides. For starters, this is a [JavaScript style guide by Airbnb](https://github.com/airbnb/javascript) you can follow. It's one of my favorites.


### Summary:
These are some of the simplest yet effective action items you can follow to understand more about the technology you are working on and make your app less vulnerable to any kind of breach.

