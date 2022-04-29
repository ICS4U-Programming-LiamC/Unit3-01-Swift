import Foundation

public class MyStackInt {
  
  private var stack = [Int]()
  
  init() {
    stack = []
  }  

  public func push(n: Int) {
    stack.append(n)
  }
  
  public func stack_push(i: Int, n: Int) {
    for _ in 0..<i {
      stack.append(n)
    }
  }

  public func stack_push_range(i: Int, n: Int) {
    if ((n - i) > 0) {
      for each in i..<n {
        stack.append(each)
      }
    } else {
      for each in n..<i {
        stack.append(each)
      }
    }
  }

  public func pop() -> Int {
    return stack.removeLast()  
  }

  public func stack_pop(i: Int) {
    for _ in 0..<i {
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

  public func stack_search(element: Int) {
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

  public func stack_view_all() {
    print(stack)
  }
  
}


/////////////////////// ACTUAL CODE /////////////////////


// main function
func main() {
  // create the object
  let test = MyStackInt()

  // view the empty stack
  test.stack_view_all()

  // push 10, 4, then 5 2's
  test.push(n: 10)
  test.push(n: 4)
  test.stack_push(i: 5, n: 2)
  test.stack_view_all()

  // remove the top 2
  print(test.pop())

  // empty the stack then view again
  test.stack_view_all()
  test.stack_empty()
  test.stack_view_all()
  
}

main()
