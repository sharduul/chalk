---
layout: post
title: "Most Frequently Asked JavaScript Interview Questions"
description: "Curated list of essential and most frequent JavaScript Interview Questions. Regular practice and some tips and tricks can get you to shine in the job interview."
tags: [javascript, listicles]
og_image: "posts/mistakes.jpg"
---

{% include image.html path="posts/mistakes.jpg" path-detail="posts/mistakes.jpg" alt="Most Frequently Asked JavaScript Interview Questions" %}

Javascript has been the backbone of many web development aspects. Getting a job in web development as a javascript(er) is not that hard. Regular practice and some tips and tricks can get you to shine in the job interview. Here are a few frequently asked questions in Javascript. 

Pat yourself if you know them.

## Question 1: Difference between “==” and “===”?

`==` only compares values. `===` compare values and type both.

{% include image.html path="posts/specific/js-faq/qna1.png" path-detail="posts/specific/js-faq/qna1.png" alt="Question Answer" %}

In the above code snippet, the value of true is 1, whereas the type of true is boolean. 

So `true === 1` will return `false` as its type is not 1.


## Question 2: What is the output of A and B?

<!-- | Syntax | Description |
| ----------- | ----------- |
| document.write({});|[object Object]|
| console.log({});|{}| -->  

{% highlight javascript %}
A. 
document.write({});

B. 
console.log({});
{% endhighlight %}

<!-- {% include image.html path="posts/specific/js-faq/qna2.png" path-detail="posts/specific/js-faq/qna2.png" alt="Question Answer" %} -->


`console.log` is used to log useful information on the console. It is more popularly used as a debugging strategy in JavaScript programs.

`document.write` modifies the DOM with arguments passed to it.

The curly braces `{}` are another way for creating objects in javascript. This is equivalent to the `new Object()` syntax which creates new Object literal.

So, `document.write({});` will clear the webpage content and replace it with a new object. Like below:

{% include image.html path="posts/specific/js-faq/qna21.png" path-detail="posts/specific/js-faq/qna21.png" alt="Question Answer" %}

<br>
<br>


> [Awesome JavaScript Tricks](/posts/6-javascript-tricks)


## Question 3: What is the `strict` mode in JavaScript and how can it be enabled? 

Strict mode is a way to introduce better error-checking into your code.

When you use strict mode, you cannot use implicitly declared variables, or assign a value to a read-only property, or add a property to an object that is not extensible.

You can enable strict mode by adding “use strict” at the beginning of a file, a program, or a function.


## Question 4: Compute the output.

{% highlight javascript %}

var Y = 1;
if (function F(){})
{
    Y += typeof(F);
}
console.log(Y);

{% endhighlight %}

{% include image.html path="posts/specific/js-faq/qna3.png" path-detail="posts/specific/js-faq/qna3.png" alt="Question Answer" %}

The output would be `1undefined`. 

The if condition statement evaluates using eval, so `eval(function F(){})` returns `function F(){}` - which is `true`. 

Therefore, inside the if statement, executing `typeof F` returns undefined because the if statement code executes at run time, and the statement inside the if condition is evaluated during run time.

## Question 5: Compute the output.

{% highlight javascript %}

var ob1= null;
var ob2= function a(){};
console.log(typeof ob1 === "object");
console.log(typeof ob2 === "object");

{% endhighlight %}

{% include image.html path="posts/specific/js-faq/qna1.png" path-detail="posts/specific/js-faq/qna1.png" alt="Question Answer" %}

`null` is an object whereas a function isn't. The function can be stored in a variable. The type of that stored variable will be of type function only


## Question 6: What is the difference between `unescape()` and `escape()`

### Unescape

It decodes the coded string.

Also computes a new string in which hexadecimal escape sequences are replaced with the character that it represents
  
{% include image.html path="posts/specific/js-faq/qna61.png" path-detail="posts/specific/js-faq/qna61.png" alt="Question Answer" %}

### Escape

It encodes the coded string.

Also computes a new string in which certain characters have been replaced by a hexadecimal escape sequence
  
{% include image.html path="posts/specific/js-faq/qna62.png" path-detail="posts/specific/js-faq/qna62.png" alt="Question Answer" %}


## Question 7: What do you understand by Closures in JavaScript?

A closure gives you access to an outer function's scope from an inner function. Even you can pass arguments to the inner function

{% include image.html path="posts/specific/js-faq/qna7.png" path-detail="posts/specific/js-faq/qna7.png" alt="Question Answer" %}

The function `sumMsg()` uses the variables `a and b` defined in the outer `function sum(a,b)`


> [JavaScript closures made super easy](/posts/javascript-closures-made-super-easy)


## Question 8: Event Bubbling in JavaScript

Event propagation in HTML DOM API

If you click on "HI", the "I am the first" will be invoked, then followed by "I am in between then I am last" as shown below

<!-- {% include image.html path="posts/specific/js-faq/qna8img.png" path-detail="posts/specific/js-faq/qna8img.png" alt="Question Answer" %} -->

It's like the circular waves. It starts from the inside.

{% highlight javascript %}
<style>
  body  {
    margin: 10px;
    border: 1px solid blue;
  }
</style>

<form onclick="alert('I am Last')">BYE
  <div onclick="alert('I am inbetween')">INBETWEEN
    <p onclick="alert('I am the first')">HI</p>
  </div>
</form>
{% endhighlight %}

{% include image.html path="posts/specific/js-faq/qna81.png" path-detail="posts/specific/js-faq/qna81.png" alt="Question Answer" %}

`onclick` is invoked when HI is clicked

{% include image.html path="posts/specific/js-faq/qna82.png" path-detail="posts/specific/js-faq/qna82.png" alt="Question Answer" %}

The next `onclick` is invoked after OK is clicked in the dialog box

{% include image.html path="posts/specific/js-faq/qna83.png" path-detail="posts/specific/js-faq/qna83.png" alt="Question Answer" %}

The last `onclick` is invoked after OK is clicked in the dialog box


## Conclusion

I hope these questions and answers got you more excited about JavaScript. If you are looking for a career in web development these JavaScript questions are very popular in the interviews.

Please comment below other such interesting questions that you might have come across.



> Author: Jairam Bala<br>
> I am Jairam, a Software Developer at Accenture. Software and Tech Enthusiast. Freelancer too.<br>
> Email: b.jairam0512@gmail.com<br>

---

<br>

#### Further Resources We Recommend

- [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/3cAwBHk)

<br>

## Read Next

[5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)