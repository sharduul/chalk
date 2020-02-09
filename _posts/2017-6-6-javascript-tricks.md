---
layout: post
title: "5 JavaScript tricks every developer should know"
description: "Useful tips, tricks and hacks in JavaScript every developer should know about. Truthy values in JavaScript. Logical operators in JavaScript."
tags: [javascript, listicles]
og_image: "posts/tools.jpg"
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="JavaScript tools" %}

There are tons of articles on the internet on the best practices you should follow when coding in JavaScript. This is not one of them.

This article is more on simple tricks and hacks that can save you time and make your code look beautiful. This is the Part 1 of the JavaScript tips and tricks series. Below is the list of all the parts in the series-

1. [JavaScript tips and tricks - Part 1](http://ngninja.com/posts/javascript-tricks)
2. [JavaScript tips and tricks - Part 2](http://ngninja.com/posts/javascript-tips-tricks-part-2)

So, let's dive in.

### 1. +str
Save yourself from using inbuilt functions like `Number()` or `parseInt()` when you want to convert string to an integer. Simple append `+` in front of the string and you will get the value as a number type. 

Of course, if the string is not a number it will return `NaN`.

But, you get point, right?!

### 2. if(some_variable) 
If you want to check whether an object is any of the following:
null, undefined, 0, NaN, false, or ""

Simply do:

{% highlight javascript %}
if(some_variable) {
  // you don't reach here if some_variable is any of the above list.
}
{% endhighlight %}

This simple trick saves you from writing long paragraph on the conditions to satisfy to execute certain block of code. Above `if block` simply checks whether the object has any falsy values or not.

### 3. Get max and min from an array
You can use the usual `Math.max` and `Math.min` even on the arrays to get the max and min values, respectively.

Here's how its done:

{% highlight javascript %}
var  numbers = [15, 58 , 10 , -225 , 22 , 122205, -85411]; 
var maxInNumbers = Math.max.apply(Math, numbers); 
var minInNumbers = Math.min.apply(Math, numbers);
{% endhighlight %}

### 4. Logical AND operator's awesomeness
The logical operators you have are pretty neat tools if you know how to use them. Let's see some cool tricks you can do with them.

Suppose you want to execute a function, if a certain condition is met:

{% highlight javascript %}
if(foo == "abc"){
  doSomething();
}
{% endhighlight %}

Anyone can write the above code.

But, true JavaScript ninja's follow smarter ways. We would write the above snippet like this:

{% highlight javascript %}
foo == "abc" && doSomething();
{% endhighlight %}

The above statement will execute `doSomething()` only when `foo == "abc"` condition is met.

Let's see what is happening here.

To understand why above statement works, you need to understand that when you use the `logical AND` operator it checks the second operand only if first operand returns `true`. 

If the first operand returns `false` the whole expression is going to be `false`. Hence, the second operand is not evaluated at all.

Therefore in the above example, to execute `doSomething()`, first `foo == "abc"` condition should be met. 

### 5. Logical OR operator's awesomeness
Similar to the above example, we can check the inverse using `logical OR` operator.

So, if you want to write something like this:

{% highlight javascript %}
if(foo != "abc"){
  doSomething();
}
{% endhighlight %}

You can display your ninja skills by writing:

{% highlight javascript %}
foo == "abc" || doSomething();
{% endhighlight %}

The reason why above statement works is because in `logical OR` operator, to evaluate the second operand the first operand should return `false`.

Which means to execute `doSomething()`, `foo == "abc"` should return `false`. Meaning, `foo != "abc"` should return `true`.

### Summary:
Above mentioned hacks are some of my favorites, which I use regularly in my projects. There are a ton of other tricks in JavaScript which make our lives easy. I will share them in my future post. 

Till then, do let me know what you think about these tips. Also, please let me know if you have some better one's.

Again, this article is the Part 2 of the JavaScript tricks series. Below is the list of all the parts of the series-


1. [JavaScript tips and tricks - Part 1](http://ngninja.com/posts/javascript-tricks)
2. [JavaScript tips and tricks - Part 2](http://ngninja.com/posts/javascript-tips-tricks-part-2)


## Further Resources We Recommend

### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)
### [You Don't Know JS: Up & Going](https://amzn.to/2u8YuVt)
### [The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2RIqGYk)