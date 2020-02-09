---
layout: post
title: "A comprehensive beginner's guide to set up ReactJS"
description: "Step by step guide to setup a ReactJS development environment. A very simple guide to install all the depenedencies and configure Node, Webpack and Babel for your first ReactJS project."
tags: [reactjs, the-how-series]
og_image: "posts/reactjs.png"
---

{% include image.html path="posts/reactjs.png" path-detail="posts/reactjs.png" alt="ReactJS Getting Started" %}


If you are a web developer, or you’re trying to become one, chances are you’ve heard about React.js, a Javascript framework for the front end.

I did hear about it, a while ago, and I said to myself:
“Ok, now that you know quite a lot about HTML, CSS, and Javascript, you should step up your game, and dive into a framework like Angular, or this new one that’s so popular, React”

And so I did, and god it was an absolute disaster. Turns out React “JS” is not just all about Javascript. 

Don’t get me wrong, a solid JavaScript knowledge will make the learning curve easier, but you have to now a bunch of tools in order to set up your workspace and be able to use React in all his glory.  The problem with all this set up is that quite a few tutorials out there about React do not explain all that is happening. They either assume that you know all these tools/libraries beforehand, or just some of them, or they just say “hey type this here” and don’t explain what is going on. That’s why this post exists, so you don’t have to deal with all of that, and you can quickly set up, start working with React and understand why do you have to use each library we need.

Before we actually dive into the guide, I have a quick disclaimer for an absolute beginners: We are going to work with a JavaScript framework, I know it might sound great and exciting BUT be sure to have a solid JavaScript knowledge before jumping into learning any framework, because the learning curve can become quite stiff, frustration is  gonna become your friend and you might decide that “front end development is too hard and not made for you”. All of this because you didn’t have that JavaScript basic knowledge.

