import UIKit
// dict is not sorted
// hashvalue is built in hash function
var buckets = Array(repeating: 0, count: 2)

let index = abs("Tsering".hashValue % buckets.count)
let index2 = abs("Alex".hashValue % buckets.count)
let index3 = abs("Vayne".hashValue % buckets.count)
let index4 = abs("Jhin".hashValue % buckets.count)

//print(index, index2, index3, index4)
// Implementing hashtable
struct HashTable <Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    
    private (set) var count = 0 // get is public, set is private
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
        // [[], [], ["a": 1]]
    }
    
    // method to return index where key will be sorted
    func index(key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    // method to search for a value given a key
    func getValue(key: Key) -> Value? {
        let index = self.index(key: key)
        
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        
        return nil
    }
    
    // method to update a value for a given key
    mutating func update(value: Value, key: Key) -> Value? {
        let index = self.index(key: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                // update
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    // method to remove an element given a key
    mutating func removeValue(key: Key) -> Value? {
        let index = self.index(key: key)
        
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        
        return nil
    }
    
    subscript(key: Key) -> Value? {
        get {
           return getValue(key: key)
        } set {
            if let value = newValue {
                update(value: value, key: key)
            } else {
                // hashTable["a"] = nil
                removeValue(key: key)
            }
        }
    }
}

// testing
var hashTable = HashTable<String, Int>(capacity: 4)

hashTable.update(value: 21, key: "A")
hashTable.update(value: 25, key: "B")

hashTable.removeValue(key: "B")

hashTable["C"] = 11

print(hashTable.count, hashTable)
