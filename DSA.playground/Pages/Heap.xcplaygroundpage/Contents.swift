import Foundation

/*
         2             [0]
       /    \
      8      21        [1,2]
     / \    /  \
    10  16  30   36    [3,4,5,6]
 
 level order: 2,8,21,10,16,30,36
*/

// Heap - is a tree data structure that is mainly used to create a min or max heap. Heap is traditiionally implemented using an array as opposed to a Binary tree that uses pointers to left and right children. The heap property is statisfied when for example in a min Heap the root is smaller than any of its children, in a max heap the root is greater than any child notes.

// Obj: create heap and be able to retrieve any parent or left and right child nodes

struct Heap {
    
    // data structure for our Heap nodes is an array
    private var nodes = [2, 8, 21, 10, 16, 30, 36]
    
    private var orderingCriteria: (Int, Int) -> Bool
    
    public init(_ sort: @escaping (Int, Int) -> Bool) {
        self.orderingCriteria = sort // < (minheap) or > (max heap) 
    }
    
    // peek
    public func peek() -> Int? {
        guard !nodes.isEmpty else {return nil}
        return nodes[0]
        // return nodes.first 
    }
    
    // get parent index
    public func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // get left child index
    public func leftChildIndex(_ index: Int) -> Int {
        return (index * 2) + 1
    }
    
    // get right child index
    public func rightChildIndex(_ index: Int) -> Int {
        return (index * 2) + 2
    }
    
    public func parentValue(_ index: Int) -> Int? {
        guard index > 0 else {return nil}
        return nodes[parentIndex(index)]
    }
    
    public func leftChildValue(_ index: Int) -> Int? {
        guard leftChildIndex(index) < nodes.count else {return nil}
        return nodes[leftChildIndex(index)]
    }
    
    public func rightChildValue(_ index: Int) -> Int? {
        guard rightChildIndex(index) < nodes.count else {return nil}
        return nodes[rightChildIndex(index)]
    }
    
    // insert
    public mutating func insert(_ item: Int) {
        // append new element to the end of the array
        nodes.append(item) // nodes is changing so mutating is needed
        shiftUp(nodes.count - 1)
    }
    
    // shift up in order to heapify and satisfy the heap property
    public mutating func shiftUp(_ index: Int) {
        let newChild = nodes[index]
        var childIndex = index // starts off as the last index
        var parentIndex = self.parentIndex(childIndex)
        
        while childIndex > 0 && orderingCriteria(newChild, nodes[parentIndex]) {
            // keep swapping
            nodes[childIndex] = nodes[parentIndex]  // swap child and parent value
            childIndex = parentIndex // traverse
            parentIndex = self.parentIndex(childIndex) // find new parent index
        }
        
        // at the end of comparison we will insert the newchild
        nodes[childIndex] = newChild
    }
}

/*
         2             [0]
       /    \
      8      21        [1,2]
     / \    /  \
    10  16  30   36    [3,4,5,6]
 
 level order: 2,8,21,10,16,30,36
*/

var minHeap = Heap(<)

minHeap.parentIndex(5) // 2
minHeap.leftChildIndex(2) // 5
minHeap.parentValue(minHeap.parentIndex(10))
minHeap.leftChildValue(minHeap.leftChildIndex(36))
minHeap.rightChildValue(minHeap.rightChildIndex(36))
minHeap.insert(-6)
minHeap.peek()
