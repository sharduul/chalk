---
layout: post
title: "What happens when you enter URL and hit enter in browser?"
description: "Super simple explanation of steps happening behind the scenes after you enter URL in a browser."
tags: [web, the-what-series, interview-questions]
---

{% include image.html path="posts/this.jpg" path-detail="posts/this.jpg" alt="Web" %}


This is a classic question asked in many job interviews, especially if you are interviewing for a position of a Web developer or a Network engineer. Even if you are not, one should have knowledge of what goes on behind the scenes when you type in a URL on the browser and hit enter.

So, let's dive into a very simplified explanation of behind the scene actions.

Suppose, you enter the following URL on the browser:

*http://ngninja.com/posts/javascript-closures-made-super-easy*

### tl;dr version:
1. Parse the URL
2. Check the cache and render the web page
3. If no record in the cache, contact OS for the IP address of the server.
4. OS responds with the IP address to the browser.
5. Socket is created, HTTP request is made.
6. Server processes the request and responds with the data accordingly.
7. Browser processes the response and renders it appropriately.

Now, lets see each step in details.


### 1. Parse the URL:

The browser first parses the above URL and finds out the following information:
1. Protocol: HTTP
2. Host: ngninja.com
3. Port: (not necessary in this case as the server is listening on the default HTTP port)
4. Path: /javascript-closures-made-super-easy


### 2. Check the cache:

Once the browser is finished parsing the above information, it checks its cache to see if any previous request was made to the same URL. If it finds such entry and that cache entry is not expired, it just decodes the response of that request and renders it appropriately (refer step #7).


### 3. Contact OS for the IP address of the server

If it does not find any such cache object, it checks with the OS of the system- if it has a cached copy of the IP address of the domain (ngninja.com).


### 4. OS responds with the IP address:

If the OS has the IP address- great! It just forwards it to the browser.

If the OS does not have the IP address, a request is made to the configured DNS server of your machine. 

*A DNS server is nothing but a database of network names and its IP addresses.*

If the requested DNS server knows the domain- you are at luck. If not, it calls another DNS server which is configured for deferring its requests. This process happens recursively until the domain is found, or until the request is timed out.

In case, no record of that domain is found- browser gives an error something like *Cannot find the server ngninja.com*.

But assuming the record is found, the OS gets the IP address from the DNS server, and it is then forwarded to the browser.


### 5. HTTP request is made:

The browser now has a valid IP address for the requested domain. The browser then gathers all the request data to be sent to the server. Then the browser sets up a TCP connection with the server with that IP address and sends the HTTP request to the server.

The request consists of metadata in the header of the request and optional data in its body.

A simple HTTP request will look something like this:

#### General information:
{% highlight javascript %}
Request URL: http://ngninja.com/posts/javascript-closures-made-super-easy
Request Method: GET
Status Code: 200 OK
{% endhighlight %}

#### Header content:
{% highlight javascript %}
Accept:text/html,application/xml
Accept-Language:en-US,en;q=0.8,hi;q=0.6,it;q=0.4
Connection:keep-alive
Host:www.cs.virginia.edu
{% endhighlight %}

For the sake of focusing on the main question in this article, I am skipping the explanation of above parameters. But, if you are curious about them here is a link to [Tutorials point](https://www.tutorialspoint.com/http/http_header_fields.htm), which has a very simple explanation about those fields.


### 6. Server responds:

After the server receives the request from the browser, it processes it and sends back a response to the browser. Type of the response depends on the request being made. The response may contain a JSON object, an  XML object, an image file, a video file, or something else.

Also, browsers are intelligent enough to decode errors sent by the servers. Based on the error's status codes it acts appropriately. For example, 200 status code means it's a successful request. 401 status code means the user is not authorized to make the request, and so on.


### 7. Browser renders:

In our case, the server will return an HTML page which is present on this path- http://ngninja.com/posts/javascript-closures-made-super-easy

Finally, when the browser receives the response, it renders that HTML page. And, if the response is cacheable, the browser stores it in the cache for future requests to the same path.


### Conclusion:
While the browser is rendering this web page it might discover that there are other things that needs to be requested to completely render this web page. They can be images, video clips, JSON data, or something else. So, browser will make additional requests to get this data following the same steps as discussed above and the complete web page will be displayed.

Above is the basic gist of what goes on behind the scenes whenever you enter any URL on the browser and wait for your web page to load.

The above steps are based upon some great answers to the same question on [Quora](https://www.quora.com/What-are-the-series-of-steps-that-happen-when-an-URL-is-requested-from-the-address-field-of-a-browser) and [StackOverflow](http://stackoverflow.com/questions/2092527/what-happens-when-you-type-in-a-url-in-browser).






