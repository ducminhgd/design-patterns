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

## Pros and Cons

|                                                                     Pros                                                                      |                                                                                                              Cons                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| You avoid tight coupling between the creator and the concrete products.                                                                       | The code may become more complicated since you need to introduce a lot of new subclasses to implement the pattern. The best case scenario is when you’re introducing the pattern into an existing hierarchy of creator classes. |
| __Single Responsibility Principle__. You can move the product creation code into one place in the program, making the code easier to support. |                                                                                                                                                                                                                                 |
| __Open/Closed Principle__. You can introduce new types of products into the program without breaking existing client code.                    |                                                                                                                                                                                                                                 |


**Complexity:** ★☆☆

**Popularity:** ★★★