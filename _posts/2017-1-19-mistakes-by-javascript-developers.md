---
layout: post
title: "5 Common mistakes JavaScript developers make"
description: "List of common mistakes you would want to avoid to become a JavaScript ninja. JavaScript Callback functions. JavaScript scopes. Strings in JavaScript."
tags: [javascript, listicles]
og_image: "posts/mistakes.jpg"
---

{% include image.html path="posts/mistakes.jpg" path-detail="posts/mistakes.jpg" alt="Mistakes" %}



Let's dive into the list of mistakes directly.


### 1. Falling in the callback hell
One of the awesome features that JavaScript offers is callbacks. Callbacks are nothing special than normal functions. Just that, it lets you handle asynchrony. 

Simple callback example:

{% highlight javascript %}
var results = null;
updateCustomer(customerDetails, function(data){
	results = data;
});

function updateCustomer(customerDetails, cb){
	// update customer in database
	cb(data);
}
{% endhighlight %}


So, in the above function call to "updateCustomer" updates customer information in the database. In order to return this updated information we call the callback function at the end of "updateCustomer" and pass it the results as the parameter.

This is a simple way we can handle asynchrony in JavaScript.

But, if not handled properly this method of using callback functions can get real messy, real soon.

What happens when there are multiple functions which depend on the results returned by the other function?

Usage of such functions will look something like this:

{% highlight javascript %}
updateInfo(x, function(y){
	updateOtherInfo(y, function(z){
		updateYetOtherInfo(z, function(a){
			// ...
		});
	});
});
{% endhighlight %}

The above pyramid-like structure is called as callback hell in JavaScript. The long and short of it is, that it is not recommended for a simple reason that it makes it hard to follow and worse to maintain.


### 2. Misunderstanding "===" operator
This is a classic interview question- what is a difference between "==" and "===" operators. Understanding this difference will take you one step closer to understanding the weirdness of JavaScript.

To make it real simple, keep this in mind. 

*"===" behaves just like "==" operator. Except, "===" also compares the types.*

Let's see an example:

{% highlight javascript %}
1 == "1" 	// true
1 === "1" 	// false
{% endhighlight %}

In the above example, "==" operator just did a value comparison. Meaning, it implicitly converted necessary types of operands and compared their equality.

But, as the data types of 1 and "1" are not same, "===" returned false. Because "===" operator does not do any type conversion for you. It strictly checks if the type of operands is same and whether their values are equal as well.


### 3. Missing semicolons:
JavaScript is a super intelligent language. Its parsers are trained such that they will insert semicolons even if you leave them out.

But, my suggestion would be- don't fall into this trap. It might backfire on you.

Consider this classic example:

{% highlight javascript %}
function foo(){
	return
	10
}
{% endhighlight %}

Above amazing "foo" function is expected to return 10 every time it is executed. But, JavaScript being an intelligent language interprets it completely differently.

JavaScript's interpretation of above function:

{% highlight javascript %}
function foo(){
	return;
	10;
}
{% endhighlight %}

JavaScript, like above, might put semicolons in unexpected areas if not provided by us. So, to be on the safer side always put those semicolons yourself.


### 4. Forgetting that variables are not block scoped
Amongst many differences between JavaScript and other class-based languages like Java, C++ is that JavaScript support function scope. Not a block scope.

To understand function scope, follow the below example:


{% highlight javascript %}
function foo(){
 
  if(true){
     var y = 10;
  }
  
  console.log(y); // displays 10
}
{% endhighlight %}


In the above "foo" function, I have written an if-block. In that if-block I have declared a variable called "y". And outside the if-block, I am accessing the variable "y" to display its value.

If you try to do something like this in Java or C++, your compiler will through an error. That is because they are block-scoped language. Therefore, in such languages you cannot access the variable outside the block of code it is declared in.

But, JavaScript is different. JavaScript supports function scope. So, when you try to access "y" variable outside the if-block it successfully displays its value as 10.

This is because JavaScript has a concept called Hoisting. In simple terms, JavaScript moves all the declared variables at the top of the function. So, you can access those variables from anywhere in that function.



### 5. Confusing Addition and Concatenation
There is a common operator used to add numbers and concatenate strings. That is "+".

When you use "+" operator with two same types, you are safe. Let's checkout a code snippet:

{% highlight javascript %}
var sum = 10 + 5; 		// 15
var str = "10" + "5" 	// "105"
{% endhighlight %}

Above code behaves as we expect. But, the problem occurs when you try to use "+" operator with mixed types. 

Like below:

{% highlight javascript %}
var sum = 10 + "5"; 	// "105"
{% endhighlight %}

In the above use case, one would expect to add number 10 to string "5" and get 15 as a result. But they would be tricked by JavaScript.

The answer you get is "105" because JavaScript implicitly does a type conversion of number 10 to a string "10". Therefore, instead of adding two numbers JavaScript concatenates two strings.

There is a simple trick to get around the above problem. Let's see it in action:

{% highlight javascript %}
var sum = 10 + +"5"; 	// 15
{% endhighlight %}

Yes, you read it right. Use "+" in front of the operand. This tells JavaScript to convert it to a number before adding the two operands.


### Summary:
Above mistakes may seem silly and trivial, but when you are working on a complex application it becomes tough to track them down.

Someone has well said, to become a perfectionist you need to practice more. That is true in this case as well. To understand JavaScript at its core, we have to practice it thoroughly. Checkout my post on [this year's programming challenges](http://ngninja.com/posts/new-year-programming-challenge) if you need to practice your coding skills.

In the next part I will cover more common mistakes committed by JavaScript developers. Stay tuned. And do let me know how many of you have commit these or some other silly mistakes?



