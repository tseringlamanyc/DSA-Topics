import UIKit

struct Queue<T:Equatable>: Equatable {  // copy value type so use mutating
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    // add to back
    public mutating func enqueue(item: T) {
        elements.append(item)
    }
    
    // remove from the front
    public mutating func deque() -> T? {
        guard !isEmpty else {return nil}
        return elements.removeFirst()
    }
}

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
        return typeArr.count == 0
    }
}

var queue2 = Queue<Int>()
queue2.enqueue(item: 1)
queue2.enqueue(item: 2)
queue2.enqueue(item: -1)

print(queue2)

//1. Find the smallest element in a queue
func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var qCopy = q
    
    guard var currentElement = qCopy.peek else {return nil}
    
    while let value = qCopy.deque() {
        if value < currentElement {
            currentElement = value
        }
    }
    return currentElement
}

smallestElement(in: queue2)

//2. Find the sum of a queue of Ints
func sum(of q: Queue<Int>) -> Int {
    var qCopy = q
    var allSum = 0
    
    while let value = qCopy.deque() {
        allSum += value
    }
    return allSum
}

sum(of: queue2)


//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
 True example:   (Back) 9 - 6 - 2 - 1 (Front)
 False example   (Back) 4 - 19 - 1 - 20 (Front)
 False example   (Back) 4 - 19 - 134 - 200 (Front)
 */

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var qCopy = q
    guard var currentElement = qCopy.peek else {return false}
    
    while let value = qCopy.deque() {
        if value < currentElement {
            return false
        }
        currentElement = value
    }
    return true
}

var queue3 = Queue<Int>()
queue3.enqueue(item: 1)
queue3.enqueue(item: 2)
queue3.enqueue(item: 6)
queue3.enqueue(item: 9)

var queue4 = Queue<Int>()
queue4.enqueue(item: 1)
queue4.enqueue(item: 2)
queue4.enqueue(item: 6)
queue4.enqueue(item: 0)

isSorted(q: queue3)

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)
/*
 Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
 Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var qCopy = q
    var aStack = Stack<T>()
    var reversedQueue = Queue<T>()
    
    while let value = qCopy.deque() {
        aStack.push(item: value)
    }
    
    while !aStack.isEmpty {
        guard let currentElement = aStack.pop() else {return q}
        reversedQueue.enqueue(item: currentElement)
    }
    
    return reversedQueue
}

print("Original:\(queue3), Reversed:\(reversed(q: queue3))")

//5 Determine if two Queues are equal
func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var q1 = qOne
    var q2 = qTwo
    
    while !q1.isEmpty && !q2.isEmpty {
        guard let value1 = q1.deque(), let value2 = q2.deque() else {return false}
        if value1 != value2 {
            return false
        }
    }
    return true
}

areEqual(qOne: queue3, qTwo: queue4)

