---
layout: post
title: "5 Very powerful Lodash functions you should know"
description: "Lets see in action how you can streamline your JavaScript code using some of the best Lodash functions."
tags: [javascript, lodash, listicles]
og_image: "posts/tools.jpg"
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="Lodash" %}


JavaScript, being an awesome programming language, can also sometimes be frustrating. 

For example, if you search a  solution on how to clone a JavaScript object using vanilla JavaScript, you might end up with couple of conditional statements and a loop through each property. And if the object is nested- then God help you!

But, the good news is you don't have to use vanilla JavaScript in such cases. There are various utility libraries available which makes writing such utility functions, a piece of cake. Lodash is one such toolkit available which helps us write clean and well performing JavaScript functions for manipulating JavaScript objects and collections.

This post is targeting 5 very powerful Lodash functions that I use very often and you should start using it too. It will make your code base a lot cleaner and save you a ton of time.


### 1. Generate a random number:
Often when working on projects, we come across use cases where we need to generate a random number. 

Example: shuffle in a music app or shuffle in a poker game.

Lodash has a very simple utility function to generate random numbers.


{% highlight javascript %}
_.random(0, 5);
{% endhighlight %}

The above single line of code will generate a random number between 0 and 5.

{% highlight javascript %}
_.random(1.2, 5.2);
{% endhighlight %}

If you need a floating point number, lodash has a provision for that as well. The above line of code will generate a floating point number between 1.2 and 5.2.


### 2. Filter a collection:
I have lost the count of number of times I have used this utility function by lodash. Many times we need to filter a collection based on some specific properties of the object. 

For example: filter library members who are active. Using lodash, this can be simply written like:

{% highlight javascript %}
_.filter(members, { active: true });
{% endhighlight %}

You can also provide a function as the second parameter instead of an object. This comes very handy when you have multiple clauses or a complex filter logic. 

For example: filter library members who are active and older than 50 years. Below is the code to do that using lodash.

{% highlight javascript %}
_.filter(memberList, function(member) { 
	return member.active && member.age > 50; 
});
{% endhighlight %}


### 3. Deep clone JavaScript object
If you have ever searched for solutions to clone a JavaScript object using vanilla JavaScript you might know how messy and unintuitive they are. But, lodash makes it super easy, pretty looking and of course optimally performant. 

The documentation on [Lodash web page](https://lodash.com/docs/4.16.4#clone) says that this function is loosely based on an algorithm called as [The structured clone algorithm](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

Allow me to demonstrate the utility function with an example:

{% highlight javascript %}
var objectArray=
[{
    'a':1
},
{
    'b':{
        'c': 3 
    }
}];


var clonedObjectArray = _.clone(objectArray);

console.log(clonedObjectArray === objectArray); // true
{% endhighlight %}


The above snippet clones original "objectArray" object to "clonedObjectArray". 

Please notice that both the objects now reference to the same object. Meaning, if you change properties of any of one of them, it will be reflected on the other object as well.

If you don't want to clone object with its reference, lodash provides another utility which clones the object by values instead of the reference.

Continuing the above example:

{% highlight javascript %}
var deepClonedObjectArray = _.cloneDeep(objectArray);

console.log(clonedObjectArray === objectArray); // false

objectArray[0].a = 2;

console.log(objectArray[0].a);          // 2
console.log(clonedObjectArray[0].a);    // 1
{% endhighlight %}

In the above code snippet you can see that "cloneDeep" function copies values of all the properties of original object to the new object. And if you change the value of any property of one of the object, it will not affect that property in the other deep cloned object. This can be handy in use cases where you want to manipulate the object but also have its original copy for reference.


### 4. Select properties of object
Sometimes we would like to compose a new object by selecting only some specific properties of the original object. Instead of iterating through each property and picking matched property, lodash provides a simple utility method just for this purpose.


{% highlight javascript %}
var member = { name: 'foo', age: 50, address: 'skyline road' };
 
var pickedMember = _.pick(member, ['name', 'age']);
console.log(pickedMember); // { name: 'foo', age: 50 }
{% endhighlight %}

You just have to specify the properties of an object you are interested in, and the "pick" function takes care of the rest for you.


### 5. Remove properties from object
This is just the opposite of the "pick" function. Instead of picking specific properties, "omit" function deletes the specified properties from the object.

This one can be useful when you want to streamline the response object returned from your API before it reaches the controller.

{% highlight javascript %}
var member = { name: 'foo', age: 50, address: 'skyline road' };
 
var omittedMember = _.omit(member, [address']);
console.log(omittedMember); // { name: 'foo', age: 50 }
{% endhighlight %}

The above code snippet removes the address property of the member object.


### Conclusion:
In the above examples of my favorite utility functions, I have only covered the basic usage of those methods. Lodash provides a lot of customization to almost all their functions which you can make use of to suit your own needs.

I am totally in love with Lodash- not only because it saves me a lot of time or makes my code look prettier. But because it forces me to think of the problem in a more functional and an abstract manner. By doing this, I can break a bigger problem into multiple smaller ones and tackle each one of them individually.

