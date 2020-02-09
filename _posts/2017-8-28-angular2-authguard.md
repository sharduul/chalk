---
layout: post
title: "Angular 2 Authentication: How to Restrict Access to Pages?"
description: "What is Angular AuthGuard and how to use it. Learn how to restrict anonymous users from accessing restricted pages in your application using Angular 2 Authentication."
tags: [angularjs, angular2, the-how-series]
og_image: "posts/secure.jpg"
---

{% include image.html path="posts/secure.jpg" path-detail="posts/secure.jpg" alt="Angular2 Form Validation" %}


Every real world web application has two parts. One- which requires authentication and authorization to access. And two- which is accessible to the public without any authorization.

Restricting access to private data has always been a problem. There are workarounds and solutions, yes. But never could I find a fool proof one.

Until Angular 2 happened. Restricting access to the private data is made super simple in Angular 2. So let's dive in and see a simple example on how to do so. Follow the [demo here](https://embed.plnkr.co/H8ogMZsZTjL0dGw8qdud/) for better understanding.

### Route Guard
The trick to restricting the access to your private routes is to use `canActivate` property exposed by the router in Angular 2. `canActivate` takes in a guard function where you can implement a logic which will decide whether or not to activate the route.

Let's see how we can declare `canActivate` on routes:


{% highlight javascript %}
export const appRouting : Routes = [

    {
        path: 'user',
        canActivate: [AuthGuard],
        component: UserComponent
    
    },
    {
        path: 'anonymous',
        component: AnonymousComponent
    }

];
{% endhighlight %}


Notice `canActivate` property on `user` route. It takes a class called `AuthGuard` where I have implemented the logic to whether or not to activate the route.

Now let's see how `AuthGuard` class is implemented.

Our `AuthGuard` class is actually an `Injectable` service. We want the class to implement `CanActivate` interface. So, let's import the necessary things first.


{% highlight javascript %}
import { Injectable } from '@angular/core';
import { Router, CanActivate } from '@angular/router';
import { AuthService } from './auth.service';
{% endhighlight %}


Now that we have imported the necessary service we can now implement our logic.


{% highlight javascript %}
@Injectable()
export class AuthGuard implements CanActivate {

    base_url: string;

    constructor(private router: Router
        , private authService: AuthService) {}

    canActivate() {
        // Check to see if a user has a valid token
        if (this.authService.isAuthenticated()) {
            // If they do, return true and allow the user to load app
            return true;
        }

        // If not, they redirect them to the login page
        this.router.navigate(['/anonymous']);
        return false;
    }


}
{% endhighlight %}


To implement `CanActivate` interface the class has to implement `canActivate` function which returns a boolean. Now, let's dive into the details of the logic of it.

First, it checks if the user is authenticated. The logic for which is implemented in the `authService`. We will look into that later.

If the user is already authenticated, we return true which means the restricted route can be accessed by the user. But, if the user is not authenticated we redirect the user to a public route- `/anonymous` in this case and return false. Returning false prevents the user from accessing the restricted route.


Now, let's see what the `AuthService` class contain. I won't go into the details here because the only function we are interested right now is the `isAuthenticated` function. Which looks like this:


{% highlight javascript %}
isAuthenticated() {
    // get the auth token from localStorage
    let token = localStorage.getItem('access_token');

    // check if token is set, then...
    if (token) {
        return true;
    }

    return false;
}
{% endhighlight %}


The `access_token` is the authentication token which is returned when user login into the app. In this demo app, we store `access_token` to the local storage of the browser. When user logouts from the app we remove the token from the local storage.

The `isAuthenticated` function just checks whether we have authentication token in the local storage. If we have it, the user is already authenticated and it is safe to allow him the access to the restricted route. So we return `true`. Else we return `false`.

That is it. We have covered the heart of the process to guard our private routes.

### Summary:
If you see the [complete demo](https://embed.plnkr.co/H8ogMZsZTjL0dGw8qdud/), I have implemented two components namely, anonymous and user component which represents public and private routes respectively.

Have fun with the demo and let me know what do you think of this solution for protecting the private routes of your application. Isn't it fool proof?


#### Further Resources We Recommend

### [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/36F6N8v)
### [You Don't Know JS: Scope & Closures](https://amzn.to/2UaT46V)