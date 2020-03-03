---
layout: post
title: "How to create Gmail like multi-select checkbox dropdown in AngularJS?"
description: "AngularJS multi-select checkbox dropdown using Angular-Bootstrap. Super simple Gmail like multi-select component in AngularJS."
tags: [angularjs, the-how-series]
og_image: "posts/puzzle.jpg"
---

{% include image.html path="posts/puzzle.jpg" path-detail="posts/puzzle.jpg" alt="AngularJS multi-select component" %}

Multi-select dropdowns in AngularJS is a popular control. Let's do ahead a step and create something more advanced, yet so simple.

Ever had an Aha! moment while using the Gmail multi-select checkbox tool? The one with dropdown options. Remember? The control which lets you select/un-select all the emails in a list and performs some action on them.

Well, below is an image for you if you are still wondering what am I talking about.


{% include image.html path="posts/specific/gmail-multiselect.png" path-detail="posts/specific/gmail-multiselect.png" alt="AngularJS multi-select component" %}


That tool has always come handy to me. It's one of those moments when you realize how UX plays such an important part in any web app's life.

So, let's see how can we build a simple control like it, using AngularJS and [Bootstrap Angular UI](https://angular-ui.github.io/bootstrap/). For [full demo please visit this codepen](https://codepen.io/sharduul/pen/wqqGXy).

If you use Kendo widgets- check out [how to customize your Kendo multi-select control with ease](http://ngninja.com/posts/kendo-multi-select-widget) in AngularJS.

Our aim is to build a reusable component which lets us perform an action on a batch of items together. Let's call it `multi-checker`. 

As we need to be able to plop it anywhere in the app, we have to make sure that the interface of our component is simple enough and that we don't tightly couple our `multi-checker` component with any of the views.

Let's dive in.

#### Controller

First, let's mock a list in the controller as `$scope.items = []`. The collection contains objects which have two properties- `title` and `selected`.

The `selected` flag keeps track of whether or not a certain item is selected.

That's it for the controller.

Now, let's move on to our `multiChecker` directive.


#### Directive

In our directive, we are two-way binding the `items` to our isolate scope. This is done for a specific reason. 

Two-way binding the items allow our view to update the state of our `multi-checker` control. Plus, it also allows our `multi-checker` control to update the selected state of each item.

Our new `multi-checker` directive template will look something like this:


{% highlight javascript %}
<div class="btn-group" dropdown is-open="status.isopen">
    <button type="button" class="btn btn-default">
          <i class="fa fa-square" ng-if="option == 'all'" ng-click="selectNone()"></i>
          <i class="fa fa-minus-square-o" ng-if="option == 'some'" ng-click="selectNone()"></i>
          <i class="fa fa-square-o" ng-if="option == 'none'" ng-click="selectAll()"></i>
          
          <i class="fa fa-chevron-down dropdown-toggle"></i>
    </button>

     <ul class="dropdown-menu">
        <li role="menuitem"><a href ng-click="selectAll()">All</a></li>
        <li role="menuitem"><a href ng-click="selectNone()">None</a></li>
    </ul>      
</div>
{% endhighlight %}


I am using [angular bootstrap's](https://angular-ui.github.io/bootstrap/) dropdown control. Two options under the dropdown are 'All' and 'None' which selects all the items and un-selects them, respectively.

I have used three [font-awesome icons](http://fontawesome.io/icons/) to show three different states of our control.

1. All the items are checked - `fa-square`
2. Some of the items are checked - `fa-minus-square-o`
3. None of the items are checked - `fa-square-o`

In fact, those icons are button themselves. So, you can click those items to toggle between the states.

Now let's go to the core logic of this directive.

Just a side note: I am using [lodash library](https://lodash.com/) to do all the utility tasks. If you are not familiar with `lodash`, please visit my post on [5 very powerful lodash function you should know](http://ngninja.com/posts/powerful-lodash-functions-javascript) to see its awesomeness.

The below function unselects all of the `items`. I am traversing through each item and setting its `selected` property to null. Which changes the state of our `multi-checker` control as well as the list.


{% highlight javascript %}
function selectNone(){
    _.forEach($scope.items, function(item){
      item.selected = null;
    });

    $scope.option = 'none';
}
{% endhighlight %}


The below function selects all of the items. Similar to our `selectNone()` method, I am traversing each item and setting its `selected` property to `true`.


{% highlight javascript %}
function selectAll(){
    _.forEach($scope.items, function(item){
          item.selected = true;
    });

    $scope.option = 'all';
}
{% endhighlight %}


The above two functions took care of the behavior of our directive.

But, what if the user checks or unchecks the items themselves by clicking on the checkbox? Our `multi-checker` control needs to keep track of these updates as well.


#### Watch

To do this we keep a watch on our collection.


{% highlight javascript %}
$scope.$watch('items', onItemsChanged, true);
{% endhighlight %}


The `true` flag in our collection keeps a deep watch on the collection. Which means, it will get fired not only when an item is added or removed from the collection, but also when a property of some item is changed.

By the way, if you haven't checked out our post on [watching the variables in AngularJS](http://localhost:4000/posts/watch-controller-properties-in-angularjs), this is a good time for that.

So, whenever the `selected` state of any of our item changes, this watcher will be fired.

Now, let's see the logic in our watcher function `onItemsChanged()`.


{% highlight javascript %}
function onItemsChanged(){
        
    if(!$scope.items || !$scope.items.length){
      return;
    }

    var filter = _.filter($scope.items, function(item){
      return item.selected;
    });

    if(!filter || !filter.length){
      $scope.option = 'none';
    }
    else if(filter.length == $scope.items.length){
      $scope.option = 'all';
    }
    else {
      $scope.option = 'some';
    }
}
{% endhighlight %}


Firstly, we don't care when there are no items. So we just return.

But, if we have items we first filter the `selected` items and then check the length of this filtered collection. 

If there are no such filtered items, it means none of the items is selected. So we set the state of our `multi-checker` control to `none`.

If the length of the filtered collection matches the length of our items-collection, it means all of the items are checked. So, we set the state of our `multi-checker` control to `all`.

And if the length is somewhere in between zero to all, it means only some of items are checked. So, we set the state of our `multi-checker` control to `some`.

That's it. This is how we keep track of all the three state. And in our directive, we also know which items are actually selected and which are not.

So, you can leverage this directive to perform any task you desire. Just like Google does. You can mark items are as `read` and `un-read`. You can move the selected items to a certain folder. And lots more.

### Summary:
This was a super simple implementation of Gmail-like multi-checker/multi-select control in AngularJS and UI-Bootstrap. 

We learned how to create a wrapper component. You can leverage that component to perform any task you that might like. You can select all, some or none of of the items using the dropdown or the list itself.

If you want to get started with Kendo UI or want to learn how to customize them, [here is something interesting for you](http://ngninja.com/posts/kendo-multi-select-widget).

Please let me know if you need more clarification on any part of the implementation. Also, do suggest how we can improve this control to do some awesome things.


#### Further Resources We Recommend

- [Pro AngularJS (Expert's Voice in Web Development)](https://amzn.to/3csc4EM)
- [You Don't Know JS: Up & Going](https://amzn.to/2uSZayI)