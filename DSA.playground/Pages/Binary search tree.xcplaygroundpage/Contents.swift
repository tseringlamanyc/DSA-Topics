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

rootNode.inorder()

rootNode.contains(target: 5)
rootNode.contains(target: -100)
