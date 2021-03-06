import UIKit

/*
 Runtime - O n ^ 2
 Space - O(1)
 Inout function (in place) - reference , can change the value
 */

func bubbleSort(arr: inout [Int]) {
    // in place manipulation
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

anotherBubbleSort(arr: [1,2,3,4,5], by: >)


// Question Two
// Sort an array of Ints without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func bubbleSortWithoutMovingNegatives(arr: [Int], by isSorted: (Int, Int) -> Bool) -> [Int] {
    
    var tempArr = arr
    
    for i in 0..<tempArr.count {
        for j in 1..<tempArr.count - i {
                if isSorted(tempArr[j], tempArr[j - 1]) {
                 // TO DO 
            }
        }
    }
    
    return tempArr
}

bubbleSortWithoutMovingNegatives(arr: [2, -6, -3, 8, 4, 1], by: <)

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


func bubble2(arr: inout [Int]) {
    for _ in 0..<arr.count {
        for j in 1..<arr.count {
            if arr[j] < arr[j - 1] {
                let temp = arr[j]
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
            }
        }
    }
}

var listu = [10, 2, -8, 4]
bubble2(arr: &listu)

2 > 2

func optimizedBubble(arr: inout [Int]) {
    var swaps = false
    
    for i in 0..<arr.count {
        for j in 1..<arr.count - i {
            print(i, j)
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
                swaps = true
            }
        }
        if !swaps {
            break // arr already sorted at this point
        }
    }
}

var listuu = [10, 2, -8, 4, -1000, 0]
optimizedBubble(arr: &listuu)
