---
layout: post
title: "Super simplified explanation of 'this' keyword in JavaScript"
description: "JavaScript "this" keyword made super simple to understand. How does "this" work in JavaScript. 
tags: [javascript, the-what-series]
og_image: "posts/this.jpg"
---

{% include image.html path="posts/this.jpg" path-detail="posts/this.jpg" alt="this" %}


People coming from C++, Java, C# background often complain about JavaScript being confusing. One of their main complaints is the confusion about the "this" keyword in JavaScript. 

If you have previously studied class-based languages, you might know that "this" refers to the current object instantiated from the class. That's it!

Following is a java code demonstrating the above statement:

{% highlight java %}

class Foo
{
	public void displayThis()
  	{
    	System.out.print(this);
  	}

	public static void main (String[] args) throws java.lang.Exception
	{
		Foo fooObj = new Foo();
		fooObj.displayThis();
	}
}

{% endhighlight %}


The above Java code snippet demonstrates how "this" refers to the currently instantiated object that calls the method. So, every time a method is called, it's easy enough to predict the value of "this".

On the other hand, in JavaScript "this" keyword refers to the current execution context. In simpler terms, "this" refers to the object that owns the current piece of code being executed.

Execution context is a deep concept, and outside the scope of this article. But, one thing to know about the execution context in JavaScript is that every time a function is called, a new execution context is created. And the value of "this" depends on the object that function call is attached to- this is, the caller of the function. 

But, the most interesting part is that the value of "this" can be changed! 


Take a look at the JavaScript code below:


{% highlight javascript %}

var myObject = { x : 100};
var x = 1;

function display(){
  console.log(this.x);
}

display(); // will alert window.x which is 1
display.apply(myObject); // will alert obj.x which is 100

{% endhighlight %}

Above is a simple example which demonstrates how the value of "this" can be manipulated. 

In real world applications, given the dynamic nature of JavaScript language the value of "this" changes very often and it becomes hard to predict its value at any given point of time. 

Main culprits for this tricky behavior are the callback functions, closures and the fact that functions in JavaScript are actually objects which can be manipulated, assigned and passed as arguments.

### Conclusion:
I will cover all the tricky scenarios of "this" keyword in my future post. But, "this" post (pun intended!) should give you a basic understanding of what is "this" and why is "this" special in JavaScript.

