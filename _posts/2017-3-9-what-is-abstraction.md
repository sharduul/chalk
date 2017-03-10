---
layout: post
title: "OOP - Abstraction explained with a Chinese restaurant analogy"
description: "Concept of abstraction in programming languages made super simple with a funny restaurant analogy."
tags: [interview-questions, object-oriented-programming, the-what-series]
og_image: "posts/this.jpg"
---

{% include image.html path="posts/this.jpg" path-detail="posts/this.jpg" alt="Web" %}


### The What?

Consider the following scenario:
You go to a Chinese restaurant for your lunch. The waiter comes to you and hands you the menu-card. You, being a débutante at Chinese cuisines, have no clue what to order. But, thankfully, the menu has some pictures and few details about what each of the items contains.

After skimming through the menu for a dozen times, although not very confident, you make an educated guess and pick up an item that seems to be most edible to you! (Not that all Chinese dishes are not edible. :))


### Connecting the pieces:

Being a software developer, I really appreciate the thinking process of the person that created that menu card.

If you notice, the menu card only exposes the important ingredients of each food item, hiding away the unnecessary details which might overwhelm the customers. This helps customers to, although not perfectly, make a pseudo-confident guess about what they might like to eat.

This hiding away of the unnecessary details and complexities about the objects is called abstraction.


### The How?
Codifying the above example:

Ever wondered why functions are important in any programming language? Why is it recommended to break down your long never-ending lines of code into multiple functions?

Well, everyone knows it helps to keep things modular and make code reusable.

But, there is another reason they are so useful, which is probably not stressed upon enough.

Functions provide abstraction!

Consider the following code snippet.

{% highlight javascript %}
function cookGeneralTsoChicken(){

	// get all ingredients

	// mix them, add them to the pan
	
	// heat them
	
	// fry them to make it crispy
	
	// stir 
	
	// wait till its cooked
	
	return generalTsoChickenObject;
}
{% endhighlight %}


The above function cookGeneralTsoChicken- as the name suggests, is a function which follows the recipe to prepare General Tso Chicken. 

The caller of the function is only interested in the end result- that is, the General Tso Chicken. It does not care how its made, what ingredients it uses or how long its fried. In computer science terms we can say, the unnecessary complexity is abstracted and only important details are exposed. In this case, its the name of the function itself.


### The Why?
This brings us to an interesting and equally important question- Why is abstraction needed at all?

Suppose the owner of our Chinese restaurant fires the chef and hires a new one, because customers did not like the taste of his General Tso Chicken. The new chef comes on-board and changes the recipe radically, adding his home-made sauce to it. 

VOILA! General Tso chicken is suddenly everyone's favorite dish again.

Now, the customers are not concerned what changed, they are only interested in the final output- generalTsoChickenObject.

This mechanism of changing the recipe of your underlying application without affecting the final output is possible because of- Abstraction (via functions)!


### Summary:
Above was a so-called funny explanation on forever confusing concept of Abstraction in programming world. So the next time you visit your favorite Chinese restaurant go ahead and thank the chef for helping you get your programming basics straight.


And shoot me a reply if you like this analogy. I like to hear back from my readers.
