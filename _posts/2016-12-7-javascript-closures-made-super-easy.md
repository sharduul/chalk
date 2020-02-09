---
layout: post
title: "JavaScript closures made super easy"
description: "How does JavaScript Closures work? Super simplified and a fun explanation of JavaScript Closures with examples. JavaScript scopes and closure explained."
tags: [javascript, the-what-series]
---

{% include image.html path="closure.jpg" path-detail="closure.jpg" alt="closures" %}


This post is aimed towards explaining the most misunderstood concept in JavaScript- Closures using super simple examples. In the simplest way possible!

You may have come across various definitions of Closures like:

### *Closures are functions that remember the environment in which they were created.*

(What is the environment they are talking about?)

OR

### *An inner function having access to the outer function's variables is called a closure.*

(What are inner and outer functions?)

OR.. (the most notorious one)

### *Closures are objects that contain a function and a reference to the environment in which the function was created.*

(...the what?)


Well, there's nothing wrong with the above definitions- except, they are too technical for an amateur like me to understand. Developers like me are very visual kinds. We need examples to understand any concept.

Alright then! Let's dive into some examples, and understand what makes them a closure. Starting with the easiest. No technical jargons, I promise!

1.

{% highlight javascript %}
var a = 25;
function foo() {
  console.log(a); // will output 25
}
foo();
{% endhighlight %}


Yes, the above simple "foo" function is a closure. The fact that it knows the value of "a", which is declared outside of its own scope makes it a closure.

Alright. That means, when a variable which is declared in higher scope is accessible to the function it is a closure. Interesting!

Let's see another example.


2.

{% highlight javascript %}
function outerFoo(){

	var a = 25;

	function innerFoo(){
		console.log(a); // will output 25
	}
	
	innerFoo();
}
{% endhighlight %}


Very similar to the first, the above is another simple example of closure. 

Again, the fact that "innerFoo" has access to the variable "a" which is outside its scope makes "innerFoo" function a closure.

The only difference being- in the first example "a" was declared in the global scope which is a parent to "foo" function while in the second example "a" is declared in the "outerFoo" function's scope which is again a parent to "innerFoo" function.

Is that it?

Yes! That's it. That's the definition of JavaScript closures.

So, what's so cool about Closures you might ask. A variable declared in higher scope being accessible in current scope is nothing unusual, isn't it?

### *Well, the beauty of Closures (and thus, of JavaScript) lies in the fact that "innerFoo" function remembers the value of "a" even after the call to "outerFoo" function is returned.* 

<br>

The example below demonstrates the same.

Note, that I have slightly modified the 2nd example as below-

3.

{% highlight javascript %}
function outerFoo(){

	var a = 25;

	function innerFoo(){
		console.log(a); // will output 25
	}
	
	return innerFoo; // return the inner function
}


var foo = outerFoo();
foo(); // will output 25 .. this is awesome!
{% endhighlight %}

The last statement of the above example makes Closures so special!

Let's, see what is going on here. A call to "outerFoo" function is made which returns "innerFoo" function. We assign the return value of "outerFoo" function to "foo" variable. Thus, "foo" is now really referencing "innerFoo" function. 

We then call the "foo" function which outputs the value of "a" which was originally declared in "outerFoo" function... which had been completely executed and returned... like centuries ago!!! (well, in the previous statement really).

Call to "foo" function logs value of "a" as 25 because "a" was kept in the closure of "innerFoo" function all this time.

### Conclusion:
That's it! By now, you might have realized that you have been using closures all this long and you didn't even realize it. That very fact makes it notorious.

Now go out there, and tell your interviewer that you know what JavaScript closures are!

### Further Resources We Recommend

#### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)
#### [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)