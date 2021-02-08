import Foundation

class TrieNode {
    // properties: char, parent, child and delimeter signifying if path has a word
    var char: Character
    var parent: TrieNode?
    
    var children: [Character: TrieNode] = [:]
    var isWordComplete: Bool = false
    
    // init
    init(char: Character, parent: TrieNode? = nil) {
        self.char = char
        self.parent = parent
    }
    
    // method
    func add(child: Character) {
        // check if child doesnt exist, otherwise return
        guard children[child] == nil else {return}
        
        // insert new value (TrieNode) in children dict
        children[child] = TrieNode(char: child, parent: self)
    }
}

// implement trinode data structure

class Trie {
    private var root: TrieNode
    
    init() {
        root = TrieNode(char: "*")
    }
    
    // insert (eg: Swift)
    func insert(_ word: String) {
        // start at root node
        var currentNode = root
        
        for char in word {
            // check if there is a child node for the current character
            if let childNode = currentNode.children[char] {
                // keep traversing the trie
                currentNode = childNode
            }
            
            // add a child to the currentNode and traverse the trie
            else {
                currentNode.add(child: char)
                currentNode = currentNode.children[char]!
            }
        }
        
        // mark word as complete
        guard currentNode.isWordComplete else {return}
        currentNode.isWordComplete = true
    }
    
    // getNode => Node?
    func getNode(_ word: String) -> TrieNode? {
        var currentNode = root
        
        for char in word {
            guard let childNode = currentNode.children[char] else {return nil}
            currentNode = childNode
        }
        return currentNode
    }
    
    func search(_ word: String) -> Bool {
        guard let node = getNode(word) else {return false}
        return node.isWordComplete
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = getNode(prefix) else {return false}
        return true
    }
    
    // search (eg: Sweet -> Bool)
    
    
    // prefix (eg: "sw" -> Bool)
}

let trie = Trie()
trie.insert("swift")
trie.insert("sweet")
trie.insert("sweater")
trie.insert("sat")
trie.insert("tsering")
