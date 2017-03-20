---
layout: post
title: "Quickstart: Steps to setup a simple Angular 2 app"
description: "A Quickstart guide to setup your first Angular 2 app easily. Setup your development environment using AngularCLI."
tags: [angularjs, angular2, the-how-series]
og_image: "posts/angular2.jpg"
---

{% include image.html path="posts/angular2.jpg" path-detail="posts/angular2.jpg" alt="Angular2 Framework" %}

It has been quite a while since the first Angular 2 release, which was in May 2016. There has been a lot of improvements and bug fixes to the framework itself. Moreover, the documentation and the perusal material have gotten more solid since then.

All in all, this is a perfect time to get started on your long overdue Angular 2 project!

This article is all about a simple step by step guide for setting up your Angular 2 application. I have purposely skipped over the explanation of some of the terms to honor the scope of the article. But, stay tuned for future posts on detailed explanation of all the Angular 2 jargons.

Let's get started.

### tl;dr steps:
1. Install Angular CLI
2. Create a HelloWorld app
3. Run your application
4. Create a new component


Please refer the [official Angular CLI site](https://cli.angular.io/) for a detailed documentation on each command it offers.


### 1. Install Angular CLI:
Angular 2 has introduced a command line interface which streamlines much of the setup of your application. It comes with a bunch of commands which makes the job of a developer easy enough to just focus on the business needs of the application.

I will explain some of the important and commonly used commands through this application. But to get started, run the following command to install Angular CLI on your system:

{% highlight javascript %}
npm install -g angular-cli
{% endhighlight %}

Verify if the installation was successful:

{% highlight javascript %}
ng version
{% endhighlight %}

### 2. Create your application:
Next step is to get your application up. Create all the necessary files and install dependencies needed. 

To do this, run the following command:

{% highlight javascript %}
ng new helloworld-app
{% endhighlight %}

Please note that it might take a while to completely execute this command. This is because the CLI installs a lot of packages to get you started.

This command will generate your app which adheres to the [Angular 2 official style guide](https://angular.io/styleguide). It makes it easy for the developer to follow the style guide and code a maintainable and a scalable application.


### 3. Run the application
Essentially, you are done setting up your app at this point. The only thing to do is creating a local server to serve your application. Angular CLI has taken care of this for you.

To run your "helloworld-app", just execute the following command:

{% highlight javascript %}
ng serve
{% endhighlight %}

It will create a server which points to "http://localhost:4200/". It has "BrowserSync" inbuilt- meaning it will reload all the changes you make to the app.

Congratulations!!! You just created your first Angular 2 application.


### 4. Create your custom component
Although, your app is in a perfectly running state it provides us a very little value right now. To make it more useful let's customize it a bit according to our business needs.

Everything in Angular 2 is a component. It is just a glorified way to say Angular 2 takes more of an Object Oriented way of implementing stuff. So, to create a view your basically, have to create a component for it.

And guess what! Angular CLI makes this process makes this process simpler for you too.

From the root of your application folder run the following command:

{% highlight javascript %}
ng generate component hello-world
{% endhighlight %}

This will create a "hello-world" component- including the folder, typescript file, template, style, a test file, and also include this component as a dependency in your app module.

Simply put, all the ground work is laid for you. Now just include this new component wherever you want.

To do this, go to the "src/app/hello-world/hello.component.html" file and edit it as below.

{% highlight html %}
<p>
  hello world!!!
</p>
{% endhighlight %}

Now, go "src/app/app.component.html" and edit the file as below.

{% highlight html %}
<app-hello></app-hello>
{% endhighlight %}

This will include your custom "hello-world" component in your main component. Now execute:

{% highlight javascript %}
ng serve
{% endhighlight %}

And visit "http://localhost:4200/" again. Voila!!! you just created your first custom component.

Please note. If you want to delete your component you will have to do it manually. Angular CLI does not provide any command to destroy anything. I know that's a little pain. But it is worth it, trust me.



### Summary:
You just created your first Angular application using Angular CLI. Please go through the [official Angular CLI documentation](https://cli.angular.io/) and play around with its commands. You will definitely start appreciating the functionality it provides.

I am myself in the learning phase of Angular 2. I shall post new things I learn pretty soon. Please let me know if you have any feedback to improve this post.

