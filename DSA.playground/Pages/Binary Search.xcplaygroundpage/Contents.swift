import UIKit

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

extension TreeNode {
    func insert(newValue: Int) {
        if newValue < value { // go left
            if left != nil {  // keep checking left
                left!.insert(newValue: newValue)
            } else {  // create new left child
                left = TreeNode(value: newValue)
            }
        } else { // go right
            if right != nil {
                right!.insert(newValue: newValue)
            } else {
                right = TreeNode(value: newValue)
            }
        }
    }
    
    func inorder() {
        left?.inorder()   // visit left
        print("\(value)", terminator: " ")
        right?.inorder()  // visit right
    }
    
    func contains(target: Int) -> Bool {
        if target == value {return true}  // root value
        
        if target < value { // left
            if left != nil {
                return left!.contains(target: target)
            } else {
                return false
            }
        } else {  // right
            if right != nil {
                return right!.contains(target: target)
            } else {
                return false
            }
        }
    }
}

/*
                 12
                /   \
               5    32
 5,12,32 inorder  (ascending)
 */

let rootNode = TreeNode(value: 12)
rootNode.insert(newValue: 5)
rootNode.insert(newValue: 32)
rootNode.insert(newValue: -1)
rootNode.insert(newValue: 100000)

rootNode.inorder()

rootNode.contains(target: 5)
rootNode.contains(target: -100)

func insert(_ root: TreeNode?, _ value: Int) -> TreeNode? {
  // 1. - create the new node
    let newNode = TreeNode(value: value)
  
  // 2. - if the tree is empty, newNode becomes the root
  guard let root = root else {
    return newNode
  }
  
  // 3. - if value is less than root's value go left
  if value < root.value {
    if root.left == nil {
      root.left = newNode
      return root
    } else {
      insert(root.left, value)
    }
  }
  
  // 4. - if value is greater than root's value go right
  if value > root.value {
    if root.right == nil {
      root.right = newNode
      return root
    } else {
      insert(root.right, value)
    }
  }
  
  return root
}

func search(_ root: TreeNode?, _ value: Int) -> Bool {
    
    guard let root = root else {return false}
    
    if root.value == value {
        return true
    }
    
    if value < root.value {
        return search(root.left, value)
    }
    
    if value > root.value {
        return search(root.right, value)
    }
    
    return false
}

search(rootNode, -1000)


func findMinValue(_ root: TreeNode?) -> Int {
    guard let root = root else {return 0}
    
    if let lChild = root.left {
        return findMinValue(lChild)
    }
    
    return root.value
}

findMinValue(rootNode)


func findMax(_ root: TreeNode?) -> Int {
    guard let root = root else {return 0}
    
    if let rChild = root.right {
        return findMax(rChild)
    }
    
    return root.value
}

let rootNode2 = TreeNode(value: 5)
rootNode2.insert(newValue: 4)
rootNode2.insert(newValue: 6)

findMax(rootNode)

func deleteNode(_ root: TreeNode?, _ value: Int) -> TreeNode? {
    
    guard let _ = root else {return nil}
    
    var rootCopy = root
        
    if value < rootCopy!.value { // look left
        return deleteNode(rootCopy?.left, value)
    } else if value > rootCopy!.value { // look right
        return deleteNode(rootCopy?.right, value)
    } else { // found the value
        // no children
        if rootCopy?.left == nil && rootCopy?.right == nil {
            rootCopy = nil
            return rootCopy
        } // one children
        
        else if rootCopy?.left == nil {
            rootCopy = rootCopy?.right
        } else if rootCopy?.right == nil {
            rootCopy = rootCopy?.left
        }
        
        // two children
        let minValue = findMinValue(rootCopy?.right) // find the minvalue
        rootCopy?.value = minValue // replace the current root with minvalue
        rootCopy?.right = deleteNode(rootCopy?.right, minValue) // delete the minvalue
    }
    
    return rootCopy
}

print()
rootNode2.inorder()
deleteNode(rootNode2, 5)
print()
print(rootNode2.inorder())


func convertToBST(_ arr: [Int], _ low: Int, _ high: Int, _ root: TreeNode?) -> TreeNode? {
  // 1. - base case when we have one node
  if low > high {
    return root
  }
  // 2. - calculate the middle index
  let midIndex = (low + high) / 2
  
  // 3. - create the new root from the middle index
  let root = TreeNode(value: arr[midIndex]) // main node
  
  // 4. - recursively perform conversion on the left subtree
  root.left = convertToBST(arr, low, midIndex - 1, root.left)
  
  // 5. - recursively perform conversion on the right subtree
  root.right = convertToBST(arr, midIndex + 1, high, root.right)
  
  // 6. - return the converted BST
  return root
}

let arr = [3, 10, 7, 5, 1].sorted()
let bst = convertToBST(arr, 0, arr.count - 1, nil)
print(bst?.inorder())

// degenerate tree
func unbalancetoBST(_ root: TreeNode?) -> TreeNode? {
    
    guard let root = root else {return nil}
    
    var nodes = [Int]()
    
    inOrderTraversal(root) { (node) in
        nodes.append(node.value)
    }
    
    let bst = convertToBST(nodes, 0, nodes.count - 1, nil)
    return bst
}


func inOrderTraversal(_ root: TreeNode?, _ visit: (TreeNode) -> ()) {
  guard let root = root else { return }
  inOrderTraversal(root.left, visit)
  visit(root)
  inOrderTraversal(root.right, visit)
}

func height(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  return 1 + max(height(root.left), height(root.right)) // 1 + max(6, 0) => 1 + 6 => 7
}


let rootNodeUB = insert(nil, 89)
insert(rootNodeUB, 66)
insert(rootNodeUB, 34)
insert(rootNodeUB, 20)
insert(rootNodeUB, 17)
insert(rootNodeUB, 12)
insert(rootNodeUB, 5)

let balancedUB = unbalancetoBST(rootNodeUB)

print("Height of unbalanced BST is \(height(rootNodeUB))") // 7
print("Height of balanced BST is \(height(balancedUB))")
