---
layout: post
title: "What is Directive's life-cycle in AngularJS"
description: "Let's understand Compile, Pre-link, Post-link and Controller functions in AngularJS directives. Directive lifehooks. This article explains importance of each function and when to use which function in AngularJS directives."
tags: [angularjs, the-what-series]
og_image: "posts/directive.jpg"
---

{% include image.html path="posts/directive.jpg" path-detail="posts/directive.jpg" alt="Angular Directives" %}

I'll be honest here. There are [so many good articles](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=directives%20life%20cycle%20in%20angularjs) already written on the same topic.

So, why do we need yet another post?

Well, the only problem with many of those articles is that they are too long and descriptive for the problem we are trying to solve. We don't need to know most of the redundant information in order to use and understand directives correctly. So, this post will just contain the important points you need to know about a directive's lifecycle. Let's dive in.

In short, each declared directive executes following four functions(if they are declared):
1. compile
2. controller
3. pre-link
4. post-link

The above four functions form the lifecycle of a directive. It is important to know about the life-cycle of a directive as it provides a way to have more control over it and customize it the way we want it to behave.

Below is a small code snippet which declares the above four functions in a directive:

{% highlight javascript %}
.directive("myDirective",function () {

    return {
      compile: function(element, attr){

          // your compile logic
 
         return {
             pre: function(scope, element, attr){

              // your pre-link logic
 
             },
             post: function(scope, element, attr){

              // your post-link logic
 
             }
         };
     },
	  controller: function() {
        // your controller logic
      }
    }
});
{% endhighlight %}


### Compile:
Simply put, this is the phase when AngularJS compiles your directive, recognizes the template of the directive and returns a link function. The compile function is executed before the directive is linked to the DOM. Thus, it can be used to manipulate the directive.

You can do things like changing the structure of the DOM, adding CSS classes to the elements, and other similar actions.

Some Angular-ninjas might very argue- these actions can also be done in the link phase. So why should use compile function?

Well, consider you are using "ng-repeat" on your directive, life below:

{% highlight html %}
<div ng-repeat="items in [1,2,3,4]" my-directive>
{% endhighlight %}

In the above code snippet, compile function gets executed only once- unlike the link function, which is executed 4 times. So, the compile phase is where it makes more sense to manipulate the DOM tree in such cases because it helps to optimize the performance.

Moreover, we all know that manipulating the DOM directly is not a good practice in the first place. But, if you at all have to do it, you might as well do it when the element is not even hooked up to the DOM tree to avoid unwanted surprises.


### Post-link
After the directive is compiled and the template of the directive is recognized by AngularJS, it attaches the "scope" variable to the directive. You can then use this "scope" variable to communicate between your template and the model.

Post-link is also the default link function which you will use in most of the cases. Below is the example which shows how to use the link function:

{% highlight javascript %}
.directive("myDirective",function () {

    return {
      link: function(scope, element, attr){

      }
    }
});
{% endhighlight %}

You can use the post-link function to manipulate the DOM, just like you do in compile function.

Additionally, you can also attach event handlers, inspect child elements and watch scope variables using $watch service. You should never do any of these actions in the compile function.


### Pre-link
It is almost the same as the post-link function. You have the same parameters available as you have in the post-link function.

To be honest, the "pre"-link function is not very popularly used. You will mostly use the default link function- which is the post-link function.

But for the curious minds- you can use the pre-link function to make sure your the data is available to use for the children directives. 

Check out the example below:

{% highlight html %}
<parent>
	<child>
		Nested Directives
	</child>
</parent>
{% endhighlight %}

In the above example, when the "child" directive wants to use some data from "parent" directive- you can use the pre-link function of the "parent" directive to share it with the "child". And in the "child" directive's post-link function you can safely access that data.


### Controller
Each directive has a controller function which is called whenever the directive gets instantiated.

There is no specific sequence in which controller is created- but, you can safely assume that the controller is available before the post-link function of the directive is called. This is particularly useful in case of nested directives which we saw as an example in the pre-link function section, above.

Controller is the place where you initialize your scope and scope variables. You can also declare methods, which can be used to communicate with other controllers.

Although I have seen many developers doing this, you should avoid referencing DOM elements directly in the controller. Controller function is not the place to manipulate DOM, attach event handlers or watch scope variables. This is what link function is used for. Controllers should only be used to talk to other controllers, and to write presentation logic for the view.


### Summary
In this post, we learned the basics of the life-cycle of a directive. We saw which functions are executed by AngularJS when it attaches directives to the DOM and what each of those function is used for.

Please stay tuned for the future posts, where I will demonstrate the usage of each function with some advanced code examples.


