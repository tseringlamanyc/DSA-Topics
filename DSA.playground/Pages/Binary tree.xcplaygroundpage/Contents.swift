import UIKit

/*
 BINARY TREE
 - Root node
 value <T>
 L child?
 R child?
 - Abstract data types
 */

// =======================
//   Breadth Traversals
// =======================
class BinaryTreeNode<T> {
    
    var value: T
    var lChild: BinaryTreeNode?
    var rChild: BinaryTreeNode?
    
    init(value: T) {
        self.value = value
    }
}

struct Queue<T> {
    
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
    
    // value type , not reference
    public mutating func enqueue(item: T) {
        // adds an element to the back
        elements.append(item)
    }
    
    public mutating func deque() -> T? {
        guard !elements.isEmpty else {return nil}
        return elements.removeFirst()
    }
}

extension BinaryTreeNode {
    func breadthTraversal(visit: (BinaryTreeNode) -> ()) {
        
        var queue = Queue<BinaryTreeNode>()
        visit(self) // root node , capturing
        queue.enqueue(item: self) // adding the root to the queue
        
        while let node = queue.deque() {
            
            // check for left and enqueue as needed
            if let leftChild = node.lChild {
                visit(leftChild)
                queue.enqueue(item: leftChild)
            }
            
            // check for right
            if let rightChild = node.rChild {
                visit(rightChild)
                queue.enqueue(item: rightChild)
            }
        }
    }
}

let rootNode1 = BinaryTreeNode<Int>(value: 1)
let rootNode2 = BinaryTreeNode<Int>(value: 2)
let rootNode3 = BinaryTreeNode<Int>(value: 3)
let rootNode4 = BinaryTreeNode<Int>(value: 4)
let rootNode5 = BinaryTreeNode<Int>(value: 5)
let rootNode6 = BinaryTreeNode<Int>(value: 6)
let rootNode7 = BinaryTreeNode<Int>(value: 7)

rootNode1.lChild = rootNode2
rootNode1.rChild = rootNode3
rootNode2.lChild = rootNode4
rootNode2.rChild = rootNode5
rootNode3.lChild = rootNode6
rootNode3.rChild = rootNode7

print("Breadth Traversal")

rootNode1.breadthTraversal { (node) in
    print(node.value, terminator: " ")
}

print()

// =======================
//   Depth Traversals
// =======================
/*
 3 ways to traverse
 - in order
 - pre order
 - post order
 */

extension BinaryTreeNode {
    // In order
    func inorderTraversal(visit: (BinaryTreeNode) -> ()) {
        lChild?.inorderTraversal(visit: visit)
        visit(self)
        rChild?.inorderTraversal(visit: visit)
    }
    
    // pre order
    func preorderTraversal(visit: (BinaryTreeNode) -> ()) {
        visit(self)
        lChild?.preorderTraversal(visit: visit)
        rChild?.preorderTraversal(visit: visit)
    }
    
    // post order
    func postOrder(visit: (BinaryTreeNode) -> ()) {
        lChild?.postOrder(visit: visit)
        rChild?.postOrder(visit: visit)
        visit(self)
    }
}
print()

print("In order")
rootNode1.inorderTraversal { (node) in
    print(node.value, terminator: " ")
}

print()


print("Pre order")
rootNode1.preorderTraversal { (node) in
    print(node.value, terminator: " ")
}

print()

print("Post order")
rootNode1.postOrder { (node) in
    print(node.value, terminator: " ")
}
