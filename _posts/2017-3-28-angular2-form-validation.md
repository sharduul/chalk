---
layout: post
title: "Angular 2 Form Validation: How to fire form validation on blur?"
description: "Learn how to fire form validation on blur to give users a better user experience. Avoid flagging validation errors while users are style editing the form."
tags: [angularjs, angular2, the-how-series]
og_image: "posts/secure.jpg"
---

{% include image.html path="posts/secure.jpg" path-detail="posts/secure.jpg" alt="Angular2 Form Validation" %}


Every came across a situation where validation error is fired when a user is still typing on the form? Yeah. It is frustrating.

Although I think there should be an out of the box solution for this, currently there is none for Angular 2. 

## Update - November 11, 2017

Angular 5 has now added this functionality out of the box. You can [check out this link](https://blog.angular.io/version-5-0-0-of-angular-now-available-37e414935ced) to use the out of the box solution of validation and model update on blur.

But for people still working on Angular 2 projects- there is a workaround you could use. The solution is to fire validation error when use focus-out from the current field.

I know. It might not be the best solution. But it is at least a better user experience than getting interrupted by error messages when I am still on the field typing something.

So, let's see how we can fire validation errors on-blur in Angular 2. Basically, we want to leverage the "touch" property of form controls and use to decide whether or not to show the error message. 

Follow the [complete demo here](https://embed.plnkr.co/04anApG7LpPz6pTfCOHD/), for better understanding.

The first step is to create a directive which will handle "focus" and "focusout" event on a particular input field.

## Validation On Blur directive


{% highlight javascript %}
@Directive({
  selector: '[validateOnBlur]', 
})

export class MyDirective {
  @Input('validateFormControl') validateFormControl;

  constructor() { }

  @HostListener('focus', ['$event.target'])
    onFocus(target) {
    console.log("Focus called");
    
    this.validateFormControl.markAsUntouched();
    
    console.log(this.validateFormControl.touched);
    }

  @HostListener('focusout', ['$event.target'])
  onFocusout(target) {
    console.log("Focus out called");
    this.validateFormControl.markAsTouched();
  }

}
{% endhighlight %}

  
In the above code snippet, we are creating a directive called "MyDirective" with "[validateOnBlur]" as the selector. Which means, to use this directive declare "validateOnBlur" as an attribute on that element. Like this:

{% highlight html %}
<input name="date" type="text" validateOnBlur />
{% endhighlight %}


Next, we want to listen to the "focus" and "focusout" events on the "input" element. For this, we use ["@HostListener"](https://angular.io/docs/ts/latest/guide/attribute-directives.html) decorator. We will get into the implementation of these event handlers later.

So, that's the overview of our directive. Simple, isn't it?

Now, let's move on to our user form which I have implemented in "AppComponent" component.

## Usage of Validation on Blur directive


{% highlight html %}
<form class="login-form" [formGroup]="loginForm" novalidate (ngSubmit)="handleSubmit(loginForm.value, loginForm.valid)">
  <input name="date" type="text" formControlName="username" 
    validateOnBlur [validateFormControl]="loginForm.controls['username']">
  <p *ngIf="loginForm.controls['username'].touched && loginForm.controls['username'].dirty && loginForm.controls['username'].invalid">Invalid</p>
</form>
{% endhighlight %}


I am using "ReactiveFormsModule" module in this example. Please read this article on [Model Drive Forms](https://scotch.io/tutorials/using-angular-2s-model-driven-forms-with-formgroup-and-formcontrol) for better understanding.

The only element we want to focus here on is the "input" element:

{% highlight html %}
<input name="date" type="text" formControlName="username" 
    validateOnBlur [validateFormControl]="loginForm.controls['username']" >
{% endhighlight %}

    
You can see how I am using the "validateOnBlur" directive that I implemented above. The next attribute is "[validateFormControl]". It is actually a parameter I am passing to "validateOnBlur" directive. And the value of that parameter is the form-control object.

Doing this will let me use all the nice properties of that particular control. In this case, we are only interested in the "touched" property of that "input" control.

Now, going back to our directive, let's see how we can toggle this property.


{% highlight javascript %}
@HostListener('focus', ['$event.target'])
onFocus(target) {
  console.log("Focus called");
  this.validateFormControl.markAsUntouched();
}

@HostListener('focusout', ['$event.target'])
onFocusout(target) {
  console.log("Focus out called");
  this.validateFormControl.markAsTouched();
}
{% endhighlight %}


As you can see above, I am using "markAsTouched" and "markAsUntouched" functions on the form-control to toggle the "touched" property of that control. I am just marking it as "untouched" when I focus on the input control and then mark it as "touched" when I am leaving the control.

Now, why I am doing this?

To understand this, let's see the following snippet of our user form:

{% highlight html %}
<p *ngIf="loginForm.controls['username'].touched && loginForm.controls['username'].dirty && loginForm.controls['username'].invalid">Invalid</p>
{% endhighlight %}

The above "p" tag is the validation error I want to display when the field it invalid. But, notice the "ngIf" expression.

*I am displaying the error only when the field is dirty, it is invalid and most importantly when the using is NOT "touching" it. That is when the user is not still typing.*

I am handling the "touching" part in my "validateOnBlur" directive. I am setting the field to "untouched" when the user is still typing which hides the error message. And when the user has left the field I am setting that field to "touched". So now, if there are any validation errors those will be displayed on the field.


## Summary:
Above is the extensive explanation of a super simple directive to fire validation messages on-blur event. This should definitely make your users feel more comfortable while filling up the forms.

Please not that if you are using Angular 5 the same above functionality is now available inbuilt. [Check out this link](https://blog.angular.io/version-5-0-0-of-angular-now-available-37e414935ced) to see how you can use it.

Please let me know what you think about the solution. Also, shoot a reply if you have a better one.

