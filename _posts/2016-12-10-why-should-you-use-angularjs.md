---
layout: post
title: "Why should you use AngularJS?"
description: "AngularJS framework analysed and explained why do you want to use it for your next project."
tags: [angularjs, the-what-series]
---

{% include image.html path="posts/angularjs.jpg" path-detail="posts/angularjs.jpg" alt="AngularJS Framework" %}


### The What?
AngularJS is a Javascript based framework maintained by Google folks and a community of programming-ninjas. The framework can be used for developing dynamic, rich and well-organized web applications. Being a client side framework it lives in the browser. So, it is mainly responsible for handling the user activities and application logic, therefore, separating the data and data access layer from the client.


### The Why?
Angular is like our father, who makes our lives easy by taking most of the grunt responsibilities (data binding, dependency injection, etc.) on his shoulders and let us focus on what we actually want to achieve in our lives (domain of the application, produce value to our users).

In technical terms, Angular eliminates a lot of boilerplate code which we would have to write if we had to develop an application using vanilla Javascript.

Angular does this by eliminating explicit DOM manipulation using its ability to two-way bind the data model and view, and extend HTML using directives and filters.

In simple terms, directives let us extend the HTML and  reuse the code. So, now you can have rich HTML elements like: 
{% highlight html %}
    <address></address>
    <login-form></login-form>
{% endhighlight %}
 
or you can even create custom wrappers around your controls like:
{% highlight html %}
    <my-grid></my-grid>
    <my-slider></my-slider>
{% endhighlight %}
 
And you can reuse them anywhere in your app.

Filters, as the name suggest, are used to filter and manipulate the data. They allow us to format the data like adding precision to the decimals, adding currency symbols or filtering collections based on custom parameters, and so on.

And, Two-way data binding is just a fancy term used for- the way the UI view and data-objects are kept in sync. 



### The How?
Below is a simple example of Angular vs vanilla Javascript, just to put the things into perspective.

Vanilla Javascript code:

{% highlight javascript %}

<h1 id="msg">Hello</h1>
<button id="btn">Click Me</button>

// grab the elements by id
var btn = document.getElementById('btn'),
    msg = document.getElementById('msg');

// update the message
function setMessage() {
    
    msg.innerHTML += ' World';
    
    // remove the event listener
    if (btn.removeEventListener) {
        btn.removeEventListener('click', setMessage, false);
    } else if (btn.detachEvent) {
        btn.detachEvent('click', setMessage);
    }
}

// check for supported event subscription method
if (btn.addEventListener) {
    btn.addEventListener('click', setMessage, false);
} else if (btn.attachEvent) {
    btn.attachEvent('click', setMessage);
}

{% endhighlight %}

The above code grabs the button with id="btn". It attaches an event listener to listen to its click events and call function "setMessage" whenever a user clicks on that button. In the function "setMessage", word "world" is appended to "hello" in "H1" tag which is saved in "msg" variable. And finally, in the end of the function, the event listeners are removed.

Below, you will see a code written in AngularJS which achieves the same goal by keeping the code pretty and crisp.


AngularJS code:

{% highlight javascript %}
{% raw %}
<div ng-controller="MyController">
	<h1 id="msg">Hello {{ message }}</h1>
	<button id="btn" ng-click="setMessage()">Click Me</button>
</div>

myModule.controller('MyController', function($scope, dep1, dep2) {

  $scope.setMessage = function(arg1) {
    $scope.message = "World";
  };
{% endraw %}
});

{% endhighlight %}

You might not understand some of the AngularJS jargons. But that is okay for this article.

Just notice the number of lines of code reduced in Angular. It achieves the same functionality as in the above vanilla JavaScript code. But here, the developer need not have to worry about attaching event handlers, removing them, or grabbing DOM elements to manipulate them. Every such bit is handled by AngularJS. We just have to worry about the value we want to produce for our end users.

An additional benefit of using AngularJS that a true developer can appreciate is that- it is pleasantly easy to unit test your application using Angular. It's support for MVC pattern and Dependency Injections makes any Angular application readily unit testable.

### Summary:
This article was just about introducing AngularJS. The above-mentioned points on the awesomeness of AngularJS should give you enough reasons to start your next project using AngularJS framework.