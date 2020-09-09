---
layout: post
title: "LeetCode Problem 26. Remove Duplicates from Sorted Array"
description: "In this segment, I go through solving leetcode problems for my own practice. I walk through my thinking process so that we can all learn together."
tags: [algorithms, leetcode, programming, problem-solving]
og_image: "posts/leetcode.jpg"
---

{% include image.html path="posts/leetcode.jpg" path-detail="posts/leetcode.jpg" alt="LeetCode Problem" %}

## Problem

Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

{% highlight javascript %}

Example 1:

Given nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the returned length.

{% endhighlight %}

{% highlight javascript %}

Example 2:

Given nums = [0,0,1,1,1,2,2,3,3,4],

Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

It doesn't matter what values are set beyond the returned length.

{% endhighlight %}

#### Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.

## Solution


{% highlight javascript %}

var removeDuplicates = function(nums) {
    
    if(nums.length < 2) {
       return nums.length
    }
    
    let p = 0
    
    for (let i = 1; i < nums.length; i++) {
        if(nums[p] === nums[i]) {
           continue
        }
        
        nums[p+1] = nums[i]
        p = p+1
    }
    
    return p+1
    
};


{% endhighlight %}


## Explanation

Interesting question

You have to return `length` of the new array. But, because the array itself is passed by reference the caller knows the new values.

Because we have to sort the array - time complexity would at least be `O(n)`

We can maintain two pointers
- p -> pointing to the last unique element
- i -> pointing to the current element being inspected

And finally return `p+1`


## Sample test cases

{% highlight javascript %}

[]
-> []

[1]
-> [1]

[1,1,2,2]
-> [1,2]

[1,2,3,3,3]
-> [1,2,3]

{% endhighlight %}


## Highlights

**Runtime:** 88 ms, faster than 82.84% of JavaScript online submissions for Remove Duplicates from Sorted Array.

**Memory Usage:** 39.5 MB, less than 19.88% of JavaScript online submissions for Remove Duplicates from Sorted Array.


### Disclaimer
This may not be the optimal solution. And that's okay. The purpose here is to practice problem solving and have fun with algorithms. I am constantly learning new optimized solutions for these problems.

Please comment below if you have a better solution. Let's learn algorithms and data structures together.


---


<br>

## Read Next

- [Most Frequently Asked JavaScript Interview Questions](/posts/frequently-asked-javascript-interview-questions)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
