---
layout: post
title: "LeetCode Problem 35. Search Insert Position"
description: "In this segment, I go through solving leetcode problems for my own practice. I walk through my thinking process so that we can all learn together."
tags: [algorithms, leetcode, programming, problem-solving]
og_image: "posts/leetcode.jpg"
---

{% include image.html path="posts/leetcode.jpg" path-detail="posts/leetcode.jpg" alt="LeetCode Problem" %}

## Problem

Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

{% highlight javascript %}

Example 1:

Input: [1,3,5,6], 5
Output: 2
Example 2:

Input: [1,3,5,6], 2
Output: 1
Example 3:

Input: [1,3,5,6], 7
Output: 4
Example 4:

Input: [1,3,5,6], 0
Output: 0

{% endhighlight %}


## Solution


{% highlight javascript %}

var searchInsert = function(nums, target) {
    
    let l = 0, h = nums.length-1;
    if(target < nums[l]){
       return l;
    }
    else if(target > nums[h]) {
        return h+1;
    }
    
    return binary(l, h)
    
    function binary(low, high) {
        const mid = Math.floor((high-low)/2 + low)
        
        if(target === nums[mid]) {
            return mid  
        }
        else if(target < nums[mid]) {
            if(target > nums[mid-1]) {
                return mid   
            }

            return binary(low, mid-1)
        }
        else if(target > nums[mid]) {
            if(target < nums[mid+1]) {
                return mid+1  
            }
            return binary(mid+1, high)
        }
    }
};

{% endhighlight %}


## Explanation

Okay so the array is sorted

We have to find out where the given number would be inserted

this sounds like a binary search problem

Well brute force algorithm would be the easiest
But it won't be efficient

Binary search would give us `logn` time

We can do some border cases before even starting our binary algorithm
ex: if target is less than first number from the array return 0
ex: if target is greater than last number from the array return `last index + 1`

I use this logic to get the `mid`

`const mid = Math.floor((high-low)/2 + low)`

### Ask questions like

Will the array contain negative numbers

Will there be duplicate the the array
What would be the result in case of duplicate numbers

How big would be the array
Will it fit in memory


## Sample test cases

```
[2,4,5,8,9]
3

[1,3,5,7]
1

[1,3,5,7]
0

[1,3,5,7]
8

[1,3,5,7]
6

```


## Highlights

**Runtime:** 92 ms, faster than 14.27% of JavaScript online submissions for Search Insert Position.

**Memory Usage:** 34 MB, less than 63.58% of JavaScript online submissions for Search Insert Position.


### Disclaimer
This may not be the optimal solution. And that's okay. The purpose here is to practice problem solving and have fun with algorithms. I am constantly learning new optimized solutions for these problems.

Please comment below if you have a better solution. Let's learn algorithms and data structures together.


---

<br>

#### Further Resources We Recommend

- [You Don't Know JS: Up & Going](https://amzn.to/2uSZayI)

<br>

## Read Next

- [Most Frequently Asked JavaScript Interview Questions](/posts/frequently-asked-javascript-interview-questions)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
