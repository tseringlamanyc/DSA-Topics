import UIKit

// NODE
class Node<T: Equatable>: Equatable {
    // required function
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value && lhs.nextValue == rhs.nextValue
    }
    
    var value: T
    var nextValue: Node?  // default value of nil ,, Singly
    init(value: T) {
        self.value = value
    }
}

// Custom String convertible
extension Node: CustomStringConvertible {
    var description: String {
        // checking for nextvalue (one node)
        guard let next = nextValue else {
            return "\(value) -> nil" // 12 -> nil
        }
        
        // more than one node
        return "\(value) -> \(next)"
    }
}

let train12 = Node<Int>(value: 12)
let train99 = Node<Int>(value: 99)
let train10 = Node<Int>(value: 10)
let train19 = Node<Int>(value: 19)

// connect the nodes
train12.nextValue = train99
train99.nextValue = train10
train10.nextValue = train19
print(train12)

// Linked list
class Linkedlist<T: Equatable> {
    var head: Node<T>? // nil
    var tail: Node<T>? // nil
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    // last comouted property
    public var last: Node<T>? {
        return tail
    }
    
    // isEmpty
    public var isEmpty: Bool {
        return head == nil
    }
    // append - adds node to the end of the list
    public func append(value: T) {
        let newNode = Node(value: value)
        
        // type 1 - appending to empty list
        guard let lastNode = tail else {
            head = newNode
            tail = head
            return
        }
        
        // type 2 - exsisting node
        lastNode.nextValue = newNode
        tail = newNode
    }
    
    // removeLast method - removes last node from the end
    public func removeLast() -> Node<T>? {
        
        // type 1 - empty list
        if isEmpty {
            return nil
        }
        
        // type 2 - one node
        var removedNode: Node<T>?
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        
        // type 3 (multiple nodes)
        var currentNode = head
        
        // looping
        while currentNode?.nextValue != tail { // secondlast value
            currentNode = currentNode?.nextValue
        }
        
        removedNode = tail // save tail value
        tail = currentNode // set tail to second to last node
        currentNode?.nextValue = nil
        
        return removedNode
    }
    
    var count: Int {
        var totalCount = 0
        var currentNode = head
        
        while currentNode != nil {
            totalCount += 1
            print(currentNode?.value as Any)
            currentNode = currentNode?.nextValue
        }
        return totalCount
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else {return nil}
        var currentNode = head
        var counter = 0
        
        while counter < index {
            currentNode = currentNode?.nextValue
            counter += 1
        }
        
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        
        while currentNode != nil {
            if currentNode?.value == targetKey {
                return true
            } else {
                currentNode = currentNode?.nextValue
            }
        }
        return false
    }
    
    func equals(otherList: Linkedlist<T>) -> Bool {
        
        if isEmpty && otherList.isEmpty  {
            print("Both empty")
            return true
        }
        
        var currentNode = head
        var otherNode = otherList.head
        
        while currentNode != nil {
            if currentNode == otherNode {
                currentNode = currentNode?.nextValue
                otherNode = otherNode?.nextValue
            } else {
                return false
            }
        }
        
        return true
    }
    
    func toArr() -> [T] {return Array<T>()}
    
    func reversed() -> Linkedlist<T> {
        let reversedLL = Linkedlist<T>()
        
        var previousNode: Node<T>?
        
        var currentNode = head
        
        while currentNode != nil {

            let nextNode = currentNode?.nextValue // A -> B (B is nextValue)
            
            currentNode?.nextValue = previousNode  // nil <- A , initially
            
            previousNode = currentNode // nil becomes A
            currentNode = nextNode // A becomes B
        }
        
        reversedLL.head = previousNode
        return reversedLL
    }
    
    func removeAll() {
        head = nil
    }
    
    var middle: Node<T>? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.nextValue != nil {
            slow = slow?.nextValue
            fast = fast?.nextValue?.nextValue
        }
        
        return slow
    }
    
}

extension Linkedlist: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}

let list = Linkedlist<String>()
list.append(value: "A")
list.append(value: "B")
list.append(value: "C")

let list2 = Linkedlist<String>()
list2.append(value: "A")
list2.append(value: "B")
list2.append(value: "D")

print(list)
list.count

list.middle

print(list.reversed())

list.getNode(at: 2)

list.contains(element: "A")
list.contains(element: "X")

list.equals(otherList: list2)

list.reversed()

list.removeLast()
print(list)
