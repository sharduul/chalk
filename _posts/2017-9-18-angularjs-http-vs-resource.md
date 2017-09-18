---
layout: post
title: "AngularJS: When to use $http vs $resource?"
description: "Super simple explanation on AngularJS $http and $resource services. A practical guide to similarities and differences between $http and $resource and when to use which."
tags: [angularjs, the-what-series]
og_image: "posts/angularjs.jpg"
---

{% include image.html path="posts/angularjs.jpg" path-detail="posts/angularjs.jpg" alt="$http vs $resource" %}


Yeah! I know what you are thinking. 

Yet another article on Angular `$http` vs `$resource`!?! If someone could just go ahead and kill me, that'd be great.

Well, just hang in there. This will be worth your time, trust me.

Not only the developers who are newly exposed to AngularJS but I have also seen many experienced ones's struggling with the differences between `$http` vs `$reource`. And that's also the reason why it is so popular interview question for AngularJS.

AngularJS docs define `$http` as follows:

*The $http service is a core AngularJS service that facilitates communication with the remote HTTP servers via the browser's XMLHttpRequest object or via JSONP.*

Angular JS docs define `$resource` as follows:

*A factory which creates a resource object that lets you interact with RESTful server-side data sources.*

### In simple terms

`$http` lets you make asynchronous calls to communicate with your web service. `$resource` lets you make asynchronous calls to communicate with your RESTFUL web service.
 
So, one could say, they both do exactly the same thing. The only difference is the use-cases they are used in (the "RESTFUL" part). 

### $http

Like me, many people coming from jQuery background can relate to this service pretty quickly. That's one of the reasons why it is recommended for beginners to start with `$http` when learning AngularJS.

For jQuery junkies- you can think `$http` as `jQuery.ajax`.

So, that means, whenever you want to make a general purpose AJAX call, use `$http` service by AngularJS. Let's say there is a `.json` file on the server and you want to get data from it. Using `$http` service you could do something like this:


{% highlight javascript %}
function getMyPeople() {
    return $http.get("people.json")
        .success(function(data) {
            service.people = data;
        });
}
{% endhighlight %}


But, the use case for `$http` doesn't just stop there. You can also use `$http` for communicating with RESTful services.


{% highlight javascript %}
function getMyPeople() {
    return $http.get('/people').
        then(function(response) {
            service.people = response;
        }, function(error) {
            service.error = error;
        });
}
{% endhighlight %}


### $resource

Recently, RESTful API's have become very popular. So, if you are dealing with such web service which is RESTful- go with `$resource`.

Simple GET call using `$resource` can be done like this-


{% highlight javascript %}
function getMyPeople($resource) {
    return $resource('/people')
}
{% endhighlight %}


AngularJS `$resource` service is specially designed for dealing with RESTful APIs which makes your code look beautiful when making CRUD operations and transforming the requests and response data.

So let's see the similarities and differences between `$http` and `$resource`.

### Similarities between `$http` and `$resource`

Both are used to make asynchronous calls to the web service.

Both allow the CRUD operations.

Both return promises.

Both can transform requests and responses.

Both allow you to update headers.


### Differences between `$http` and `$resource`

`$http` is used to make general purpose AJAX calls. `$resource` is used to communicate with RESTful API.

`$resource` is actually a subset of `$http`.

`$resource` needs ngResource module. `$http` is AngularJS core module.

`$resource` is specially designed for RESTful APIs and lets you write efficient, beautiful code when dealing with RESTful API. Hence, recommended in such scenarios over `$http`.

`$resource` can deal with objects and arrays. `$http` can be used to deal with primitive types as well.

`$resource` is recommended when writing complex queries and scalable functionalities.

`$resource` has a dependency on `$http`.


### Summary

To summarize, `$http` and `$resource` very similar functionality. But, it is recommended to use `$resource when you are dealing with RESTful APIs, because of the powerful programming interface provided by the `$resource` service. And then, you can use `$http` when you are dealing with non-RESTful APIs and services which respond with non-conventionals data types like strings.

If you are a beginner, I would recommend using `$http` just to get a better understanding of how asynchronous programming is done in AngularJS. And then, when you start working on complex applications consider switching to the `$resource` service.

I hope the article was worth your time. Please let me know if you have anything more to add to this.

