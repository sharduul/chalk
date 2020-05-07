---
layout: post
title: "How to improve web performance by using Preload, Preconnect, Prefetch"
description: "Essential VSCode extensions that will improve your productivity as Web Developers. This article contains a list of VSCode plugins that will make every JavaScript developer's life easy."
tags: [programming, vscode, listicles, web]
og_image: "posts/vscode.png"
---

{% include image.html path="posts/tricks.jpg" path-detail="posts/tricks.jpg" alt="How to improve web performance" %}

There are various ways through which we can improve the performance of our webpage.

Let's see about _preload_, _prefetch_, and _preconnect_ with which we can improve the performance of our webpage.

## Preload 

Since the name says it all "pre" and "load". This means loading the required resources for the page before the page is loaded. Preload is an updated version of **"subresource"**. The preload directive can be defined inside a `<link/>` tag.

The preload tag does not preload only the resources that are declared in HTML it also preloads the resources that are declared in CSS and JavaScript as well.

### Syntax

{% highlight javascript %}

<link rel= "preload" href = "/style.css" as= "style"/>

<link rel= "preload" href = "/script.js" as= "script"/>

{% endhighlight %}

### Other types that can be used

- style for stylesheets
- script for scripts
- font for fonts
- fetch for resources downloaded with fetch() or XMLHttpRequest

### Advantages of preload

1. Preload allows **setting priority** for the resources that are used on the webpage which is useful for _developers to optimize the webpage_.
2. It gives the ability to the browser to **determine the type of resource** which helps the browser to tell whether the resources can be reused in the future or not.
3. The browser can determine whether the **request is a complaint**.

### When to use preload

Use preload only when you'll need a resource soon. Preload will help when you know you'll need a resource soon after loading the page, and you want to start loading it earlier.

## Prefetch

For everyone's clarity prefetch is not similar to preload. Both are different directives used for different purposes. Prefetch is a low priority directive that allows the webpage to **fetch resources needed for the webpage in the background**.

Prefetch downloads require resources and store them in browsers cache for later use.

{% include image.html path="posts/specific/web-perf/prefetch.png" path-detail="posts/specific/web-perf/prefetch.png" alt="Prefetch" %}

### There are two types of prefetching:

1. Link Prefetching
2. DNS Prefetching
   

### 1. Link Prefetching

This will download the resources needed and store them in the browser's cache for later use.

This technique can speed up many interactive sites but does not work everywhere.

{% highlight javascript %}

<link rel="prefetch" href="/uploads/images/pic.png"/>

{% endhighlight %}

### 2. DNS Prefetching

DNS prefetching allows the browser to perform DNS lookups in the background while the browser is being used. This will reduce the latency since the DNS lookup has been made earlier.

{% highlight javascript %}

<link rel="dns-prefetch" href="//fonts.googleapis.com"/>

<link rel="dns-prefetch" href="//www.google-analytics.com"/>

{% endhighlight %}

## Preconnect

Again, the name implies what function preconnect does. Preconnect allows the browser to setup **early connection to the server before the actual HTTP request is made to the server**.

This includes various things such as DNS Lookups, TLS Negotiation, etc.,

For a clear explanation let us consider that the web page we are going to make contains fonts from google and it also uses some API. Instead of making a request when the page loads the connection can be made before and the data can be retrieved.

{% include image.html path="posts/specific/web-perf/preconnect.png" path-detail="posts/specific/web-perf/preconnect.png" alt="Preconnect" %}

Preconnect can be added directly to the link tag used on a webpage.

### Syntax

{% highlight javascript %}

<link href="https://cdn.domain.com" rel="preconnect" crossorigin/>

{% endhighlight %}


## Conclusion

These directives can be used appropriately as required in the webpage. These directives can help developers to improvise the performance of the web page when they are used correctly. These directives can also lower down your page when they are used in unnecessary places.


> Author: B. Vetrichelvan<br>
> Email: vetrichelvaninovator@gmail.com<br>
> Follow My Journey On [Instagram](https://www.instagram.com/pythonhub.py) 

---

<br>

#### Further Resources We Recommend

[The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2PElkvt)

<br>

## Read Next

- [How to make passive income? More importantly - WHY?](http://ngninja.com/posts/how-to-make-passive-income)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
