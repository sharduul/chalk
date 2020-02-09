---
layout: post
title: "Is JavaScript really an Object Oriented Language?"
description: "Let's analyse whether JavaScript is really an object oriented language or not. What is Object Oriented Language. How is JavaScript an Object oriented language."
tags: [javascript, object-oriented-programming]
og_image: "posts/analyse.jpg"
---

{% include image.html path="posts/analyse.jpg" path-detail="posts/analyse.jpg" alt="OOPs" %}

There have been a lot of debate over whether or not JavaScript is an Object Oriented Programming language. 

After reading a lot of material on this question I have a short answer for you- YES, JavaScript is an OOP language!

Especially when JS-ninjas who are known for their contributions to the language itself, like [Douglas Crockford say it](http://javascript.crockford.com/javascript.html), you might want to believe it. 

Let's go a little deeper into why JavaScript might be an OOP language. 

So, what makes any programming language Object Oriented? Well, there are various definitions on this but essentially, for any language to be Object Oriented language it has to support following important features at the least:

 *1. Encapsulation - Object's internal working is hidden from the rest of the application.*
 
 *2. Inheritance - Object can inherit properties and method from a parent object.*
 
 *3. Polymorphism - Object can having multiple forms.*

So, if we can prove that JavaScript supports all of the above features we can call it an Object Oriented Programming language. Let's see each feature one by one in action using JavaScript.

### Encapsulation.
Encapsulation simply means, private data of an Object should not be directly accessible to the outside world. There should be methods to get and to set the internal properties of that object.

First, let's see, what is NOT encapsulation?

{% highlight javascript %}
var Person = function (){
	return {
		fullName: "John Doe"
	};
};

var user = Person();
console.log(user.fullName); // "John Doe"
user.fullName = "Foo Joe"
{% endhighlight %}

Although it is perfectly legal to write the above code, it is not a recommended way to write it that way due to various reasons like the security of the code, its lack of ability to validate the code, and much more.

So, what is encapsulation?

{% highlight javascript %}
var Person = function (){
	var fullName = "John Doe";

	return {
		getName: function(){
			return fullName;
		},
		setName: function(name){
			fullName = name;
		}
	};
};


var user = Person();
console.log(user.getName()); // "John Doe"
user.setName("Foo Joe");
{% endhighlight %}

The above code is encapsulated because the property "fullName" cannot be accessed from anywhere outside the "Person" function. 

Thus, by the definition of encapsulation we saw above, it is proved that JavaScript supports encapsulation.


### Inheritance.
This feature gives the ability to an object to inherit functionality and properties from parent objects.

Developers coming from C++/Java background- please be advised that JavaScript supports prototypal inheritance and not the usual classical inheritance. 

I will cover what are prototypes and what is prototypal inheritance in future post. But, for now, it simply means that each object in JavaScript serves as a prototype which can be cloned to create another object having similar behavior as the original object in question.

Now, let's look at a very simple example demonstrating prototypal inheritance in JavaScript.

{% highlight javascript %}
var animal = { sleeps: true };

var tiger = Object.create(animal);
tiger.eats = true;

console.log(tiger.sleeps); // true
console.log(tiger.eats); // true
{% endhighlight %}

In the above example, Object.create() is used to create a new object by specifying its prototype object. A "tiger" object was created using "animal" as its prototype. And due to prototypal inheritance, "tiger" object also got "sleeps" property from its parent "animal" object.

Thus, by the definition of prototypal inheritance, it is proved that JavaScript supports inheritance.


### Polymorphism.
JavaScript being a dynamic language by nature, it does not support all the classical types of polymorphism like function overloading or parametric based polymorphism. But, based on the kind of inheritance it exhibits, JavaScript supports subtype polymorphism which is very popular in even class-based languages like Java/C++.

Continuing the same example we saw in inheritance, let's see how polymorphism can be implemented in JavaScript.

{% highlight javascript %}
var animal = { 
  sleeps: true,
  getInfo: function(){
    return "I am animal";
  }
};
{% endhighlight %}

"animal" is a base object. Let's inherit "lion" and "tiger" objects from "animal".

{% highlight javascript %}
var lion = Object.create(animal);

var tiger = Object.create(animal);
tiger.getInfo = function(){
  return "I am tiger";
};
{% endhighlight %}

We used Object.create() method to inherit "lion" and "tiger" objects from "animal". Then for the "tiger" object we overrode the "getInfo" function to be more specific to that object. But, we did not do the same for the "lion" object.

Now, let's see what happens when "getInfo" function is called on both the objects.

{% highlight javascript %}
console.log(lion.getInfo()); // "I am animal"
console.log(tiger.getInfo()); // "I am tiger"
{% endhighlight %}

As we did not override "getInfo" function for "lion" object it uses the "getInfo" function of its parent, that is, "animal" object. On the other hand, we wrote a specific "getInfo" function for the "tiger" object hence when the "getInfo" was executed on it, it executed the specific function to that object instead of the "getInfo" function of its parent Animal object.

The "getInfo" function is resolved at runtime, and this is called late binding or dynamic Polymorphism.

Thus, it is proved that JavaScript supports polymorphism.

### Summary:
Based on above examples, we can definitely say that, although different from class-based languages,
 JavaScript is also an Object Oriented Programming language.


#### Further Resources We Recommend

- [You Don't Know JS: Up & Going](https://amzn.to/2u8YuVt)
- [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)