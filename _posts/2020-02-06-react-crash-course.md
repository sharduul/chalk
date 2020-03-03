---
layout: post
title: "React Crash Course - Learn React JS in 5 Minutes"
description: "This article teaches you the fundamentals of React JS and how to create your first React JS application. You will learn the building blocks of ReactJS like Components, JSX, Virtual DOM, etc."
tags: [reactjs, the-how-series]
og_image: "posts/reactjs.png"
---

{% include image.html path="posts/reactjs.png" path-detail="posts/reactjs.png" alt="ReactJS Getting Started" %}

Let's dive into the topic directly.

## What is React?

React is a JavaScript library created by Facebook.

React is a tool for building UI components (for the front end).

## How does React Work?

React creates Virtual DOM (Document Object Model) in memory.

Instead of manipulating the browser's DOM directly, React creates a Virtual DOM in memory, where it does all the necessary manipulating, before making the changes in the browser DOM.

React finds out what changes have been made, and changes only what needs to be changed.

## Why you should use React?

React is fast, scalable, flexible, and has a robust developer community which is rapidly growing.

React makes it simple to write your code because there no need of separate template files. Just one JSX file. More on this in the next sections.

It implements the component-based approach. Everything in React is a component - which helps you write scalable applications.

In the following sections, you will learn the various aspects of how React does this in the rest of this tutorial.

## Setting up a React Environment

Let's get your React environment setup.

If you have `NPM` and `Node.js` installed, you can create a React application by first installing the `create-react-app`.

Install `create-react-app` by running this command in your terminal
(in the folder where you want to save react app)

{% highlight javascript %}
C:\Users\the folder you wish>npm install -g create-react-app
{% endhighlight %}

Then you are able to create a React application, let's create one called `firstreact`

{% highlight javascript %}
C:\Users\the folder you wish>npx create-react-app firstreact
{% endhighlight %}

The `create-react-app` will set up everything you need to run a React application.
 
## Running the react app

Run this command to move to the `firstreact` directory:

{% highlight javascript %}
C:\Users\the folder you wish>cd firstreact
{% endhighlight %}

Run this command to run the React application `firstreact`

{% highlight javascript %}
C:\Users\the folder you wish\firstreact>npm start
{% endhighlight %}

A new default browser window will pop up with your newly created React App! 
(If not, open your browser and type localhost:3000 in the address bar)

## Modifying the installed react application

Let’s learn about how to customize our react app.

Look in the `firstreact` directory, and you will find an `src` folder. Inside the `src` folder there is a file called `App.js`, open it and it will code like this:

{% highlight javascript %}
/firstreact/src/App.js:
{% endhighlight %}

{% highlight javascript %}
import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
      </div>
    )
  }
}

export default App
{% endhighlight %}

Now, try changing the HTML content and save the file.

Changes are automatically reloaded into the browser.

Replace all the content inside the `<div className="App">` with a `<h1>` element. Like below.


{% highlight javascript %}
import React, { Component } from 'react'

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>Hello World!</h1>
      </div>
    )
  }
}

export default App
{% endhighlight %}

As soon as you replace this code and save it open your browser to see the changes.


## React Components

Components are like functions that return HTML elements via a render function.

Components are of two types - Class Components and Function Components.

## Creating a Class Component

The initial character of the class component must start with an uppercase letter.

The component has to include the extends `React.Component` statement, this statement creates an inheritance to `React.Component`, and gives your component access to `React.Component`'s functions.

The component also requires a `render()` method, this method returns HTML.

Create a Class component called `Ninja`

{% highlight javascript %}
class Ninja extends React.Component {
  render() {
    return <h2>Hi, We learning React</h2>
  }
}
{% endhighlight %}

## Creating a Function Component

Here is the same example as above, but created using a Function component instead.

A Function component also returns HTML and behaves pretty much the same way as a Class component.

Create a Function component called `Ninja`

{% highlight javascript %}
function Ninja() {
  return <h2>Hi, We are learning react</h2>
}
{% endhighlight %}

As you can see - writing Function components is much simpler and easier. It involves writing lesser code. So, it is recommended to use Function components whenever you can.

## React JSX

This another most important topic of React.

JSX stands for JavaScript XML.

JSX allows us to write HTML in React.

JSX allows us to write HTML elements in JavaScript and place them in the DOM without any `createElement()`  and `appendChild()` methods.

JSX converts HTML tags into react elements.

Let us demonstrate with two examples, the first use JSX and the second does not have JSX anything to do:

### Example 1 (Using JSX)

{% highlight javascript %}
const myelement = <h1>We are learning React!</h1>;
ReactDOM.render(myelement, document.getElementById('root'));
{% endhighlight %}

### Example 2 (Without Using JSX)

{% highlight javascript %}
const myelement = React.createElement('h1', {}, 'We are learning react');
ReactDOM.render(myelement, document.getElementById('root'));
{% endhighlight %}

In both the examples the output is same i.e **We are learning react**.

In example 1, we pass HTML directly within the JavaScript code. So as you can see - JSX lets you write your code in a much dev-friendly manner.

Another reason why JSX is recommend is that it is type safe. So, a lot of errors and typos are handling during development time. It just makes the development experience a lot better.

For more React examples please [check this out](https://react.rocks/).

## Conclusion

Kudos! You just created your first ReactJS application. I am sure you have started like React at least a little.

Remember it is a very fast growing JavasScript framework. It lets you write component-based UI for small and large applications.

If you are interested to learn more about React and build beautiful applications using it I highly recommend you to checkout [our bootcamp](https://cutt.ly/web-development-bootcamp).


> Author: B.K. Sai Kalyan<br>
> Gmail: saikalyan1729@gmail.com<br>
> To know more about the author: [website](https://sites.google.com/view/sai-kalyan-bhagavathula/home?authuser=1) 

---

<br>

#### Further Resources We Recommend

- [The Road to Learn React: Your Journey to Master Plain Yet Pragmatic React.Js](https://amzn.to/2PElkvt)
- [You Don`t Know JS (ES6 & Beyond)](https://amzn.to/3cAwBHk)

<br>

## Read Next

[5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)


