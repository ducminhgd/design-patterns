---
Group: Creational design patterns
Complexity: ★★☆
Popularity: ★★★
---
# Abstract factory

Abstract Factory is a creational design pattern, which solves the problem of creating entire product families without specifying their concrete classes.

Abstract Factory defines an interface for creating all distinct products but leaves the actual product creation to concrete factory classes. Each factory type corresponds to a certain product variety.

**Complexity:** ★★☆

**Popularity:** ★★★

## Pros and Cons

|                                                               Pros                                                                |                                                                   Cons                                                                   |
| --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| You can be sure that the products you’re getting from a factory are compatible with each other.                                   | The code may become more complicated than it should be, since a lot of new interfaces and classes are introduced along with the pattern. |
| You avoid tight coupling between concrete products and client code.                                                               |                                                                                                                                          |
| __Single Responsibility Principle__. You can extract the product creation code into one place, making the code easier to support. |                                                                                                                                          |
| __Open/Closed Principle__. You can introduce new variants of products without breaking existing client code.                      |                                                                                                                                          |

## Python

The client code calls the creation methods of a factory object instead of creating products directly with a constructor call (`new` operator). Since a factory corresponds to a single product variant, all its products will be compatible.

Client code works with factories and products only through their abstract interfaces. This lets the client code work with any product variants, created by the factory object. You just create a new concrete factory class and pass it to the client code.

**Usage examples:** The Abstract Factory pattern is pretty common in Python code. Many frameworks and libraries use it to provide a way to extend and customize their standard components.

**Identification:** The pattern is easy to recognize by methods, which return a factory object. Then, the factory is used for creating specific sub-components.