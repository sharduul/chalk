---
layout: post
title: "7 HTML Tips and Tricks"
description: "This articles teaches you 7 HTML tips and tricks that will save your time and make you more efficient."
tags: [programming, html, productivity]
og_image: "posts/tricks.jpg"
---

{% include image.html path="posts/tricks.jpg" path-detail="posts/tricks.jpg" alt="7 HTML Tips and Tricks" %}

In this article you will find some useful tips and tricks on html which save your time while developing web applications.

As we are programmers for us everything starts with **ZERO**.


## Trick 0 - Email Validation

If your developing any sort of application form or registration form you has to get email address from user. It's not guaranteed that user will always give correct email address. To check the users input you has to script a bit long java script program.

But now in HTML5 this problem solved with a small keyword. We can solve it by simply giving a keyword **email** assigning to type in the text field.

{% highlight javascript %}

<html>
  <head></head>
  <body>
    <form class="" action="" method="post">

      Enter your Email address : <input type="email" value="" placeholder="Enter your email id" />
      <input type="submit" name="" value="submit" />
      
    </form>
  </body>
</html>

{% endhighlight %}

Check this amazing magic this will help you a lot while developing this kind of projects.


## Trick 1 - Mandatory Field

This is other awesome trick which saves lot of time.

While your developing some forms some times you has to make some fields as mandatory for that you has to develop a code to check that field is shouldn't be empty while the time of submitting the forms.


But now in HTML5 this problem solved with a small keyword. We can solve it by simply giving a keyword **required** in any position on the textfield.

{% highlight javascript %}

<html>
<head></head>
<body>
  <form class="" action="" method="post">

    Enter your Email address : <input type="email" value="" placeholder="Enter your email id" required />
    <input type="submit" name="" value="submit" />
  </form>
</body>
</html>

{% endhighlight %}

Check this amazing magic this will help you a lot while developing this kind of projects.

## Trick 2 - Add Horizontal Line

It is always preferred to break the long sections into smaller parts for better readability and understanding. For that there is a tag in html it will break the entire page by cutting it horizontally.  


{% highlight javascript %}

<html>
<head></head>
<body>
  Hello World! <hr>
  This is Ninja academy.
</body>
</html>

{% endhighlight %}

## Trick 3 - Password

There is a need to hide the text entered in a text field from others in some scenarios.

This is other awesome trick which saves lot of time.

While your developing some forms some times you has to hide the text entered in that fields for that there is a feature which satisfies our need.

By assigning type as **password** in that text field.

{% highlight javascript %}

<html>
<head></head>
<body>
  <form class="" action="" method="post">

    Enter your password : <input type="password" value="" placeholder="Enter your password" required />
    <input type="submit" name="" value="submit" />
  </form>
</body>
</html>

{% endhighlight %}

Check this amazing magic this will help you a lot while developing this kind of projects.


## Trick 4 - Number Validation

If your developing any sort of application form or registration form you has to get some numerals from user. It's not guaranteed that user will always give correct email address. To check the users input you has to script a bit long java script program.

But now in HTML5 this problem solved with a small keyword. We can solve it by simply giving a keyword **number** assigning to type in the text field.

{% highlight javascript %}

<html>
<head></head>
<body>
  <form class="" action="" method="post">

    Enter a number : <input type="number" value="" placeholder="Enter a number" />
    <input type="submit" name="" value="submit" />
  </form>
</body>
</html>

{% endhighlight %}

Check this amazing magic this will help you a lot while developing this kind of projects.

## Trick 5 - Placeholder

If your developing any sort of application form or registration form it is always preferred to display a short hint that describes about for what that text field meant for.

In HTML5 this problem solved with a small keyword. We can solve it by simply giving a keyword **placeholder** by assigning a what is the text has to be displayed in it.

{% highlight javascript %}

<html>
<head></head>
<body>
  <form class="" action="" method="post">

    Enter your Name : <input type="email" value="" placeholder="Enter your name" />
    <input type="submit" name="" value="submit" />
  </form>
</body>
</html>

{% endhighlight %}

Check this amazing magic this will help you a lot while developing this kind of projects.

## Trick 6 - Video Tag

If we want to upload a video in a website there is a tag named **video** which makes a browser to understand this file is a video.

The ```<video>``` tag is used to embed video content in a document, such as a movie clip or other video streams.

The ```<video>``` tag contains one ore more ```<source>``` tags with different video sources. The browser will choose the first source it supports.

The text between the ```<video>``` and ```</video>``` tags will only be displayed in browsers that do not support the ```<video>``` element.

{% highlight javascript %}

<html>
<body>

  <h1>The video element</h1>

  <video width="320" height="140" controls>
    <source src="video.mp4" type="video/mp4">
    There is some error in playing the video.
  </video>

</body>
</html>

{% endhighlight %}

The video placed in **src** attribute will play the video.
Controls attribute will display the pause, play, next, full screen and volume etc.., controls on the video.



> Author: B.K.Sai Kalyan <br>
> Gmail: saikalyan1729@gmail.com <br>
> To know more about the author: [website](https://sites.google.com/view/sai-kalyan-bhagavathula/home?authuser=1) <br>


---

<br>

## Read Next

- [5 Common mistakes JavaScript developers make](/posts/how-to-make-responsive-webapps)
- [Most Frequently Asked JavaScript Interview Questions](/posts/frequently-asked-javascript-interview-questions)
