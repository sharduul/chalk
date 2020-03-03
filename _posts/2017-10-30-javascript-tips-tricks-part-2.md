---
layout: post
title: "Super powerful JavaScript tips & tricks - Part 2"
description: "Useful tips, tricks and hacks in JavaScript every developer should know about. JavaScript best practices. Learn super easy yet powerful tips of the day in Vanilla JavaScript."
tags: [javascript, listicles]
og_image: "posts/tricks.jpg"
---

{% include image.html path="posts/tricks.jpg" path-detail="posts/tricks.jpg" alt="JavaScript tips & tricks" %}

This article is the Part 2 of the JavaScript tricks series. Below is the list of all the parts of the series-

1. [JavaScript tips and tricks - Part 1](http://ngninja.com/posts/javascript-tricks)
2. [JavaScript tips and tricks - Part 2](http://ngninja.com/posts/javascript-tips-tricks-part-2)

I will be adding tricks to this series as I learn them. Keep in mind these tricks and tips are specifically for [ES5](https://en.wikipedia.org/wiki/ECMAScript).

Let's directly dive in.

### 1. Constructor like thingy in JavaScript

Developers coming from class-based languages are too much used to implementing constructors for initializing their class members. But, we don't have constructors in JavaScript.

What you can do instead, is use [IIFE pattern](https://codeburst.io/javascript-what-the-heck-is-an-immediately-invoked-function-expression-a0ed32b66c18) to initialize your members when the object is first created. 

{% highlight javascript %}
function Foo(){
  
  var name;
  
  // Constructor like thing in JavaScript
  (function(){
    
    name = "FooName";

    // Some other initialization logic
    
  })();
  
  this.getName = function(){
    return name;
  }
}


var foo = new Foo();
console.log(foo.getName()); // FooName
{% endhighlight %}

Although, you don't have to use the [IIFE pattern](https://codeburst.io/javascript-what-the-heck-is-an-immediately-invoked-function-expression-a0ed32b66c18) if you don't want to. Because, in JavaScript, when you say `new Foo()` it executes all the expressions in the function `Foo`. But, adding IIFE to your code makes it more structured and is more readable.


### 2. Check if the argument is a Number

Below is a correct way to validate Number types in JavaScript.

{% highlight javascript %}
function isNumber(n){
    return !isNaN(parseFloat(n)) && isFinite(n);
}
{% endhighlight %}

Let me know if you guys know any better way to do that.


### 3. Default Value

How do amateurs set default values?

{% highlight javascript %}
if(bar){
    foo = bar;
}
else {
    foo = default;
}
{% endhighlight %}

How do professionals set default values?

{% highlight javascript %}
foo = bar != null ? bar : default;
{% endhighlight %}

How do legends set default values?

{% highlight javascript %}
foo = bar || default;
{% endhighlight %}

### 4. TRUE sort your arrays

Have you ever had a facepalm moment when using the JavaScript sort function out-of-the-box?

If not, this is that moment.

{% highlight javascript %}
[3,2,1,10,4].sort(); // 1, 10, 2, 3, 4
{% endhighlight %}

Notice how JavaScript placed `10` between `1` and `2` when you sorted the array of numbers. Isn't JavaScript funny?

[Here](https://stackoverflow.com/a/7000924/1902831) is the reason behind it. In short, JavaScript converts objects to strings and performs a lexicographical sort on it by default.

To fix this below is the correct way to sort your numbers-

{% highlight javascript %}
[3,2,1,10,4].sort(function(a, b){ return a - b; }); // [1, 2, 3, 4, 10]
{% endhighlight %}

In [ES6](http://es6-features.org/), it becomes sexier-

{% highlight javascript %}
[3,2,1,10,4].sort((a,b) => a-b); // [1, 2, 3, 4, 10]
{% endhighlight %}

### 5. Disable Right click

Ever wanted to hide your implementation details from users? 

Here is one super important blog post on [how to make your JavaScript secure](http://ngninja.com/posts/secure-coding-javascript).

Another simple hack to add to it is to disable right click on the page so that users are not able to inspect your web app.

Of course, there are other workarounds to get away this. But, for most of the naive users- this should do the trick.

{% highlight javascript %}
<body oncontextmenu="return false">
    <div></div>
</body>
{% endhighlight %}

The attribute `oncontextmenu="return false"` disables the right-click menu on your web page.

### 6. Load IE specific script or CSS sheet

I am sure your customer, at some point, has changed requirements on you to support the Internet Explorer browser. No one is so lucky not to. :(

Well, you don't have to update your existing JavaScript or CSS code. You just can write IE specific functionality in a separate file and load that file if the browser is Internet Explorer.

Here's how you can load files just for the Internet Explorer. 

{% highlight javascript %}
<!-- [if IE]>
<script src="/js/script.js" />
<![endif]-->
{% endhighlight %}

Well, it's not limited to only IE. You can target any platform and write code specific to that platform. Isn't that neat?!

### Summary
These were more of my favorite JavaScript tricks I use regularly. It has made my life easy.

Let me know if you have come across similar situations. And what are your personal favorite JavaScript tricks that you're like to use?

Again, this article is the Part 2 of the JavaScript tricks series. Below is the list of all the parts of the series-


1. [JavaScript tips and tricks - Part 1](http://ngninja.com/posts/javascript-tricks)
2. [JavaScript tips and tricks - Part 2](http://ngninja.com/posts/javascript-tips-tricks-part-2)


#### Further Resources We Recommend

- [You Don't Know JS: Scope & Closures](https://amzn.to/2Idk9iz)
- [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/3cAwBHk)