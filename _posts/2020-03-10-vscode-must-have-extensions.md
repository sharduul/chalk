---
layout: post
title: "Must Have Best VSCode Extensions To Increase Your Productivity"
description: "Essential VSCode extensions that will improve your productivity as Web Developers. This article contains a list of VSCode plugins that will make every JavaScript developer's life easy."
tags: [programming, vscode, listicles, web]
og_image: "posts/vscode.png"
---

{% include image.html path="posts/vscode.png" path-detail="posts/vscode.png" alt="Must Have VSCode Extensions" %}

Beginning development in VSCode? Switching to VSCode? Save the nostalgia and the lost feeling. These extensions are here to save the day and possibly a lot more days before the deadline.

## 1. Prettier

It claims to be *opinionated code formatter*. Let me break it down ever had a team project where everything was fine but there was some problem reading the code after compiling all codes because of different formatting *haha next time please use formatting*. 

So how prettier help you? It does the task of formatting and it is completely automatic.

To install Prettier


{% highlight javascript %}

In VS code enter
$ CTRL+P

Then type-
$ ext install esbenp.prettier-vscode

{% endhighlight %}

[**OR install Prettier from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

There are two ways to use prettier

1. It is set by default to auto-format

OR

2. Open settings.json and add the following lines

{% highlight javascript %}

// Set the default
"editor.formatOnSave": false,

// Enable per-language
"[javascript]": {
    "editor.formatOnSave": true
}

{% endhighlight %}

![Prettier in action](https://thumbs.gfycat.com/OblongIlliterateFattaileddunnart-size_restricted.gif)

## 2. Live Server

The most frequent thing done by a developer is opening a browser and reloading the webpages repeatedly to see the changes made by their code and a server to test their website. 

This extension covers both the problems. It has an auto-reload feature and a server to test your website. It also allows you to have a customizable port number, server root, default browse, preferable hostname, https support and a lot of extra features. 

> You must be thinking an extension having all these features must be complicated to use? Not at all. All these happen just with the push of a button.

Just press this button(if you have the Html file)

![Logo](https://github.com/ritwickdey/VSCode-live-server/raw/master/images/Screenshot/vscode-live-server-statusbar-3.jpg)



If you don't have the Html file then to start the server press-

{% highlight javascript %}

$ ALT+L

{% endhighlight %}

To install Live Server

Enter in VS code-

{% highlight javascript %}

$ CTRL+P

{% endhighlight %}

Then type the following-

{% highlight javascript %}

$ ext install ritwickdey.liveserver

{% endhighlight %}


[**OR install Live Server from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

![Live Server in action](https://raw.githubusercontent.com/ritwickdey/live-server-web-extension/master/img/screenshots/live-server-web-extension.gif)

## 3. Gitlens

Let's go to the team project again. To understand why and what someone did some changes to code is a lot of hassle. 

That is where Gitlens comes into play. You must be having questions, *"why use Gitlens while VS Code already has GIT capabilities built-in?"* . 

> GitLens improves the functionality of Git, which is integrated into Visual Studio code. 

It helps you identify the authorship of the code at a glance through annotations and Git code targets, navigate smoothly and explore the Git repositories, and get valuable information thanks to powerful comparison commands.

[**Install Gitlens from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

![Example](https://raw.githubusercontent.com/eamodio/VSCode-gitlens/master/images/docs/gitlens-preview.gif)

## 4. Debugger for Chrome

Debugging can be troublesome. This extension helps to debug your JavaScript code in the Google Chrome browser, or other browsers that support the Chrome DevTools Protocol. 

Setting breakpoints, debugging eval scripts, script tags, and scripts that are added dynamically.

[**Install Debugger for chrome from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)

![Example](https://code.visualstudio.com/assets/blogs/2017/12/20/sync_stepping.gif)

## 5. ESLint

Worst nightmare? After finishing a big project just before submitting you find errors. I believe you must be wishing for something to control errors? Guess what Christmas came faster this year, ES Lint javascript developers this extension will lint out most of the errors in your code.

[**Install ES Lint from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=dbaeumer.VSCode-eslint)

![Example](https://i.github-camo.com/f01f35e97c771ac7bb2e3067cb99fb63c8038a37/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f3133353937372f323335313230362f38306536366364322d613537392d313165332d396338302d6538336565646637356164632e676966)

## 6. Auto Rename Tag

This extension is self-explanatory. If you rename a tag this extension automatically renames the paired tag. Making life easier. :)

[**Install Auto Rename Tag from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)

![Example](https://github.com/formulahendry/VSCode-auto-rename-tag/raw/master/images/usage.gif)

## Honorable mentions

These extensions are not much required but are a handful bunch.

## Settings Sync

If you tend to work in different systems setting them up is a hectic task. Here this extension comes into play. It syncs all your extensions and their configuration, workspaces folder, launch files and their customized VS code settings to your Github in one click. It also syncs them whenever there is a change in any of those and provides a summary too.

[**Install Settings sync from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)

## Polacode

When you need to share some code in an image format these apps do that. It has various combinations of them with fonts and creates beautiful code polaroids or cod-aroids.

[**Install Polacode from VS marketplace**](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)

![Example](https://github.com/octref/polacode/raw/master/demo/usage.gif)

That's it, folks.

## Conclusion

In this article, we looked at some of the must-have VSCode extensions that can make any developer's life easy. I'd encourage you to try them out yourself and see which ones you like the most.

Also, if you have any other suggestions please comment below so that we can everyone benefit from it.


> Author: Dibyajyoti Parida <br>
> Email: parida.dibya2002@gmail.com <br>

---

<br>

#### Further Resources We Recommend

[The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2PElkvt)

<br>

## Read Next

- [How to make passive income? More importantly - WHY?](http://ngninja.com/posts/how-to-make-passive-income)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
