---
layout: post
title: "How to $watch controller variables in AngularJS?"
description: "Everyone knows how to keep $watch on $scope variables. But, many people don't know that they can use the same technique to watch their controller properties as well."
tags: [angularjs, the-how-series]
og_image: "posts/camera.jpg"
---

{% include image.html path="posts/camera.jpg" path-detail="posts/camera.jpg" alt="AngularJS Watch" %}


In AngularJS, $watch is a service to track changes on specified properties in the given scope. It is like an event listener, where the event, in this case, is the changes made to the value of the specified variable. 

And just like the event listener, you can register a handler with the $watch service which will be fired when the specified variable is changed.

Everyone who is familiar with $watch knows how to watch any changes made to the scope variables. This was enough until people started becoming more aware of the [style guides](https://github.com/johnpapa/angular-styleguide/blob/master/a1/README.md) which specifies the use of controller-as notation instead of declaring your variables directly on the $scope object.

So, let's see with a simple example how you can use the same $watch service to watch the variables you declare on your controller.

You can also follow the [full demo on CodePen](http://codepen.io/sharduul/pen/LboMVw) to get a better understanding.

Let's setup our app, starting with the index.html.

{% highlight javascript %}
<body ng-app="MyApp" ng-controller="myController as ctrl">
    <!-- HTML code here -->
<body>
{% endhighlight %}

Notice the controller-as notation, in the above snipped. In that notation, you specify the name of your controller and then a name using which will be used to reference your controller in the view.

So, consider a controller function like:


{% highlight javascript %}
function myController($scope){
  var vm = this;
  
  vm.myData = "abcd";
}
{% endhighlight %}

When our controller is instantiated, the value of "this" is the controller itself. We store that reference in a variable called "vm". Thus, "vm" now has the reference to "myController".

Now, if we want to expose any objects to our view, all we have to do is declare them as a property of "vm". For example- "myData".

And then, we can use "myData" in our view like this:

{% highlight javascript %}
<input id="input" ng-model="ctrl.myData" type="text" />
{% endhighlight %}

Notice, how we have bound "ctrl.myData" to the ng-model directive of our input. 

Doing this is possible because when you use the controller-as syntax- AngularJS creates the reference of your controller on the $scope object. Which means, if you log the $scope in your browser's console, you can see "ctrl" as a property on the $scope object.

Now, if we think of it, the problem we are trying to solve becomes a lot easier after reading the above statement.

You don't really have to do anything different. To watch the properties of your controller, just prefix your variable of interest with the name of your controller!

Below is an example which shows how to watch controller properties:

{% highlight javascript %}
$scope.$watch("ctrl.myData", function(newValue, oldValue){
    if(newValue != oldValue){
      vm.watchedData = newValue;
    }
});
{% endhighlight %}

Assuming we are interested in watching the changes made to "myData" variable which is declared as a property of our controller. We just create a watch on "ctrl.myData". 

This will notify us about changes made to "myData" variable and execute a function where we can write our logic to do anything desired with its value.


If there are multiple variables that you want to watch, you might be tempted to create a watch on every such variable. But there is an easier way to do that.

{% highlight javascript %}
$scope.$watch("ctrl", function(newValue, oldValue){
    if(newValue != oldValue){
      vm.watchedData = newValue.myData;
    }
}, true);
{% endhighlight %}

Notice, the "true" flag we pass to the $watch service. This flag tells Angular to deep watch the object we specify in the service. 

So, in this case, changes made to any of the controller properties will fire this watcher and the function will be executed. This is also the reason, you might want to avoid doing such thing. Because any little change made to the controller will fire this watcher whether you intend it or not. And that is not a very performance-friendly idea.


### Summary:
In this article, we learned about the "controller-as" syntax and a simple trick using which you can watch any changes made to the controller properties.

Oh, and a final note- whenever you create a watch, don't forget to destroy it at the end.





