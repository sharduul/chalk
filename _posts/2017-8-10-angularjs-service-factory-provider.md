---
layout: post
title: "AngularJS: Service vs Factory vs Providers made super simple"
description: "Understand the difference between Service vs Factory vs Providers in AngularJS in a super simple terms. And more importantly learn when to use which design pattern in AngularJS."
tags: [angularjs, design-patterns, the-what-series]
og_image: "posts/directive.jpg"
---

{% include image.html path="posts/directive.jpg" path-detail="posts/directive.jpg" alt="Service vs Factory vs Providers" %}


Let's dive into the differences between Service vs Factory vs Providers in AngularJS. But just knowing that is not fun, isn't it? So, let's also learn when is the best time to use which of those design patterns.

Simply put, they all are available for creating services for your AngularJS application. Services in AngularJS allow you to share certain code throughout your application. You just have to inject the service wherever you need, and voila! You have the access to that common area of your code base.

### Factory:
You can create a simple AngularJS Factory like this:

{% highlight javascript %}
app.factory('ninjaFactory', function () {
  var _ninjaName = '';
  var service = {}

  service.getNinja = function () {
    return _ninjaName;
  }

  return service;
});
{% endhighlight %}


#### Things to notice in the above code snippet:
1. To create Factory you have to use `factory` function available in your app module.
2. `ninjaFactory` becomes the name of your factory which you can inject wherever you want (controllers, directives, other services, etc.)
3. It returns service object. Basically, factory has to return an object which is the main difference which differentiates it with other design patterns. Through that object, you can expose any functionality you want to the other part of your application. `getNinja` method in this case.
4. Under the hood AngularJS does something like this:

{% highlight javascript %}
return ninjaFactory = fn()
{% endhighlight %}


### Service:
You can create a simple AngularJS Service like this:


{% highlight javascript %}
app.service('ninjaService', function() {
    var _ninjaName = '';

    this.getNinja = function() {
        return _ninjaName;
    }
});
{% endhighlight %}


#### Things to notice in the above code snippet:
1. To create a Service you have to use `service` method available in your app module.
2. `ninjaService` becomes the name of the service which you can again inject it wherever you want in your application.
3. You don't have to return any object when you create AngularJs services. Services are the `constructors` in the world of JavaScript. They are instantiated and made available to you using `new` keyword. You don't have to do it yourself- Service providers does it for you. You just have to add the functionality you want to expose to the `this` variable in your function. Like I did for `this.getNinja`.
4. Under the hood AngularJS does something like:


{% highlight javascript %}
return ninjaService = new fn();
{% endhighlight %}


*One secret about services: They are factories under the hood!*
(don't tell anyone that I told you this :))


### Provider:
You can create a simple AngularJS Provider like this:


{% highlight javascript %}
app.provider('ninjaProvider', function () {
  var _ninjaName;

  return {
    setNinjaName: function (name) {
      _ninjaName = name;
    },
    $get: function () {
      return {
          name: _ninjaName;
      }
    }
  }
});
{% endhighlight %}


#### Things to notice in the above code snippet:
1. Use `provide` method of you app module to create a provider.
2. `ninjaProvider` then becomes the name of your provider which you can inject anywhere in your app.
3. `$get` is the main crux of providers which exposes functionality available to the controllers. So, if you want to expose any more functionality through your provider add it under this method. Like this:


{% highlight javascript %}
$get: function () {
  return {
      name: _ninjaName;
      getNinjaAddress: function (){
          // return address...
      }
  }
}
{% endhighlight %}


4. Under the hood AngularJS returns us something like this:


{% highlight javascript %}
return ninjaProvider = (new fn()).$get();
{% endhighlight %}


#### Common things between Service, Factory, and Provider:
- They all do the same thing- provide common functionality throughout your application.
- They are all Singletons. Meaning they are instantiated by AngularJS just once.
- They all can be injected in other places of your application to provide some sort of functionality.


Now, that we have understood the basics of all 3 design patterns. Let's see when to use which design pattern?

#### When to use-

### Factory:
- It is recommended to use Factory in all the cases.
- It lets you execute any of your complex logic before returning the final object. So, use this whenever your service needs to be a little complex.
- Use it when you want to instantiate a new class instance of the service. Like this:


{% highlight javascript %}
app.controller('myController', function($scope, ninjaFactory){
        $scope.ninjaFactoryInstance = new ninjaFactory();
});
{% endhighlight %}


### Service:
- Use it when you just want access to the common data and functionality. In other cases, stick to a factory.
- Use it when you want to create a simple service. For anything complex, opt for Factories. Becuase you don't want to expose this complexity. This is called abstraction.


### Provider:
- Use it when you want to configure something and pass it to `.config` of your module. In the above example, this can be done as follows:


{% highlight javascript %}
app.config(function (ninjaProvider) {
  ninjaProvider.setNinjaName('ngninja');
});
{% endhighlight %}


- Use it to create configurable factories. You can customize such factories during bootstrap.


### Summary:
Long and short, Service or Factory or Provider- they all are the same. The only thing that changes is how they are created and the way they expose data to the other part of the application.

In most cases, you will just need a Factory. But to become a true AngularJS ninja, try and experiment with all of them. And do let me know what do you think of the above-mentioned use cases.


#### Further Resources We Recommend

- [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/36F6N8v)
### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)



