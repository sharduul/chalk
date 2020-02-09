---
layout: post
title: "3 Advanced lodash functions you should have up your sleeve"
description: "Lets become a Lodash-ninja and streamline your JavaScript code using some cool Lodash functions. How to use Lodash with JavaScript. Flatten JavaScript arrays. Chaining methods in JavaScript. Currying in JavaScript."
tags: [javascript, lodash, listicles]
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="Lodash" %}


In my [previous post](http://ngninja.com/posts/powerful-lodash-functions-javascript) I went through the fundamentals of lodash, why you would want to use it and a list of my favorite basic lodash functions. Use it as your guide to replace the utility functions you have been writing all along using vanilla JavaScript.

This post, on the other hand, is more focused on some of the advanced lodash functions. Don't worry, they are explained in pretty simple language so that you can use them right off the bat.

Below is the list of my favorite lodash functions which allow me to do a more involved job, in a cleaner way.

### 1. Flatten your arrays
You might have come across situations where you realize your data has unnecessary levels of nesting than you need for the required use case. For example, consider this simple array:

{% highlight javascript %}
var myArray = [[1, 2],[3, 4, 5]];
{% endhighlight %}

The above "myArray" is and array for two nested arrays. What if I want to bring all the elements to one single level? 

"flatten" method in Lodash can help you with that.

{% highlight javascript %}
_.flatten(myArray); // [1, 2, 3, 4, 5]
{% endhighlight %}

And you don't have to worry if the array has multiple levels of nesting. Lodash can do deeper and get you the same result using its "flattenDeep" method.

Consider following example:

{% highlight javascript %}
myArray = [[1, 2],[3, [4, [5]]]];
_.flattenDeep(myArray); // [1, 2, 3, 4, 5]
{% endhighlight %}


Don't forget to see the above code in action in [JSBin](https://jsbin.com/hakivoloko/edit?html,js,console)

These were very trivial examples. And you would almost never come across a situation where you would have to flatten just an array of numbers in real world examples.

But, to understand the true power of "flatten" method, you will have to combine it with a bunch of other methods and wrap it around a "chain" method provided by lodash. Let's see how it's done in the following section.

### 2. Chaining multiple methods
Chaining can be used to execute multiple methods in a sequence. This can come handy in a ton of situations, particularly because data coming from the database does not always look like what we want to show on the UI. So, more often than not, you have to manipulate such data to make it work. And the methods used for manipulating the data can be chained together to make it more maintainable and readable.

Let's look at an example. Note that you can [play with the working demo here](https://jsbin.com/valefo/edit?html,js,console).

Consider this sample data of kids name and their favorite colors.

{% highlight javascript %}
var kidsData = [
    {
        name: "Max",
        colors: [ "Red", "Blue", "Gree" ]
    },
    {
        name: "Dan",
        colors: [ "Yellow", "Orange", "Red" ]
    },
    {
        name: "Maddy",
        colors: [ "Orange", "Blue" ]
    }
];
{% endhighlight %}

Now, consider someone told you to retrieve all the unique colors from this data. This is a classic situation to use that "chain" method I was talking about earlier.

Below is the complete solution to get the appropriate result. Don't worry, I am also going to break it down to make it easier for you to understand.

{% highlight javascript %}
var colors = _.chain( kidsData )
               .map( "colors" )
               .flatten()
               .uniq()
               .value();
			   
			  
console.log(colors); // ["Red", "Blue", "Gree", "Yellow", "Orange"]
{% endhighlight %}

Let's see what is going on here.

First, the data is wrapped with the "chain" method so that you can execute a sequence of other lodash methods on it.

{% highlight javascript %}
_.chain( kidsData )
{% endhighlight %}

Next, we tell lodash to only retrieve "colors" object from each array item. 

{% highlight javascript %}
.map( "colors" ) // [["Red", "Blue", "Gree"], ["Yellow", "Orange", "Red"], ["Orange", "Blue"]]
{% endhighlight %}

So, the result is a nested array of colors. If you have read the previous section, you are now raising your hands to suggest me the next move!

YES! you are right. We now flatten the array of colors to get a single level array.

{% highlight javascript %}
.flatten() // ["Red", "Blue", "Gree", "Yellow", "Orange", "Red", "Orange", "Blue"]
{% endhighlight %}

Now, the last step is easy. Just retrieve the unique strings from the above array. "unique" is another lodash method which does just that.

{% highlight javascript %}
.uniq() // ["Red", "Blue", "Gree", "Yellow", "Orange"]
{% endhighlight %}

And finally "value" method is used to unwrap the data to get the actual result of the sequence of methods executed. This step is very important.


### 3. Curry
In simple terms, curry in JavaScript lets you call a function with reduced number of arguments. If you pass all the arguments to the curried function, you will get the final results. Instead, if you pass it partial arguments, it will instead return a function which expects the remaining arguments required for the final result.

Currying is a classic use case of functional programming languages like Haskell, Scala and of course JavaScript.

Using lodash you can use curry like below:

{% highlight javascript %}
var addFunction = function (a, b, c){
	return a + b + c;
};

myCurriedFunction = _.curry(addFunction);
{% endhighlight %}

Now, I have my curry function. So what is the big deal about this function, you might ask.

Firstly, they make your functions reusable. Not so fancy reason, is it? Keep reading.

Curry function especially come handy when you have partial information at your disposal. It gives you the ability to partially configure with the information you have and build it as you get more information.

So, assume for executing the above "addFunction" you currently have just the first argument. You are waiting for the other 2 arguments to be calculated. Furthermore, those 2 remaining arguments are variable. Meaning their values change depending on some other XYZ operation.

In such case, what you can do is you can store the result of partial information you have at your disposal at this time. And as and when you get more information, you can insert it and get the final result eventually.

Let's see how this can be done:


{% highlight javascript %}
var myCurriedFunctionArg1 = myCurriedFunction(1000);
{% endhighlight %}

Now, when you get the values of remaining 2 arguments you can simply use the "myCurriedFunctionArg1" function with the newly available information.

{% highlight javascript %}
var result = myCurriedFunctionArg1(500, 100);
// final result 1600
{% endhighlight %}

You can check out the [working demo for curry function here](https://jsbin.com/bevoqi/edit?html,js,console).

Now, you can call "myCurriedFunctionArg1" with any arguments you want. It will execute the original "addFunction" function against "1000" as the first argument.

This is something awesome, isn't it? Just imagine the usefulness of this trick in a complex use case. It's huge!


### Summary:
I hope this long post was worth reading. I tried to make the explanations of some advanced concepts and methods as simple as possible. Shoot me a line if you think this helped you. Also, let me know if you are not sure what I just said in this post.




#### Further Resources We Recommend

### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)
### [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)