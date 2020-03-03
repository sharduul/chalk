---
layout: post
title: "Everything you should know about $formatters and $parsers"
description: "Super simple explanation of how formatters and parsers work in AngularJS. Learn to sanitize and validate your data with a simple example."
tags: [angularjs, the-how-series, hands-on-training]
---

{% include image.html path="posts/angularjs.jpg" path-detail="posts/angularjs.jpg" alt="AngularJS" %}



Ever came across a situation where you need to display the data in a certain format, but what you get from the database looks nothing like that? 

For example, suppose you have a JSON object of user information. In that object there is a field called "phoneNumber" and the object from database looks something like this:

{% highlight javascript %}
user: {
	name: "John Doe",
	company: "My Company",
	address: "2nd Street, NY, USA",
	phoneNumber: "9876543210"
}
{% endhighlight %}


As a front end developer, we are told to implement a form which is bound to the above object. And, the phone number is supposed to be displayed in a certain format to give a better user experience. The expected format is ###-###-####.

So, in the above example user phone number which is- "9876543210" should be displayed as "987-654-3210" on the input control. And even if the user edits the number- that format should be honored but the bound object "user.phoneNumber" should only contain numbers (no dashes).

AngularJS has just the right tools to do that. And they are called $formatters and $parsers.

### $formatters:
$formatters are an array of actions which are executed whenever the model changes. So, when data is retrieved from an API on the page load and is stored in a model which is bound to an input control- these array of actions are fired. 

Basically, the actions are fired whenever the model is updated. It happens after the model value is changed and before it is displayed on the view. So, you get a chance in between to manipulate the data and choose how you want to display it on the view.


### $parsers:
They are exactly opposite of $formatters. These are an array of actions which are fired when the user updates the value of model from the UI. 

So, in the above example, when a user tries to edit the phone number from UI- $parsers are executed.

These actions give you a chance to validate user input and choose how to display the data on the view. Consequently, you can also decide what the model should get updated with.

Allow me to show you a demo involving above concepts. For simplicity purpose, lets consider an example where an input control should accept only numbers.

For your convenience, the [complete demo can be found here](http://codepen.io/sharduul/pen/PbdPYx).


Our directive looks like this:


{% highlight javascript %}
return {
	restrict: 'A',
	require: 'ngModel',
	link: function (scope, element, attrs, modelCtrl) {

		// function that strips off characters other than numbers
		var getNumbers = function (inputValue) {
			if (!inputValue) {
				return '';
			}

			// retrieve numbers from the string
			var thenum = inputValue.replace( /[^\d\.]*/g, '');
		   
			// if the input does not match expected value.. change the rendered view to correct format
			if (thenum !== inputValue) {
				modelCtrl.$setViewValue(thenum); // view value is updated
				modelCtrl.$render(); // view is updated
			}
		
			// return only the numbers from string
			return thenum;
		};

		// when user changes input value from DOM
		modelCtrl.$parsers.push(function (modelValue) {
			var value = getNumbers(modelValue);
			return value;
		});

		// when model value is updated
		modelCtrl.$formatters.push(function (modelValue) {
			var value = getNumbers(modelValue);
			return value;
		});
	}
};
{% endhighlight %}

Please note, in the above demo, we are requiring "ngModel" controller. Whenever we need to communicate to an AngularJS controller, we have to "require" it in the controller.

In this case, $formatters and $parsers are provided by the "ngModel" controller. Therefore, we have to include that controller.

Now all we need to focus on is the function "getNumbers". Also, do follow the inline comments for better understanding.

The "getNumbers" function receives a parameter which is the value of the object bound to that input control. In our case, it contains a value of "$scope.data".

We then strip off all the characters, except numbers. And store the value in a variable. Then we check if this new variable's value is equal to the original value of the model object. 

Essentially, this is the step where validation is happening. 


{% highlight javascript %}
// if the input does not match expected value.. change the rendered view to correct format
if (thenum !== inputValue) {
	modelCtrl.$setViewValue(thenum); // view value is updated
	modelCtrl.$render(); // view is updated
}
{% endhighlight %}

So, if the value after stripping off illegal characters is not equal to the original value of the model we update the view value using "$setViewValue" function and render the view with the update value using "$render" function.

And then we finally return the validated value.

Now, as we call the same "getNumbers" function from $formatters as well as the $parsers we are making sure that the same valid value is retained on the view as well on the modeled object (i.e. $scope.data).

Which also means that, if there was any garbage value present in the database, it will get cleaned up when $formatter actions are executed. 

For example, try change value of "$scope.data" in "myController" to:

{% highlight javascript %}
$scope.data = "9876543210abcd";
{% endhighlight %}

When you run the code, you will see that value of "$scope.data" is cleaned up by the $formatters actions to become just "9876543210" (no illegal characters).

That is the magic of $formatters and $parsers.


### Summary:
So, $formatters and $parsers are really cool tools for manipulating data to display it in a certain way on the UI. They also come really handy to validate user input and allow values only that are legal as per the preset rules. Plus, you can use them to cleanup garbage database values too!



#### Further Resources We Recommend

- [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/3csc4EM)
- [You Don't Know JS: Up & Going](https://amzn.to/2uSZayI)