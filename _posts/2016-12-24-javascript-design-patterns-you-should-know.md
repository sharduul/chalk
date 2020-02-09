---
layout: post
title: "2 JavaScript Design Patterns that every developer should know"
description: "Two super important design patterns in JavaScript made easy to learn and implement."
tags: [javascript, design-patterns, listicles]
og_image: "posts/design-patterns.jpg"
---

{% include image.html path="posts/design-patterns.jpg" path-detail="posts/design-patterns.jpg" alt="design-patterns" %}


If you want to make your application maintainable and scalable, following right coding practices is very important. In order to write such a code- using well tested, proven and reusable software solutions can come quite handy. And that is what design patterns are all about-

#### *1. they are proven and well-tested solutions for frequently occurring software development problems.*

#### *2. they make your code scalable by structuring your code-base the correct way.*

#### *3. they are reusable for similar occurring problems.*

This post is all about discussing how the two "must know" design patterns- Singleton and Module, can be implemented in JavaScript. We shall also discuss why the pattern in question is important and when is it appropriate to use them.

### Singleton pattern
Imagine a service, where all the shared states and behaviors are maintained. A service that is shared throughout the application. In this case, creating multiple instances of such a service will defeat the whole purpose of having something shared across the application.

Therefore, what we would like to have is a single instance of such a service injected wherever necessary in the application. 

A great analogy could be a coffee machine in your department. You don't bring your own coffee machine to the office. A single coffee machine is shared amongst all the colleagues.

But, how do we do it?

Well, this is where Singleton design pattern comes to our rescue. This pattern gives us the ability to instantiate and return only one object, irrespective of repeated calls to its constructor. Once the singleton object is created, it returns itself every time some client tries to instantiate the class.

Let's see a simplest implementation of Singleton design pattern in JavaScript.


{% highlight javascript %}
var CoffeeMachine = function(){
	var coffeeMachineInstance;

	function init(){
		return {
			brew: function(){
				console.log("brewing coffee");
			}
		}
	}
	
	return {
		getInstance: function(){
		
			if(!coffeeMachineInstance) {
				coffeeMachineInstance = init();
			}
			
			return coffeeMachineInstance;
		}
	}
}
{% endhighlight %}


Above is a very simple implementation of Singleton where access to "coffeeMachineInstance" object is given via "getInstance" function. Every time a client wants to instantiate "CoffeeMachine" it will call its "getInstance" function which will return the same "coffeeMachineInstance" object. The class "CoffeeMachine" will create the object if it is not already instantiated.

This can be proved using below code snippet. You can see that "machine1" and "machine2" refers to the same object.

{% highlight javascript %}
var machine1 = CoffeeMachine.getInstance();
var machine2 = CoffeeMachine.getInstance();
 
alert("Same instance? " + (machine1 === machine2)); // true
{% endhighlight %}


### Module pattern
Every developer should know that tight coupling between different components of code is something to avoid as much as possible. JavaScript modules make this a breeze by providing you loose coupling between different components of your code.

To implement modules in JavaScript, we make use of [Immediately Invoked Function Expression pattern (IIFE)](http://stackoverflow.com/questions/8228281/what-is-the-function-construct-in-javascript). 

Details on IIFE and its benefits deserves its own separate post- which will be covered in future. But simply put, they are functions which executes themselves immediately after declaring. They are used to create a "private" scope by creating a closure. 

If you are not familiar with closure, you might want to know [what closures are in simplest terms](http://ngninja.com/posts/javascript-closures-made-super-easy), before reading further.

IIFE looks something like this:

{% highlight javascript %}
(function(){
	
	// your code here..

})();
{% endhighlight %}


So, using IIFE we can create modules like below, which can then be used in other places in our application.


{% highlight javascript %}
var MyModule = (function(){
	var privateVariable;
	
	var privateFunction = function(){
		privateVariable = 5;
		console.log("private function");
	}

	return {
		publicFunction: function(){
			privateFunction();
		}
	}

})();

MyModule.publicFunction(); // "private function"
console.log(MyModule.privateVariable);  // undefined
{% endhighlight %}

In the above example, a module named "MyModule" is created which can then be imported in other modules and used to access the private members of its closure via public methods- "publicFunction" in this case. But, when you try to directly access the private members like "privateVariable"- they are undefined.


### Summary:
Above is a simple explanation on two very popular design patterns. So now, you should be able to recognize them and use them in your next project- which I highly recommend you to do so.



#### Further Resources We Recommend

### [You Don't Know JS: Up & Going](https://amzn.to/2u8YuVt)
### [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)
### [The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2RIqGYk)



