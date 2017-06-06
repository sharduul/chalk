---
layout: post
title: "5 JavaScript tricks every developer should know"
description: "Useful tips, tricks and hacks in JavaScript every developer should know about. Some shortcuts to make developers' lives easy."
tags: [javascript, listicles]
og_image: "posts/tools.jpg"
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="JavaScript tools" %}

There are tons of articles on the internet on the best practices you should follow when coding in JavaScript. This is not one of them.

This article is more on simple tricks and hacks that can save you time and make your code look beautiful.

So, let's dive in.

### 1. +str
Save yourself from using inbuilt functions like <pre>Number()</pre> or <pre>parseInt()</pre> when you want to convert string to an integer. Simple append <pre>+</pre> in front of the string and you will get the value as a number type. 

Of course, if the string is not a number it will return <pre>NaN</pre>.

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

This simple trick saves you from writing long paragraph on the conditions to satisfy to execute certain block of code. Above <pre>if block</pre> simply checks whether the object has any falsy values or not.

### 3. Get max and min from an array
You can use the usual <pre>Math.max</pre> and <pre>Math.min</pre> even on the arrays to get the max and min values, respectively.

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

The above statement will execute <pre>doSomething()</pre> only when <pre>foo == "abc"</pre> condition is met.

Let's see what is happening here.

To understand why above statement works, you need to understand that when you use the <pre>logical AND</pre> operator it checks the second operand only if first operand returns <pre>true</pre>. 

If the first operand returns <pre>false</pre> the whole expression is going to be <pre>false</pre>. Hence, the second operand is not evaluated at all.

Therefore in the above example, to execute <pre>doSomething()</pre>, first <pre>foo == "abc"</pre> condition should be met. 

### 5. Logical OR operator's awesomeness
Similar to the above example, we can check the inverse using <pre>logical OR</pre> operator.

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

The reason why above statement works is because in <pre>logical OR</pre> operator, to evaluate the second operand the first operand should return <pre>false</pre>.

Which means to execute <pre>doSomething()</pre>, <pre>foo == "abc"</pre> should return <pre>false</pre>. Meaning, <pre>foo != "abc"</pre> should return <pre>true</pre>.

###Summary:
Above mentioned hacks are some of my favorites, which I use regularly in my projects. There are a ton of other tricks in JavaScript which make our lives easy. I will share them in my future post. 

Till then, do let me know what you think about these tips. Also, please let me know if you have some better one's.
