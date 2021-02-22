import Foundation

//MARK:- LIFO 

struct Stack<T: Equatable>: Equatable  {
    private var typeArr = [T]()
    
    public var peek: T? {
        return typeArr.last
    }
    public mutating func push(item: T) {
        typeArr.append(item)
    }
    public mutating func pop() -> T? {
        guard !typeArr.isEmpty else {
            return nil
        }
        return typeArr.removeLast()
    }
    var isEmpty: Bool {
        return typeArr.isEmpty
    }
    
    var contains: Bool {
        return typeArr.contains(T.self as! T)
    }
}

var stack = Stack<Int>()
stack.push(item: -100)
stack.push(item: -10)
stack.push(item: -20)
stack.push(item: 5)

print("Original:\(stack)")

var stack2 = Stack<Int>()
stack2.push(item: -100)
stack2.push(item: -10)
stack2.push(item: -20)
stack2.push(item: 5)

//Problem One:
//Find the largest integer in a Stack of Ints
func largestElement(in stack: Stack<Int>) -> Int {
    guard !stack.isEmpty else { return -10000 }
    
    var stackCopy = stack
    
    guard var largestInt = stackCopy.pop() else {return -10000}
    
    while !stackCopy.isEmpty {
        guard let currentElement = stackCopy.pop() else {return -1000}
        if currentElement > largestInt {
            largestInt = currentElement
        }
    }
    return largestInt
}

largestElement(in: stack)

//Problem Two:
//Find the sum of a Stack of Ints
func sum(stack: Stack<Int>) -> Int {
    guard !stack.isEmpty else {return -10000}
    
    var stackCopy = stack
    
    var allSum = 0
    
    while !stackCopy.isEmpty {
        guard let currentElemet = stackCopy.pop() else {return -10000}
        allSum += currentElemet
    }
    return allSum
}

sum(stack: stack)

//Problem Three:
//Reverse a Stack without using an Array
func reverse<T>(stack: Stack<T>) -> Stack<T> {
    var reverseStack = Stack<T>()
    let emptyStack = Stack<T>()
    var stackCopy = stack
    
    while !stackCopy.isEmpty {
        guard let currentElement = stackCopy.pop() else {return emptyStack}
        reverseStack.push(item: currentElement)
    }
    return reverseStack
}

print("Reverse: \(reverse(stack: stack))")

//Problem Four:
//Determine if two stacks are equal
func equalStacks<T: Equatable>(stackOne: Stack<T>, stackTwo: Stack<T>) -> Bool {
    var stack1 = stackOne
    var stack2 = stackTwo
    
    guard let stack1Element = stack1.pop() else {return false}
    guard let stack2Element = stack2.pop() else {return false}
    
    while !stack1.isEmpty && !stack2.isEmpty {
        if stack1Element == stack2Element {
            return true
        }
    }
    return false
}

equalStacks(stackOne: stack, stackTwo: stack2)

//Problem Five:
//Write a function that pushes a new element to the bottom of a Stack
func pushBottom<T>(stack: Stack<T>, newElement: T) -> Stack<T> {
    
    var answerStack = reverse(stack: stack)
    answerStack.push(item: newElement)
    
    return reverse(stack: answerStack)
}

print(pushBottom(stack: stack, newElement: 25))

// print in reverse
func printReverse<T: Equatable>(arr: [T]) {
    var stack = Stack<T>()
    
    for value in arr {
        stack.push(item: value)
    }
    
    while !stack.isEmpty {
        guard let currentElement = stack.pop() else {return}
        print(currentElement)
    }
}

printReverse(arr: [1,2,3])

func balancedParenthesis(phrase: String) -> Bool {
    var stack = Stack<Character>()
    
    for char in phrase {
        if char == "(" {
            print("pushed \(char)")
            stack.push(item: char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

balancedParenthesis(phrase: "((hello)")

func isPalindrome(sentence: String) -> Bool {
    
    var stack1 = Stack<String>()
    var stack2 = Stack<String>()
    
    for char in sentence.lowercased() {
        if char.isLetter {
            stack1.push(item: String(char))
        }
    }
    
    stack2 = reverse(stack: stack1)
    
    if equalStacks(stackOne: stack1, stackTwo: stack2) {
        return true
    } else {
        return false
    }
}

(isPalindrome(sentence: "A man, a plan, a canal: Panama"))


var array1 = [1,2,-3,10]
var last = array1.last
var last2 = array1.last
print(array1)


var num = 9
var numString = String(num)


struct Stack2 {
    var arr = [Int]()
    
    var peek: Int? {
        return arr.last
    }
    
    mutating func push(_ value: Int) {
        arr.append(value)
    }
    
    mutating func pop() -> Int {
        return arr.removeLast()
    }
}

var arr = [1,2,3]
