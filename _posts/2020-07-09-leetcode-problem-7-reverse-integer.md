---
layout: post
title: "LeetCode Problem 7. Reverse Integer"
description: "In this segment, I go through solving leetcode problems for my own practice. I walk through my thinking process so that we can all learn together."
tags: [algorithms, leetcode, programming, problem-solving]
og_image: "posts/leetcode.jpg"
---

{% include image.html path="posts/leetcode.jpg" path-detail="posts/leetcode.jpg" alt="LeetCode Problem" %}

## Problem

Given a 32-bit signed integer, reverse digits of an integer.

{% highlight javascript %}

Example 1:

Input: 123
Output: 321
Example 2:

Input: -123
Output: -321
Example 3:

Input: 120
Output: 21

{% endhighlight %}

Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function **returns 0 when the reversed integer overflows**.


## Solution


{% highlight javascript %}

var reverse = function(x) {
    
    var isNegative = false
    
    if(x < 0) {
       isNegative = true
       }
    
    const str = Math.abs(x).toString()

    
    if(str.length === 1) {
       return x
       }
    
    var revStr = ""
    const len = str.length
    for(var i = len - 1; i >= 0 ; i--) {
        revStr += str[i]
    } 
    
    const reverseNum = +revStr
    if (reverseNum > 0x7FFFFFFF) {
        return 0
    }
    
    return isNegative ? -reverseNum : reverseNum
    
};

{% endhighlight %}


## Explanation

The input is a signed integer

Max 32 bit signed integer is 
But more efficient is using constant - 0x7FFFFFFF

Can it be converted to string and then converted back to integer

I bet this has some easy solution using bit manipulation
But i hate bit manipulation

Let s go ahead with converting to string and back to integer
We can maintain the sign in a variable

If the number is single digit we can just return it

`Math.abs(x)` is important because we are maintaining the sign separately

`+revStr` is a cool trick to convert string back to integer

`str.reverse()` can make this much more cleaner. But, I like to write my own logic for reverse. It's better to do it this way in the interviews.


## Highlights

**Runtime:** 84 ms, faster than 75.52% of JavaScript online submissions for Reverse Integer.

**Memory Usage:** 37.7 MB, less than 14.63% of JavaScript online submissions for Reverse Integer.


### Disclaimer
This may not be the optimal solution. And that's okay. The purpose here is to practice problem solving and have fun with algorithms. I am constantly learning new optimized solutions for these problems.

Please comment below if you have a better solution. Let's learn algorithms and data structures together.


---

<br>

#### Further Resources We Recommend

- [You Don't Know JS: Up & Going](https://amzn.to/2uSZayI)

<br>

## Read Next

- [LeetCode Problem 80. Remove Duplicates from Sorted Array II](/posts/leetcode-problem-80-remove-duplicate-sorted-array-ii)
- [5 Common mistakes JavaScript developers make](/posts/steps-after-you-type-url-in-browser)
