---
layout: post
title: "AngularJS: How to focus any input control you want?"
description: "Focus any input you want using simple AngularJS directive. Trigger focus through click event. Or focus any input when it becomes visible."
tags: [angularjs, the-how-series]
og_image: "posts/focus.jpg"
---

{% include image.html path="posts/focus.jpg" path-detail="posts/focus.jpg" alt="AngularJS Focus Input" %}


Uh-oh! I know that face.

You want to focus an input control and the built-in `autofocus` attribute does not work the way you want. Or you have tried and tested a bunch of [solutions from stackoverflow](https://stackoverflow.com/questions/25596399/set-element-focus-in-angular-way), and although some of them are really good, they do not suffice your needs.

Worry not!

I will teach you a very simple directive which will hopefully suffice all your focusing needs. And the best thing is- it is so simple that you can customize it to suit your un-sufficed requirements as well.

Let's dive in then.

I will show you 2 common cases when you need to focus some input control. Most of the situations should be covered in these cases. If not, shoot me a comment and I will fix it for you.

Another great thing about this directive is that it's not limited to just focusing the `input` type controls. You can select checkboxes, radio buttons, select dropdowns and so on.

Please follow the whole [demo on this CodePen here](https://codepen.io/sharduul/pen/QMeWob).

### Case 1:

Consider you have the form and all its controls visible on the screen. And based on some event like clicking a button or selecting a dropdown, you want to focus the first control of your form.

What we need to do is expose a scope variable `trigger` to our view template from the directive. And keep a watch on this `trigger` variable. Whenever the `trigger` is reset to `true` browser will focus on the control you choose.

{% highlight javascript %}
// Focus if focusme is triggered
scope.$watch('trigger', function(value) {
    if(value === true) { 
        $timeout(function() {
            element[0].focus();
            scope.trigger = false;
        });
    }
});
{% endhighlight %}

The above is a snippet from our `focusMe` directive. As you can see, it watches the `trigger` scope variable. And whenever the value changes to `true` it calls the `focus()` method on the element we applied this directive to. 

And after the focus is applied we reset the `trigger` to `false` so that whenever the event is triggered again we can focus the control as expected.

Note: We need `$timeout` to make sure that Angular runs the digest cycle to apply the focus event.

Now, let's see how to trigger this focus.

Below is a snippet from our view template. It uses `click` event to trigger the focus on our chosen control.

{% highlight javascript %}
<button class="btn btn-primary" ng-click="focusTriggerInput=true">Trigger</button>
{% endhighlight %}

And that's it. Now, you can trigger the focus on any control from anywhere on the page.

### Case 2:

Well, Case 1 was pretty straightforward. In fact, I have noticed that in most situations that are similar to Case 1, you can get away with using built-in solutions.

But, the Case 2 is where most of the solutions fail. Let's see what that case is.

Let's say you have a side panel which has an input form. The side panel hides and shows based on some click event happening on the main page. Now, you want to focus on some input control everytime the side panel opens.

Well, you might say why not apply the Case 1 here. Just listen to the click event which hides and shows the side panel and triggers the focus just like we did in the above example.

Yes, that might work in some situations. But, imagine our side panel is a directive itself. Or worse, we are using some transclusion magic on it. In such situation, all the equations of scopes changes. And although, it is still doable- our directive wouldn't be as simple and lightweight as it is right now.

So, what do we do then?

Well, the solution is simple. Just watch your parent container showing and hiding. Whenever the parent container is shown, trigger the focus. That's it.

Now, the question is how do we know when the parent container's visibility is toggled?

Below is a snippet which shows how we keep track of it.

{% highlight javascript %}
// Focus if parent container is made visible
scope.$watch(function() { return element.attr('class') }, function(newValue) {
    
    $timeout(function() {
      if (newValue.match(/ng-hide/) !== null) {
        return; // Element is hidden.
      } 
      
      var input = element[0].querySelector(scope.focusChild)
      if(input){
         input.focus();
      }
      
      scope.trigger = false;
    });
});
{% endhighlight %}

We are lucky that Angular toggles the class `ng-hide` whenever we use directives like `ng-hide` or `ng-show`. We can take advantage of it.

Just watch the `class` attribute of the parent container element. Whenever we see that `ng-hide` class is removed from the container element we trigger the focus on the chosen control.

`scope.focusChild` variable contains the class of the input control that we would like to focus on. The below template code will give you a better perspective.

{% highlight javascript %}
<div class="form-group parent" focus-me focus-child=".visibleInput" ng-show="isParentVisible">
  <label class="caption" for="visibleInput">Parent Visible Input</label>
  <input type="text" id="visibleInput" name="visibleInput" class="visibleInput" 
         ng-model="visibleInput" />
</div>
{% endhighlight %}

The above HTML shows how we have assigned our `focusMe` directive to the parent container element this time. And then, the `focus-child=".visibleInput"` attribute specifies the child that we would like to focus on.

`ng-show="isParentVisible"` is how we toggle our parent container. So, now, whenever the `isParentVisible` variable is reset to `true`, our parent container will become visible which means Angular will remove `ng-hide` class from it. And that will be our trigger to focus the input control.

Again, please take a look at this [demo](https://codepen.io/sharduul/pen/QMeWob) for clearer understanding.


### Summary:

We just created a simple `focusMe` directive which takes care of focusing the chosen input control whenever we intend to. We saw at two most common cases in which you would like to focus on some control.

Hopefully, those two cases should cover most of the scenarios for you. If not, you can leverage the same `focusMe` directive to add some extra functionality.

If you want, you can drop me a comment below and I can help you to fix your focusing situation.

By the way, if you want to learn how to watch controller variables you should check out [this post](http://ngninja.com/posts/watch-controller-properties-in-angularjs).

Also, don't forget to checkout this trending post on Ngninja- [How to create Gmail like multi-select checkbox dropdown in AngularJS?](http://ngninja.com/posts/angular-gmail-multi-select-control)


## Further Resources We Recommend

### [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/36F6N8v)
### [You Don't Know JS: Up & Going](https://amzn.to/2u8YuVt)