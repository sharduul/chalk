---
layout: post
title: "How to use Angular 2 built-in Pipes in your TypeScript? Simple Trick."
description: "Built-in Angular 2 pipes can easily be used in templates using interpolation. How to easily use the same pipes in your typescript components."
tags: [angularjs, angular2, the-how-series]
og_image: "posts/tools.jpg"
---

{% include image.html path="posts/tools.jpg" path-detail="posts/tools.jpg" alt="Angular 2 built-in Pipes" %}


There are tons of examples online on how to use pipes in your templates. They are pretty much used the same way as you used filters in Angular 1.x.

For example, if you want to format a value as currency it can be done as follows:

{% highlight javascript %}
{% raw  %}
<p>A: {{a | currency:'USD':true:'1.0-0'}}</p>
{% endraw %}
{% endhighlight %}

So, if the value of `a` is 2345. It will be displayed as "$2,345". That simple.

But, in my recent project, I had come across a situation where I wanted to use built-in pipes in my component file instead of the view. And pass that formatted value to the nested component.

Everywhere I searched I could find solutions to create custom pipes. And in such a custom pipe you can include built-in pipes and extend it as per your need. It was a little over-kill for the job I wanted to accomplish.

So, I gathered all the information I could and found a better, easier way to use built-in pipes directly on your data in your components.

Let's see how this is done. Please follow a [full working demo here](http://plnkr.co/edit/P2SzhTj2jIHbQITXBa6W?p=preview).

The first thing to do is add `CurrencyPipe` as to the provider's array in your module.

{% highlight javascript %}
providers: [CurrencyPipe]
{% endhighlight %}

If your module is defined in some other file than your component, you will have to import `CurrencyPipe` in that file.

{% highlight javascript %}
import {CurrencyPipe} from '@angular/common'
{% endhighlight %}

Then, import `CurrencyPipe` in your component.

{% highlight javascript %}
import {CurrencyPipe} from '@angular/common'
{% endhighlight %}

Then create a private object representing the `CurrencyPipe` service.

{% highlight javascript %}
constructor(private cp: CurrencyPipe) { ... }
{% endhighlight %}

Now, to use the currency formatting use just have to use the `transform` method provided by the pipe. Like below.

{% highlight javascript %}
this.value = 12345;
this.value = this.cp.transform(this.value, 'USD': true: '1.0-0'); // $12,345
{% endhighlight %}

The first parameter is the value to be formatted. And the rest of the parameters are the usual pipe parameters you would pass depending on the type of pipe you are using. For more details check out the [Currency Pipe] documentation(https://angular.io/docs/ts/latest/api/common/index/CurrencyPipe-pipe.html).

In this case, `'USD'` is the currency code. The `'true'` value represents whether you want to use the symbol or not. 

The `'1.0-0'` value represents a [decimal pipe argument](https://angular.io/docs/ts/latest/api/common/index/DecimalPipe-pipe.html). 

They are in a form of:

{% highlight javascript %}
{minIntegerDigits}.{minFractionDigits}-{maxFractionDigits}
{% endhighlight %}

Again, you can find the [full demo here](http://plnkr.co/edit/P2SzhTj2jIHbQITXBa6W?p=preview).

### Summary:
I hope this short and simple post comes handy when you come across any similar situation. Now, that you have learned how to use built-in pipes in your components, extending them to create your custom pipes is as much easy. Shoot me with any questions or concerns you have.


#### Further Resources We Recommend

- [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/3csc4EM)
- [You Don't Know JS: Up & Going](https://amzn.to/2uSZayI)
