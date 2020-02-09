---
layout: post
title: "Prototypal inheritance in JavaScript super simplified!"
description: "How does Prototypal inheritance work in JavaScript. Super simple explanation of what prototypal inheritance in JavaScript. What is dynamic inheritance. Nuances of Prototypal inheritance."
tags: [javascript, the-what-series]
og_image: "posts/chain.jpg"
---

{% include image.html path="posts/chain.jpg" path-detail="posts/chain.jpg" alt="Prototypal Inheritance" %}


One of the major points which differentiates JavaScript from other "classical" languages like Java, C++ is its ability of prototypal inheritance. It is also one of the reasons which make it more awesome than those classical languages. (More details on this in the later post.)

So, simply put- JavaScript does not have the concept of "classes"!

Then how does it support inheritance, you might ask. And if it does not support inheritance, dare you call it an object oriented programming language, you might argue.

Relax.

JavaScript does support inheritance. And, JavaScript is very well an object oriented programming language.

But, how?

There is a very special concept in JavaScript called as Prototype. A prototype is nothing but a template object which is linked to another object. Each object can be used as a prototype to link to another object. 

But, why would you do that?

Because in JavaScript, objects define their own structure unlike classes in Java or C++. Therefore, the structure of a given object can be used to create another new object.

When an object A is used as the prototype to create another object B, all the functions and members of object A auto-magically descends to object B.

By the way, don't forget to check out the [difference between JavaScript inheritance vs Java inheritance](http://ngninja.com/posts/prototypal-vs-classical-inheritance).

To see the above statement in practice, let's see an example:

A function object (JavaScript version of "class") "Person" is created with a member called "name" and a method called "printName" which prints the name of the Person.

{% highlight javascript %}
var Person = function(name) {
	this.name = name;
	this.printName = function(){
		console.log("My name is " + this.name);
	}
}
{% endhighlight %}

Now, let's create another function object called "Employee". It takes in a parameter called "name" and just calls the constructor of "Person". In case you are familiar with Java or C++, it is like calling super class's constructor.

What "call" does is- it sets the name property for the specified "this" pointer. So basically we are setting "name" property of "Employee" and not the "Person" object.

{% highlight javascript %}
var Employee = function(name) {
	Person.call(this, name); // set name in Parent function
}
{% endhighlight %}

Now let's use "Person" as a prototype for our new object "Employee". Thus we link "Person" object to the "Employee" object.

{% highlight javascript %}
Employee.prototype = new Person();
{% endhighlight %}

Now, whenever you create a new "Employee" object- its prototype will be set to "Person". 

And as mentioned in the beginning of the article, every Employee object will inherit members and methods of its prototype. Thus, "bob" being "Employee" object can set its "name" property and call "printName" method which are members declared in "Person" object.

{% highlight javascript %}
var bob = new Employee("Bob");
bob.printName(); // My name is Bob
{% endhighlight %}

The above magic is what is called as the Prototypal inheritance!

"bob" was linked to the "Person" object as its prototype. This linking of objects is called prototype chaining in JavaScript. Objects are linked together is this chain and the last piece of this chain is "null".

If you want to know more on how Prototypal inheritance is different and better than Classical inheritance- check out [this post](http://ngninja.com/posts/prototypal-vs-classical-inheritance).


### Summary:
This article was a basic primer on what is a prototype in JavaScript and how does it support inheritance- prototypal inheritance.

When working with JavaScript, you have to understand that it is different than Java or C++. It should be treated that way. So, to fully utilize its potential, embrace this difference of JavaScript.

Drop me a line to let me know what do you think of this article, or if I missed anything.



#### Further Resources We Recommend

### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)
### [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)