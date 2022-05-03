//
//  MyStackInt.swift
//
//  Created by Liam Csiffary
//  Created on 2022-04-29
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  The MyStackInt program defines a stack to be used in main
//  has various useful methods, all are variations of pop, peek, and push

import Foundation

public class MyStackInt {
  
  private var stack = [Int]()
  
  init() {
    stack = []
  }  

  public func push(_ n: Int) {
    stack.append(n)
  }
  
  public func stack_push(_ n: Int, _ i: Int) {
    for _ in 0..<i {
      stack.append(n)
    }
  }

  public func stack_push_range(_ n: Int, _ i: Int) {
    if ((i - n) > 0) {
      for each in n..<i {
        stack.append(each)
      }
    } else {
      for each in i..<n {
        stack.append(each)
      }
    }
  }

  public func pop() -> Int {
    return stack.removeLast()  
  }

  public func stack_pop(_ n: Int) {
    for _ in 0..<n {
      stack.removeLast()
    }
  }

  public func stack_empty() {
    let length = stack.count
    for _ in 0..<length {
      stack.removeLast()
    }
  }

  public func peek() -> Int? {
    return stack.last
  }

  public func search(_ element: Int) {
    var found = false
    for (i, each) in stack.enumerated() {
      if (each == element) {
        print(each, "appears at", i)
        found = true
      }
    }
    if (!found) {
      print(element, "did not appear")
    }
  }

  public func clear() {
    stack = [Int]()
  }

  public func view_all() {
    print(stack)
  }

  public func length() -> Int {
    return (stack.count)
  }
  
}


/////////////////////// ACTUAL CODE /////////////////////

//
//  main.swift
//
//  Created by Liam Csiffary
//  Created on 2022-04-29
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  The main.swift program creates and tests the object from the MyStackInt class


// main function
func main() {
  // create the object
  let stack = MyStackInt()
  var show = true
  var userInputString = ""
  var tempInputI = ""
  var tempInputN = ""
  var tempInputIntI = 0.0
  var tempInputIntN = 0.0

  print("Type 'help' to show list of commands")
  while (true) {
    if (show == true) {
      print("What opperation would you like to perform: ")
    }

    userInputString = readLine()!

    if (userInputString == "exit") {
      break
      
    } else if (userInputString == "help" || userInputString == "'help'") {
      print("exit: exits the program.")
      print("display/show: disables/enables the operation asking text.")
      print("push: pushes an integer to the top of the stack.")
      print("stack_push: gets 2 inputs, n integer pushed i times.")
      print("stack_push_range: gets 2 inputs, pushes all integers from n->i.")
      print("pop: removes and returns the top element of the stack.")
      print("stack_pop: removes the top element of the stack n times.")
      print("clear: empties the stack.")
      print("peek: looks at, and returns the top element of the stack.")
      print("search: searches for a given integer, returns the first")
      print("index where that element was found, searches from top->bottom.")
      print("Returns -1 if element was not found.")
      print("view_all: prints all elements in the stack.")

      // turns the "What opperation would you like to perform next" on/off
    } else if (userInputString == "display" || userInputString == "show") {
      if (show == true) {
        show = false
      } else {
        show = true
      }

      // push function, error checking for decimals
    } else if (userInputString == "push") {
      print("Please input an integer to push")
      while (true) {
        tempInputN = readLine()!

        tempInputIntN = Double(tempInputN) ?? 1.5

        if (tempInputIntN.truncatingRemainder(dividingBy: 1) != 0) {
          print("Please input a valid integer")
        } else {
          stack.push(Int(tempInputIntN))
          break
        }
      }

      // stack_push, pushes n, i times
      // makes sure both are integers
      // and that I is positive/0
    } else if (userInputString == "stack_push") {
      while (true) {
        print("Please input an integer to push and how many times to push it")
        tempInputN = readLine()!
        tempInputI = readLine()!

        tempInputIntN = Double(tempInputN) ?? 1.5
        tempInputIntI = Double(tempInputI) ?? 1.5

        if (tempInputIntN.truncatingRemainder(dividingBy: 1) != 0 || tempInputIntI.truncatingRemainder(dividingBy: 1) != 0) {
          print("Both inputs must be integers")
        } else {

          if (tempInputIntI < 0) {
            print("You can not push a number < 0 times")
          } else {
            stack.stack_push(Int(tempInputIntN), Int(tempInputIntI))
            break
          }
        }
      }

      // pushes from i->n
      // checks to make sure both are integers
    } else if (userInputString == "stack_push_range") {
      while (true) {
        print("Please input integers, n and i. Will push from n -> (i-1)")
        tempInputN = readLine()!
        tempInputI = readLine()!

        tempInputIntN = Double(tempInputN) ?? 1.5
        tempInputIntI = Double(tempInputI) ?? 1.5

        if (tempInputIntN.truncatingRemainder(dividingBy: 1) == 0 || tempInputIntI.truncatingRemainder(dividingBy: 1) == 0) {
          stack.stack_push_range(Int(tempInputIntN), Int(tempInputIntI))
          break
        }
      }

      // pops the top of the stack
      // makes sure the stack isn't empty
    } else if (userInputString == "pop") {
      print("Popped ", stack.pop(), "from stack")

      // pops n number of elements from the top
      // makes sure input is an integer and positive/0
      // also makes sure the stack isn't empty
    } else if (userInputString == "stack_pop") {
      while (true) {
        print("Please input the number of elements to pop")
        tempInputN = readLine()!
        tempInputIntN = Double(tempInputN) ?? -1.5
        if (tempInputIntN < 0) {
          print("Please input a positive number")
        } else {
          if (stack.length < tempInputIntN) {
            print("That number is bigger than the number of elements in the stack")
          } else {
            break
          }
        }
      }
      stack.stack_pop(Int(tempInputIntN))

      // clears the stack
    } else if (userInputString == "clear") {
      stack.clear()

      // peeks the top of the stack
    } else if (userInputString == "peek") {
      print(stack.peek(), "is at the top of the stack")

      // searches ther stack for a given input
      // makes sure the users input is an integer
    } else if (userInputString == "search") {
      while (true) {
        print("Please input an integer to search for")
        tempInputN = readLine()!
        tempInputIntN = Double(tempInputN) ?? 1.5

        if (tempInputIntN.truncatingRemainder(dividingBy: 1) != 0) {
          print("Input must be an integer")
        } else {
          stack.search(Int(tempInputIntN))
          break
        }
      }

      // prints all elements of the stack
    } else if (userInputString == "view_all") {
      stack.view_all()

      // if the user didn't select a valid option
    } else {
      print(userInputString, "was not a valid input")
      print("Try 'help' for a list of all commands")
    }
  }
}

main()