Ok, with all that being said, let’s just jump into it, see what you need and why. By the way, the complete code can be found [here](https://github.com/CodeMyCoffee/beginner-set-up-ReactJS)

### Node.js
#### What: 
“Node.js is an open-source, cross-platform JavaScript runtime environment for developing a diverse variety of server tools and applications.” 

#### Why: 
With Node.js we get also the Node Packet Manager, also know as NPM. We can easily install a lot of JavaScript libraries that we are going to need and we can set up a local server to run or React application

### Webpack
#### What: 
“webpack is a module bundler for modern JavaScript applications.” A module bundler is simply a tool that grabs all of our JavaScrip or CSS files and puts them together in just one file, and it can also perform some modifications to them in the process

#### Why: 
While working with React you are going to create A LOT of files and is better to have them all merged and organized in one file for the browser to read. Moreover, React uses something called [JSX](https://facebook.github.io/react/docs/jsx-in-depth.html), which cannot be interpreted by a browser. Webpack can get all those .js files containing JSX process them using Babel,  and put all together in one bundled JavaScript file that the browser can understand

### Babel
#### What: 
“The compiler for writing next generation JavaScript.” That’s basically it. It can compile JSX and  ES5+ into JavaScript that the browsers can understand

#### Why: 
As I mentioned before, we are going to write JSX, and browsers cannot understand it, that’s why we need a compiler to translate it to plain JavaScript

Now you know what you need and why you need it in order to use React. So let’s get started with the fun part, and build or first React project!

First of all, you need to download and install [Node.js](https://nodejs.org/en/download/). The actual installation is pretty straightforward and easy to do, so we are not going to cover how to do that. One you have it installed, open your terminal/cmd/powershell and type 


{% highlight javascript %}
node -v
npm -v
{% endhighlight %}


Each command will return the version of node and npm that you have. This is just to check that the installation was successful and that you have node and npm in you PATH.

(If something went wrong for you, try searching your error on the web, chances are your problem happened to someone else and it has a solution. I’m not going to cover troubleshooting here as it can be really long and extensive depending on the error)


Once you have Node and npm installed, in your terminal, navigate to the folder where your project is going to be and type:
 
{% highlight javascript %}
npm init
{% endhighlight %}

This will start a prompt to fill a file named "package.json", and it has the name, version, description, git, scripts and dependencies of our projects. 

You can leave them blank for now or fill them up if you want, it won’t affect the behavior of the project if you don’t have a git or a description for instance. This file is really important because it tells npm what modules you need for your project, that means that I could fork that project from Github, run ‘npm install’ on my computer, and npm will download for me all dependencies specified in "package.json" file.

Ok now we need to actually install our dependencies, and that is really simple with npm. Just type: 

{% highlight javascript %}
npm install --save <package-name>
{% endhighlight %}


*--save includes the installed package in the packages.json file, is not mandatory but is better to have it*

We are going to install them all at the same time with a single script(notice that each package is separated with a blank space): 

{% highlight javascript %}
npm install --save react react-dom babel-core babel-loader babel-preset-react webpack webpack-dev-server html-webpack-plugin
{% endhighlight %}

Those are a lot of packages, but you already know what are they for. If you go to your "package.json" file you will notice that it has now all the dependencies installed and their version number indicated.

We are almost done with the setup, bare with me a little bit longer, we only have to configure webpack now, and then we will be able to start a server and create our first React component.

Let’s create a couple of  new files in the root folder or your project, called ".babelrc" and "webpack.config.js"

Open the .babelrc and type

{% highlight javascript %}
{“presets”:[“react”]}
{% endhighlight %}

And that’s it. That’s all the configuration you need in your file to use bable because the rest of the magic is done by webpack.

Now, webpack is a bit more complex, but as we know now, it takes some JavaScript input and generates an output, and that input can be processed. 

First, create a new folder called app(or whatever you want to name it) and an "index.js" file in it, and an "index.html" file. Here is where we are going to write or React application, inside "index.js", and then render it in the index.html. Now let’s see how can we translate that input/output concept to or webpack.config.js file.

{% highlight javascript %}
var HtmlWebpackPlugin = require('html-webpack-plugin')
var HTMLWebpackPluginConfig = new HtmlWebpackPlugin({
  template: __dirname + '/app/index.html',
  filename: 'index.html',
  inject: 'body'
});

module.exports = {
  entry: [
    './app/index.js'
  ],
  output: {
    path: __dirname + '/dist',
    filename: "index_bundle.js"
  },
  module: {
    loaders: [
      {test: /\.js$/, exclude: /node_modules/, loader: "babel-loader"}
    ]
  },
  plugins: [HTMLWebpackPluginConfig]
};
{% endhighlight %}


That seems like a lot, but it’s actually pretty simple. 

The first piece of code is getting that package we installed "html-webpack-plugin" and using it to to get our "app/index.html" and then use it to create a new file called "index.html" and inject in the body the content of our app. This new file is going to be bundled with webpack. 

Now looking at the module.exports section, we have an entry point, a path to our "index.js". Then we set the output, which is going to be a new directory called "/dist", and we are going to create a file in it called "bundle.js". As you probably guessed, this file is the one that is going to contain all the bundled js form our app. 

In the module [] part, we can tell webpack to use babel to compile our js files, and we do that as shown in the code, test the .js files (using a regEx), then we exclude the node_modules folder(created when we did npm init) as we don’t need to check that folder, and finally we declare that our loader is babel. 

The final line is the HTML plugin we set at the beginning of the file.

Now we can actually build something in React! Congratulations if you made it this far, I know is a long and a bit exhausting process, but now you should be able to set up React without any problems and even explore more about webpack or npm to understand even better the usage of these tools.

Finally, we can create your React component, this last bit is going to be short, I promise.

Go to you "index.html" file and create the basic skeleton for a web page, and inside the body, create a single div with id=”app”. We need this id in order to render our react component into the Html. Now we are done with the HTML, let’s go to the "index.js" file  and type 

{% highlight javascript %}
var React = require('react');
var ReactDOM = require('react-dom');
{% endhighlight %}

This will import our two react libraries into the file so we can use them. 

{% highlight javascript %}
var MyComponent = React.createClass({


    render: function(){
        return(
            <div>
                <h1>Hello World!</h1>
            </div>
        )
    }
})

var app = document.getElementById("app");

ReactDOM.render(<MyComponent/>,app);
{% endhighlight %}

This is the last bit of code, create a variable that is going to contain your component. As you can see we have a render function that returns HTML. 

This is [JSX](https://facebook.github.io/react/docs/jsx-in-depth.html), a preprocessor step that adds XML syntax to JavaScript. That means we can write HTML code inside our regular JavaScript. It’s a bit weird at first but it’s really handy.
 
We are almost done. The last two lines get the element in our index.html with id=app so we can later tell react to render our component inside of it.

Now go to your package.json and inside the “scripts”:{} add the following

{% highlight javascript %}
"scripts": {
  "start": "webpack-dev-server"
}
{% endhighlight %}


This is a common set up so we can simply run in the terminal  

{% highlight javascript %}
npm run start
{% endhighlight %}

This will start a web server in your "localhost:8080" where you can see your first app made with react, already up and running! 

The good thing about this command is that you don’t need to reset the server in order to see the changes, just save the files that have any changes and it will automatically refresh and update.

### Summary:
That was a bit long of a journey just to get started with React, but know you should be able to create React projects from scratch, and even use the tools here mentioned with other purposes as they are not React exclusive.

The complete code for the above ReactJS project setup can be found [here](https://github.com/CodeMyCoffee/beginner-set-up-ReactJS).

Congratulations again if you made it this far into the post, and I hope is was helpful to you!


## Further Resources We Recommend

### [The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2RIqGYk)
### [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/2GGox8Y)


## Read Next

[5 Common mistakes JavaScript developers make](/posts/mistakes-by-javascript-developers)


  
  
  
  