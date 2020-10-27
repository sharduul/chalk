---
layout: post
title: "Prototypal vs Classical inheritance -  which one better?"
description: "Comparison between prototypal inheritance and classical inheritance on multiple parameters. Is classical inheritance obsolete. How does JavaScript inherit objects. Battle between Java and JavaScript."
tags: [javascript, interview]
og_image: "posts/js-vs-java.jpg"
---

{% include image.html path="posts/js-vs-java.jpg" path-detail="posts/js-vs-java.jpg" alt="AngularJS Focus Input" %}


These questions have always bothered me. What is the difference between prototypal and classical inheritance? Is prototypal inheritance better than classical? If yes, then why?

Being a JavaScript enthusiast, my answer has always been biased towards prototypal inheritance. Then I did more research on it. And it turns out I was right.

Let's understand those differences and reasons which makes prototypal inheritance better than classical.

First things first.

What is Prototypal and Classical inheritance?

To learn more about Prototypal inheritance please read my previous post on [here](http://ngninja.com/posts/prototypal-inheritance-in-javascript).

Simply put, prototype-based languages like JavaScript, Lua support prototypal inheritance. While class-based languages like C++, Java, C# support "classical" or class-based inheritance.

An example for each of them will make it more clear.

A simple example of prototypal inheritance in JavaScript:


{% highlight javascript %}
var Person = function(name){
    this.name = name;
}

Person.prototype.getName = function (){
    return this.name;
}

var user1 = new Person('John');
user1.getName(); // John
{% endhighlight %}


A simple example of classical inheritance in Java:


{% highlight javascript %}
class Person {
    String name;

    Person(String _name){
        name = _name;
    }

    String getName(){
        return this.name;
    }

}

class User extends Person {

    User(String _name){
        super(_name);
    }
    
}

// In main function
User user1 = new User("John");
user1.getName(); // John
{% endhighlight %}



Well, just to give you some perspective. You can see the above two code snippets does the exact same thing but the amount of code you have to write in JavaScript was so less compared to Java. Saving developers' time and efforts, thus increasing the efficiency.

Moving ahead. Let's dive into the real differences and reasons that make prototypal inheritance so much cooler than its counterpart.


### Compile time vs Runtime inheritance:
In class-based languages classes are created at compile time. So, it's during compile time that the members of class are accumulated and we know that `user1.getName()` will call `getName` method on its parent class.

On the other hand, in JavaScript, objects are linked together through its prototype link. So, when we call `user1.getName()`, JavaScript engine first checks if the method is present in `user1` object. If not, it follows its prototype link which points to its parent and checks there if the `getName` method is present and return its value.

This also brings to my another point. In JavaScript, you can add, remove and modify properties dynamically. If you add some method to an object's prototype at runtime it is made available to all the objects that inherit from it. Isn't that cool?!!

On the other hand, in classical inheritance, once a class is created you cannot modify it during runtime.


### Simplicity:
In the above-mentioned code snippets, I showed how easily you can demonstrate inheritance in JavaScript. You just need an object. You clone that object. A prototype link is created for you which gives access to the parent's members. You can use them as is, or you can modify them as per your need. That's it.

Talking about classical inheritance. Although the above-mentioned example was pretty simple, there are much more complications involved when you start dealing with large-scale applications. While dealing with complex code, terms like Interfaces, Abstract classes, Virtual Classes start coming into the picture. And from my experience, it just adds to the complexity - of writing the code and understanding it as well.


### Multiple inheritance:
We all know that neither Java nor JavaScript supports multiple inheritance. And it's for the obvious good reasons. But, there's a way to "mimic multiple inheritance" in prototype-based languages like JavaScript. Which, unfortunately, cannot be done in class-based languages which does not support multiple inheritance.

Let's see a simple example of how to mimic multiple inheritance in ES6:


{% highlight javascript %}
class Person {
  walk() {
    // your code...
  }

  sleep(){
      // your code...
  }
}

class Employee {
  sleep(){
      // your code...
  }
}

class User {
    // your code...
}

Object.assign(User.prototype, {
  walk: Person.prototype.walk,
  sleep: Employee.prototype.sleep,
});
{% endhighlight %}


Above code is mostly self-explanatory. We are creating separate classes `Person` and `Employee`. Then we create an empty class `User` and we decide that `User` should have two methods- `walk` and `sleep`. We could have easily done it by inheriting the `User` class from the `Person` class. But, we don't want to inherit the `sleep` method of `Person` class.

Therefore, we just extend our independent `User` class by handpicking methods from the classes we want. For example, we took `walk` method from `Person` class and `sleep` method from `Employee` class (because employees know how to sleep better, eh!).

And that's how we mimicked multiple inheritance.

### Caveats:
Although, I did not come across any solid drawbacks of prototypal inheritance over classical ones in terms of performance or memory consumption- I know from my experience, that coming from the classical background it is a bit confusing to get started with prototypal inheritance for beginners.

I have also seen people mimicking classical inheritance in a prototypal style. Which defeats the whole purpose of using prototype-based languages.


### Summary:
I would just like to conclude by saying that prototypal inheritance is much powerful than you think. Try and make use of its dynamic nature to your benefit.

Also, do drop a note if you find any conceptual mistake or if you think the post can be improved in any way. Because, at the end of the day, I am a learner myself.



