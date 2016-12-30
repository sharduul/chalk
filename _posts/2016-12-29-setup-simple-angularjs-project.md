---
layout: post
title: "Steps on how to setup a simple AngularJS app?"
description: "Setup AngularJS and get running following these simple steps. Develop your first "Hello World" app in AngularJS."
tags: [angularjs, the-how-series]
---

{% include image.html path="posts/angularjs.jpg" path-detail="posts/angularjs.jpg" alt="AngularJS Framework" %}


AngularJS is a JavaScript-based client-side MVC framework used to develop dynamic, rich and well-organized applications.

If you want to learn more about the basics of AngularJS and why you would want to use it, please read my previous post- [Why should you use AngularJS?](http://ngninja.com/posts/why-should-you-use-angularjs).

Setting up an AngularJS app is a very simple process. And, there are tons of Angular-seed projects which provide you a skeleton which you can enhance as per your business needs. Below is a list of some of them:

1. [Official Angular Seed project](https://github.com/angular/angular-seed)
2. [Angular Enterprise Seed](https://github.com/robertjchristian/angular-enterprise-seed)
3. [Yeoman](http://yeoman.io/)

That said, it is always useful to learn how to setup an AngularJS app from scratch if you want to become a true Angular-ninja!

So, let's see how we can get you started with building a simple "Hello World" project using AngularJS. You can also, refer to this [complete demo on CodePen](http://codepen.io/sharduul/pen/xRNaLK).


1. In your "index.html" page include AngularJS library like this:

{% highlight html %}
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
</head>
{% endhighlight %}

You can also install AngularJS locally. But for the sake of simplicity, I am using the hosted library.

2. Now, that you have included Angular in your project, you can go ahead and create the app-module. AngularJS follows module design pattern at its core. 

If you want to know more on module design pattern, please read my previous post on [JavaScript Design Patterns](http://ngninja.com/posts/javascript-design-patterns-you-should-know).

But, in short, to create an Angular app you have to declare a root module. It will also be the name of your application. Below is the snippet which shows how you can declare a module in Angular:

{% highlight javascript %}
angular.module('MyApp', [])
{% endhighlight %}

It takes in the name of the module, and an array of dependencies. AngularJS also uses another popular design pattern- [Dependency Injection](http://stackoverflow.com/questions/130794/what-is-dependency-injection), a lot.

3. Now that you have declared your app module, it is time to include it in your HTML so that you can do some fun stuff with it. You can use "ng-app" directive to tell Angular that this element will be the root of the application.

Let's do that:

{% highlight html %}
<body ng-app="MyApp">
	<!-- HTML code will go here-->
</body>
{% endhighlight %}

"ng-app" will tell Angular which element will be the root of the application. In this case, "<body>" will be the root of our Angular app. So, Angular-magic can now be applied to all its children.


4. Just including the Angular app in your HTML does nothing. If you want to make use of its awesomeness you have to implement a controller.

A controller in AngularJS is where all your presentation logic goes. The controller gives you an access to the "$scope" object which you can use to bind your HTML to the data.

Let's declare a controller:

{% highlight javascript %}
angular.module('MyApp', [])
  .controller('myController', ['$scope', myController]);

function myController($scope){

	// controller logic  

}
{% endhighlight %}

Include the controller in our view:

{% highlight html %}
<body ng-app="MyApp" ng-controller="myController">
	<!-- HTML code will go here-->
</body>
{% endhighlight %}

In this step, we have declared a controller named "myController" and using "ng-controller" included it in our view. 

"ng-controller" is another Angular's built-in directive which specifies the area which will be "controlled" by that controller. So, in this case, we can use "myController" to control entire "<body>" element and its children. We will see how.


5. Now, that the basic setup is complete, let's move on to creating some Angular magic and get that "hello world" printed on the screen.

All the magic of Angular lies in its "$scope" object. To explain behind the scenes of this magic is outside the "scope" (pun intended!) of this article. 

But, for now, lets declare a scope property which we will bind to our view.

{% highlight javascript %}
function myController($scope){
  $scope.displayMessage = "Hello World!";
}
{% endhighlight %}

Now, let's bind this "displayMessage" property to our view:

{% highlight html %}
<h1>{{ displayMessage }}</label>
{% endhighlight %}

Angular uses interpolation to bind objects to view. The curly braces "{{" and "}}" tells Angular that some JavaScript expression has to be evaluated.

In this case, it evaluates "displayMessage" property declared on the $scope variable.

That's it. Now go ahead and run your application in your favorite browser and pat yourself on your back for implementing an awesome Angular app.


### Summary:
This article explains you the simple steps you can follow to setup an AngularJS application. Although the above example has no real world value, it explains you the basic foundation on which Angular is built on.









