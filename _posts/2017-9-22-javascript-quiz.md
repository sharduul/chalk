---
layout: post
title: "JavaScript Quiz: How well do you know JavaScript?"
description: "Super simple explanation on AngularJS $http and $resource services. A practical guide to similarities and differences between $http and $resource and when to use which."
tags: [javascript, listicles]
og_image: "posts/tools.jpg"
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="JavaScript quiz" %}


Do you think you are a JavaScript expert? Or are you an aspiring Web developer? Well, this article is a test for you to crack then. Below are some fun and super important JavaScript concepts every web developer should know if they want to crack the JavaScript interview.

#### Question 1

What is the difference between `typeof` and `instanceof` operators?

#### Answer:

`typeof` operator simply returns the type of value. The basic primitive type of the value. So, you can use the `typeof` operator to check if it belongs to the basic types supported by JavaScript - number", "string", "boolean", "object", "function" or "undefined".

typeof true === "boolean"

`instanceof` operator matches the constructor of the provided object. So, when your value is of complex type consider using `instanceof`.

var foo = MyObject();
foo instanceof Object; //true
foo instanceof MyObject;  // true

On a side note. It is believed that `typeof` operator performs better than `instanceof` operator where both are applicable.


#### Question 2

How to delete an element from an array while iterating over it?

#### Answer:

Everyone knows to delete an element from an array you have to use `delete` operator. Easy!

HA! tricked you.

Never do that. `delete` just sets your deleted position to `undefined`. If you want to delete an item from an array always use `splice` function.


['a', 'b', 'c', 'd'].splice(1,1); // ['a', 'c', 'd']

But now, try doing it while you are iterating over an array. You are bound to hit an error at some point saying the position is `undefined`. In case of a simple array, you will just get wrong answers. See below.

I want to remove all 2's from the array.


var myarray = [1, 2, 2, 3, 5, 2, 4];
for(var i = 0; i < myarray.length; i++) {
  if(myarray[i] == 2){
    myarray.splice(i, 1);
  }
}


Logically the above code is perfect. But, do you think it will give me my expected result? No!

It returns:

[1, 2, 3, 5, 4]

This is because every time the item is spliced from the array the array is re-indexed. Simply put, your original value of `myarray.length` does not match the new one. So, the loop does not even get a chance to check some of the elements.

To fix this, simply iterate in from the top. In reverse order.

for(var i = myarray.length -1; i >= 0 ; i--){
    if(myarray[i] == 2){
        myarray.splice(i, 1);
    }
}

// myarray is now [1, 3, 5, 4]


#### Question 3 

What is 0.1 + 0.2 === 0.3?

#### Answer:

Sorry to burst the bubble, but the answer is `false`.

If you try this.

0.1 + 0.2
// 0.30000000000000004

Which is a little greater than `0.3` in our problem.

There are a lot of great explanations on how floating points are handled in JavaScript in this [Stackoverflow link](http://stackoverflow.com/questions/588004/is-floating-point-math-broken). Please go through them if you are really curious.


#### Question 4 

Do you know what is `!!` expression?

#### Answer

If you try to Google for this `!!` operator you will get all sorts of results. But not one correct result. So, if you are trying to search for this expression, you have to be smart. Search for `not not operator in JavaScript`. Or `double negation in JavaScript`.

This little experiment itself tells us that it not a very widely used expression. But, that does on do justice to its usefulness.

It basically forces to return the true boolean value of the provided expression.

So, you know `0` is a `falsy` value in JavaScript. But, if you do something like this:

0 === false // false

It will return false. But now, try this.

!!0 === fales // true

In short `!!` returns a true boolean representation of the expression provided.

You might ask why would I even do this if simple `0 == false` works for me. Well, this comes handy when dealing with custom types.

To check if the object is present we simply do:

if (myobject) {
    // do this
}

But, this restrains garbage collector from collecting that object even when it is no more needed. Because a reference to it is held in your code.

On the other hand, if you do:

if (!!myobject) {
    // do this
}

Your code is not holding a reference to the `myobject`. It just evaluates the true boolean value of it and it is not available for the garbage collector for the cleanup.


### Summary:
These were some fun and tricky questions in JavaScript you should be familiar with. In my similar future posts I would try to come up with some more fun questions like these.

Please let me know what do you think of these questions and how many of them you already knew?

