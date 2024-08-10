---
Group: Creational design patterns
Complexity: ★☆☆
Popularity: ★★★
---
# Factory method

Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

## Structure

![](../media/factory_method.png)

1. The **Product** declares the interface, which is common to all objects that can be produced by the creator and its subclasses.
2. **Concrete Products** are different implementations of the product interface.
3. The **Creator** class declares the factory method that returns new product objects. It’s important that the return type of this method matches the product interface. You can declare the factory method as abstract to force all subclasses to implement their own versions of the method. As an alternative, the base factory method can return some default product type.
   
    > Note, despite its name, product creation is not the primary responsibility of the creator. Usually, the creator class already has some core business logic related to products. The factory method helps to decouple this logic from the concrete product classes. Here is an analogy: a large software development company can have a training department for programmers. However, the primary function of the company as a whole is still writing code, not producing programmers.

4. Concrete Creators override the base factory method so it returns a different type of product.
    
    > Note that the factory method doesn’t have to create new instances all the time. It can also return existing objects from a cache, an object pool, or another source.

## Applicability

1. **Use the Factory Method when you don’t know beforehand the exact types and dependencies of the objects your code should work with.**

    The Factory Method separates product construction code from the code that actually uses the product. Therefore it’s easier to extend the product construction code independently from the rest of the code.

    For example, to add a new product type to the app, you’ll only need to create a new creator subclass and override the factory method in it.

2. **Use the Factory Method when you want to provide users of your library or framework with a way to extend its internal components.**

    Inheritance is probably the easiest way to extend the default behavior of a library or framework. But how would the framework recognize that your subclass should be used instead of a standard component?

    The solution is to reduce the code that constructs components across the framework into a single factory method and let anyone override this method in addition to extending the component itself.

    Let’s see how that would work. Imagine that you write an app using an open source UI framework. Your app should have round buttons, but the framework only provides square ones. You extend the standard `Button` class with a glorious `RoundButton` subclass. But now you need to tell the main `UIFramework` class to use the new button subclass instead of a default one.

    To achieve this, you create a subclass `UIWithRoundButtons` from a base framework class and override its `createButton` method. While this method returns `Button` objects in the base class, you make your subclass return `RoundButton` objects. Now use the `UIWithRoundButtons` class instead of `UIFramework`. And that’s about it!

3. **Use the Factory Method when you want to save system resources by reusing existing objects instead of rebuilding them each time.**

    You often experience this need when dealing with large, resource-intensive objects such as database connections, file systems, and network resources.

    Let’s think about what has to be done to reuse an existing object:

    1. First, you need to create some storage to keep track of all of the created objects.
    1. When someone requests an object, the program should look for a free object inside that pool.
    1. … and then return it to the client code.
    1. If there are no free objects, the program should create a new one (and add it to the pool).
    
    That’s a lot of code! And it must all be put into a single place so that you don’t pollute the program with duplicate code.

    Probably the most obvious and convenient place where this code could be placed is the constructor of the class whose objects we’re trying to reuse. However, a constructor must always return new objects by definition. It can’t return existing instances.

    Therefore, you need to have a regular method capable of creating new objects as well as reusing existing ones. That sounds very much like a factory method.

## Pros and Cons

| Pros                                                                                                                                        | Cons                                                                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| You avoid tight coupling between the creator and the concrete products.                                                                     | The code may become more complicated since you need to introduce a lot of new subclasses to implement the pattern. The best case scenario is when you’re introducing the pattern into an existing hierarchy of creator classes. |
| _Single Responsibility Principle_. You can move the product creation code into one place in the program, making the code easier to support. |                                                                                                                                                                                                                                 |
| _Open/Closed Principle_. You can introduce new types of products into the program without breaking existing client code.                    |                                                                                                                                                                                                                                 |


**Complexity:** ★☆☆

**Popularity:** ★★★