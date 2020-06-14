---
layout: post
title: "How To Make Responsive Web Apps"
description: "This articles teaches you how to make your HTML responsive using media queries. Make a responsive website in easy steps."
tags: [programming, javascript, the-how-series]
og_image: "posts/specific/responsive.png"
---

Responsive Web Design means using HTML and CSS to automatically resize, hide, shrink, or
enlarge, a website, to make it look good on all devices (desktops, tablets, laptops, and
phones) as per size of the devices:


## Why Responsive?
A web page should look good and neat on any device.
It also be convenient to use.

{% include image.html path="posts/specific/responsive.png" path-detail="posts/specific/responsive.png" alt="What Is
Responsive" %}

## Setting The Viewport
The viewport is the user's visible area of a web page.

When making responsive web pages, add the `<meta>` element in all your web pages:

{% highlight javascript %}



<meta name="viewport" content="width=device-width, initial-scale=1.0">


{% endhighlight %}


This will set the viewport of your web page, which will give the browser instructions on how to
control the page's dimensions and scaling.

If we don't use the Viewport in the web page, then the web page doesn't look great and the contents in the  web page are
not resized according to the dimensions of devices.


## Responsive Images

Responsive images are images that scale nicely to fit in any browser size.

#Using the width Property

If the CSS `width` property is set to 100%, the image will be responsive and looks perfectly into the browser size:


{% highlight javascript %}


<img src="image path.jpg" style="width:100%;">


{% endhighlight %}

## Responsive Text Size

The text size can be set with a "vw" unit, which means the "viewport width".

That way the text size will follow the size of the browser window:

Viewport is the browser window size. 1vw = 1% of viewport width. If the viewport is 100cm wide, 1vw is 1cm.

{% highlight javascript %}


<h1 style="font-size:20vw">Your learning from Ninja Academy</h1>


{% endhighlight %}


## Media Queries

A media query is an HTML/CSS functionality that allows the content of a Web page to adapt to the type of media that the page is being rendered in, such as a computer screen or that of a phone or tablet. 

This is considered as a core technology for implementing responsive Web design.

In addition to resize text and images, it is also common to use media queries for making your web page responsive.

With media queries you can define completely different styles for different browser sizes.


It is advised to run this code snippets by changing the size of your browser.


{% highlight javascript %}


<html>
  <head>
    <style>
      .left {
        background-color: #915413;

        float: left;
        width: 30%;
      }

      .right {
        background-color: #806613;

        float: left;
        width: 30%;
      }

      .main {
        background-color: #4caf50;

        float: left;
        width: 70%;
      }

      @media screen and (max-width: 800px) {
        .left,
        .main,
        .right {
          width: 100%;
        }
      }
    </style>
  </head>

  <body>
    <h2>Your learning</h2>

    <div class="left">
      <p>Media Queries</p>
      <br />
    </div>

    <div class="main">
      <p>in</p>
      <br />
    </div>

    <div class="right">
      <p>Ninja Academy</p>
    </div>
  </body>
</html>


{% endhighlight %}


In the above code you can see how we used the media queries to display 3 contents on the browser.

It's time to see the output of that content. Here you go.

{% include image.html path="posts/specific/360 X 740.png" path-detail="posts/specific/360 X 740.png" alt="360 X 740.png" %}

In the above picture you can observe that the dimension of the browser is **360 X 740**.The content is adjusted to size of the browser.

Let's change the dimension of the browser and check again.

{% include image.html path="posts/specific/800 * 1280.png" path-detail="posts/specific/800 * 1280.png" alt="800 * 1280.png" %}


In the above picture you can observe that the dimension of the browser is **800 X 1280**.The content is adjusted to size of the browser.


> Author: B.K.Sai Kalyan <br>
> Gmail: saikalyan1729@gmail.com <br>
> To know more about the author: [website](https://sites.google.com/view/sai-kalyan-bhagavathula/home?authuser=1) <br>

---

<br>

## Read Next

- [Most Frequently Asked JavaScript Interview Questions](/posts/frequently-asked-javascript-interview-questions)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
