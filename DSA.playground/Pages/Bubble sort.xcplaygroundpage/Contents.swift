import UIKit

/*
 Runtime - O n ^ 2
 Space - O(1)
 Inout function (in place) - reference , can change the value
 */

func bubbleSort(arr: inout [Int]) {  // in place manipulation
    guard arr.count >= 2 else {return}
    for _ in 0..<arr.count { // O(n)
        for j in 1..<arr.count { // comparing second value  O(n)
            if arr[j] < arr[j - 1] { // arr[j - 1] refers to the first value
                // swap
                let temp = arr[j]  // saving the value at arr[j]
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
            }
        }
    }
}

var list = [10, 2, -8, 4]  // needs to be a var for inout parameter
bubbleSort(arr: &list)

// Question One
// Implement bubble sort that accepts a closure about how to sort elements
func anotherBubbleSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    
    var tempArray = arr
    
    for i in 0..<tempArray.count {
        for j in 1..<tempArray.count-i {
            if isSorted(tempArray[j], tempArray[j-1]) {
                //swap
                let temp = tempArray[j-1]
                tempArray[j-1] = tempArray[j]
                tempArray[j] = temp
            }
        }
    }
    
    return tempArray
}


// Question Two
// Sort an array of Ints without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func bubbleSortWithoutMovingNegatives<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    return arr
}

// Question Three
// Implement Cocktail sort
// https://www.geeksforgeeks.org/cocktail-sort/
func cocktailSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    return arr
}

// Question Four
// Implement bubble sort on a linked list
//func bubbleSort<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
//    return list
//}
