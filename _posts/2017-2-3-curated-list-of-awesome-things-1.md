---
layout: post
title: "Curated list of awesome things around the world - 1"
description: "A curated list of all the inspiring things I discovered in this week. It includes great people I met, cool Startups I came across and incredible solutions to tech problems I solved. "
tags: [curated-list, tech]
---

{% include image.html path="posts/curatedlists/santa-list.jpg" path-detail="posts/curatedlists/santa-list.jpg" alt="Curated List" %}


This marks the beginning of an awesome era in our Ng-Ninja world. Starting today, on every Friday we are going to publish a curated list of awesome people we have discovered, cool startups we came across, things we learned in this week.

These curated lists, although will focus on technology, will not be limited to it. This will be more of a platform to share with you guys about the things and people that inspired us. The lessons which helped us keep moving forward in our journey.

So, let's dive in. This week's list is targetted towards cool people we discovered and things we learned while learning the new web framework- Angular2.

### 1. [Lea Verou](http://lea.verou.me/about/)
I have been following Lea Verou for a while now. I came across her website while searching for cool developers to interview for this blog. I am still learning a lot of things about and from her before I approach her for the interview. She writes and speaks on front end web technologies like CSS, JavaScript, HTML. All the aspiring front-end ninjas- follow her!

### 2. [A guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
Being a front engineer myself, I have to keep up with all the front end technologies. Although flexbox concept has been around for more than a while now, I have started getting used to it recently. If you are anything like me, this is a wonderful explanation on CSS-flexbox.

### 3. [How to reverse order of children of a DIV](http://stackoverflow.com/questions/38002640/how-do-you-access-the-element-html-from-within-an-angular-2-attribute-directive)
Again for all the front end engineers. This is a super awesome trick to have up your sleeves. 

Many times when you are working on responsive designs you come across a problem when you need to stack DIV's on top of each other for mobile screens.

Below scenario is real simple to do so using bootstrap classes:

{% highlight javascript %}
[#div1 col-lg-6]    [#div2 col-lg-6]
{% endhighlight %}

becomes

{% highlight javascript %}
[#div1 col-xs-12]
[#div2 col-xs-12]
{% endhighlight %}

But how would you invert the order? To produce:

{% highlight javascript %}
[#div2 col-xs-12]
[#div1 col-xs-12]
{% endhighlight %}

You are going to thank me for this trick! (..actually, for the link to this trick.)


### 4. [Model drive forms in Angular2](https://scotch.io/tutorials/using-angular-2s-model-driven-forms-with-formgroup-and-formcontrol)
If you are just starting with Angular2, [Scotch.IO](https://scotch.io/) has some really good articles for you. This one is one of those great articles. Learn about new pattern introduced in Angular for dealing with user input forms. This article has a great article on model driven forms.


### 5. [Build nested model driven forms](https://scotch.io/tutorials/how-to-build-nested-model-driven-forms-in-angular-2)
Again from [Scotch.IO](https://scotch.io/), this one is on the same topic as above. But, a little more advanced. This article deals with scenarios when you model is nested consisting of nested objects and arrays. Again, a super simple explanation of such important cases you can start implementing right away.


### 6. [Out of the box validators for Angular2](https://www.npmjs.com/package/angular2-validators)
Until this week I was writing my own validators for validating emails, phone number, social security numbers and so on. Then I was introduced to this awesome library by my colleague. This library has all the validator which you would require to validate your input forms. May it be email, or phone number, or even credit card. This library has out of the box solutions for validating everything. 


### Summary:
By now you must have realized, that I have just started learning Angular2. Yes, you are right! But, don't worry my future curated list of awesome things will cover other areas as well.

Please let me know what do you think of this list of awesome things I discovered in this week. Also, please do let me know if there is anything else that you came across and you want to share it with me.



