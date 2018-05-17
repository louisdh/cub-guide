<center><img src="img/logo@2x.png"/></center>

<center><h1>The Cub Programming Language</h1></center>
<center><p style="margin-bottom: 4rem"><em>by Louis D'hauwe</em></p></center>

## Table of Contents
1. [Intro](#Intro)
2. [Features](#Features)
	1. [Variables](#Features.Variables)
	2. [Types](#Features.Types)
		1. [Number](#Features.Types.Number)
		2. [Boolean](#Features.Types.Boolean)
		3. [String](#Features.Types.String)
		4. [Array](#Features.Types.Array)
		5. [Struct](#Features.Types.Struct)
	3. [Conditional statements](#Features.ConditionalStatements)
	4. [Loops](#Features.Loops)
		1. [For loop](#Features.Loops.For)
		2. [While loop](#Features.Loops.While)
		3. [Do times loop](#Features.Loops.DoTimes)
		4. [Repeat while loop](#Features.Loops.RepeatWhile)
		5. [Continue](#Features.Loops.Continue)
		6. [Break](#Features.Loops.Break)
	5. [Functions](#Features.Functions)
	6. [Unicode support](#Features.Unicode)

<a name="Intro"></a>
## Intro
Cub is a scripting language with a lightweight syntax. It was inspired by Swift. Cub is easy to learn and fast to write. This document guides you through all the language features of Cub and is suitable for people with little programming experience.

A Cub script can be as simple as:

```cub
print("Hello world")
```

<a name="Features"></a>
## Features 

<a name="Features.Variables"></a>
### Variables 

A variable can be declared in the following way:

```cub
myVariable = 42
```

A variable can change its value at any time:

```cub
myVariable = 42
myVariable = 10
```

Values are copied on assignment:

```cub
a = 10
b = a
a += 1
// a is now 11
// b is still 10
```

<a name="Features.Types"></a>
### Types
Cub is a dynamic language. This means that variables don't have a fixed type. A variable can change its type at any time:

```cub
myVariable = 42
myVariable = "awesome!" // this overrides the value from the previous line
```

<a name="Features.Types.Number"></a>
#### Number
All numbers in Cub are floating point.

```cub
myNumber = 3.14
```

Numbers can be negative:

```cub
a = -10
```

The following operators are supported:

```cub
a = 1 + 2 // 3
b = 2 - 1 // 1
c = 2 * 2 // 4
d = 1 / 2 // 0.5
e = 2 ^ 3 // = 2 * 2 * 2 = 8
```

<a name="Features.Types.Boolean"></a>
#### Boolean
A boolean value can be obtained using a literal:

```cub
isAwesome = true
doEvil = false
```

as well as using a condition:

```cub
myNumber = 10

isLargeNumber = myNumber > 5 // evaluates to true
```

Cub supports the following comparison operators:

```cub
myNumber = 10

isLargerThan10 = myNumber > 10
isLargerThanOrEqual10 = myNumber >= 10
isSmallThan10 = myNumber < 10
isSmallThanOrEqual10 = myNumber <= 10
is10 = myNumber == 10
isNot10 = myNumber != 10
```

Cub supports three bitwise operators:

1. The and operator (`&&`) results to true if both boolean values are true:

```cub
and = true && false // equals false
and = true && true // equals true
```

This is very useful when combined with variables and statements:

```cub
isDragon = true
isGreen = true

if isDragon && isGreen {
	// A green dragon 
}
```

2. The or operator (`||`) results to true if at least one of the boolean values is true:

```cub
isDragon = true
isGreen = false

if isDragon || isGreen {
	// is a dragon, or is green, or both
}
```

3. The not operator (`!`) negates a boolean value:

```cub
myNumber = 10

isLargeNumber = myNumber > 5 // evaluates to true
isSmallNumber = !isLargeNumber  // evaluates to false
```

<a name="Features.Types.String"></a>
#### String
Strings are defined using quotes:

```cub
message = "Hello world!"
```

Strings can be concatenated:

```cub
name = "Steve"
message = "Hello " + name // "Hello Steve"
```

<a name="Features.Types.Array"></a>
#### Array
An array is defined using square brackets:

```cub
favoriteNumbers = [2, 4, 8]
```

Arrays can contain different value types:

```cub
thingsILove = [3.14, "pie", true]
```

Arrays can also contain other arrays:

```cub
square = [[1, 2], [3, 4]]
```

Variables can be used in arrays like any other value:

```cub
favoriteColor = "red"

favorites = [favoriteColor, 3.14]
```

A value can be added to an array using the add operator:

```cub
thingsILove = [3.14, "pie"]
thingsILove += "Cub" // thingsILove now equals [3.14, "pie", "Cub"]
```

Adding two arrays results in one array:

```cub
thingsILove = [3.14, "pie"]
thingsILove += ["Cub", "OpenTerm"] 
// thingsILove now equals [3.14, "pie", "Cub", "OpenTerm"]
```

A value can also be added to the front of an array:

```cub
favoriteColor = "red"
thingsILove = [3.14, "pie"]
thingsILove = favoriteColor + thingsILove
// thingsILove now equals ["red", 3.14, "pie"]
```

Accessing a value from an array is possible using a subscript:

```cub
thingsILove = [3.14, "pie"]
firstThingILove = thingsILove[0] // arrays start counting from 0
```

Trying to access a value at an invalid index results in a runtime crash:

```cub
thingsILove = [3.14, "pie"]
thirdThingILove = thingsILove[2] // script will abort
```

You can loop over all the values in an array:

```cub
numbers = [1, 2, 3]
for number in numbers {
    // do something
}
```

<a name="Features.Types.Struct"></a>
#### Struct
A struct is a special value that contains other values. You define a struct like this:

```cub
struct Point {
    x, y
}
```

You can create an instance of a struct by using the struct's name:

```cub
myPoint = Point(2, 4)
```

You access a value in a struct using the name of that member:

```cub
myPoint = Point(2, 4)

x = myPoint.x
```

Structs can contain any value, including other structs:

```cub
struct Point {
    x, y
}

struct Size {
    width, height
}

struct Rect {
    origin, size
}

rect = Rect(Point(0, 0), Size(2, 4))
```

The value of a struct can be edited by assigning to one of its members:

```cub
myPoint = Point(2, 4)

myPoint.x = 3

// myPoint now equals (3, 4)
```

<a name="Features.ConditionalStatements"></a>
### Conditional statements
Cub supports if statements:

```cub
myNumber = 42

if myNumber > 10 {
    // do something
}
```

If statements can be followed by an else statement:

```cub
myNumber = 42

if myNumber > 40 {
    // do something
} else {
    // do something else
}
```

If statements can also be followed by an else-if statement:

```cub
myNumber = 42

if myNumber > 40 {
    // do something
} else if myNumber > 30 {
    // do something else
}
```

An if statement can have an unlimited number of subsequent else-if statement:

```cub
myNumber = 42

if myNumber > 40 {
    // do something
} else if myNumber > 30 {
    // do something else
} else if myNumber > 20 {
    // do something else
} else if myNumber > 10 {
    // do something else
}
```

An else statement, if present, must be the last statement in an if statement:

```cub
myNumber = 42

if myNumber > 40 {
    // do something
} else if myNumber > 30 {
    // do something else
} else if myNumber > 20 {
    // do something else
} else if myNumber > 10 {
    // do something else
} else {
    // fallback
}
```

<a name="Features.Loops"></a>
### Loops
Since Cub is a scripting language, loops are an essential part.

<a name="Features.Loops.For"></a>
#### For loop

A for loop executes its body using an iterator variable:

```cub
numbers = []

for i = 1, i<=10, i += 1 {
	numbers += i
}

// numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

<a name="Features.Loops.While"></a>
#### While loop

A while loop executes its body until its condition is false:

```cub
a = 10
i = 0
while a > 2 {
	a -= 2
	i += 1
}

// a now equals 2
// i now equals 4
```

<a name="Features.Loops.DoTimes"></a>
#### Do times loop

A do times loop executes its body a fixed number of times:

```cub
do 10 times {
    // this will be executed 10 times
}
```

You can also pass a variable:

```cub
n = 10
do n times {
    // this will be executed n times
}
```

<a name="Features.Loops.RepeatWhile"></a>
#### Repeat while loop

A repeat while loop executes its body at least once, until its condition is false:

```cub
i = 10

repeat {

	i *= 2

} while i < 5

// i now equals 20
```

<a name="Features.Loops.Continue"></a>
#### Continue

You can use a `continue` statement to skip an iteration in a loop:

```cub
numbers = []

for i = 1, i<=10, i += 1 {
	
	if i == 2 {
		continue
	}    

	numbers += i
}

// numbers = [1, 3, 4, 5, 6, 7, 8, 9, 10]
```

<a name="Features.Loops.Break"></a>
#### Break

You can use a `break` statement to exit a loop early:

```cub
numbers = []

for i = 1, i<=10, i += 1 {
	
	if i == 2 {
		break
	}    

	numbers += i
}

// numbers = [1]
```

<a name="Features.Functions"></a>
### Functions

Functions provide reusable pieces of code:

```cub
func doSomething() {
	// do something
}
```

A function can be called using its name:

```cub
doSomething()
```

A function can return a value: 

```cub
func getNumber() returns {
	return 10
}
```

A function can take arguments:

```cub
func sum(a, b) returns {
	return a + b
}

total = sum(2, 4) // total = 6

```

<a name="Features.Unicode"></a>
### Unicode support

Cub supports all unicode characters, including emoticons. You can even use emoticons as variable and function names:

```cub
func ∑(a, b) returns {
	return a + b
}

😀 = ∑(2, 4) // 😀 = 6
```
