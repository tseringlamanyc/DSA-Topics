import UIKit

/*
 MERGE SORT
 O(n log n) - only possibility
 divide and conquer
 splits array in 2 , using middle index
 recursion until base case of count = 1 is reached
 
 Find the middle index of the array.
 Divide the array in a left and right side using the middle index. O(log n) runtime.
 The base case for stopping the divide and conquer process is when we have1element left.
 Merge back the divided arrays while sorting the elements. O(n) runtime.
 */

func mergeSort<T: Comparable>(arr: [T]) -> [T] {
    
    // base case
    guard  arr.count > 1 else {return arr}
    
    let middleIndex = arr.count / 2
    let leftArr = mergeSort(arr: Array(arr[..<middleIndex])) // start not including middle
    let rightArr = mergeSort(arr: Array(arr[middleIndex...])) // middle to end
    return mergeArr(leftArr: leftArr, rightArr: rightArr)
}

// combine two sorted arrays
func mergeArr<T: Comparable>(leftArr: [T], rightArr: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    var resultArr = [T]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        // compare  left side to right
        if leftElement < rightElement {
            resultArr.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultArr.append(rightElement)
            rightIndex += 1
        } else { // both equal
            resultArr.append(leftElement)
            leftIndex += 1
            resultArr.append(rightElement)
            rightIndex += 1
        }
    }
    
    // append elements remaining in left or right array
    if leftIndex < leftArr.count {
        resultArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultArr
}

let list = [12,8,29,-100,234]
let sortedList = mergeSort(arr: list)
print(sortedList)


func mergeSort2(_ arr: [Int]) -> [Int] {  // this function only splits doesnt merge
    
    // base case (recursion), count is greater than 1
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArr = mergeSort2(Array(arr[..<middleIndex])) // beginning to one before middleIndex
    
    let rightArr = mergeSort2(Array(arr[middleIndex...])) // middleIndex to the end
    
    return merge2(leftArr, rightArr)
}

// combine two sorted array
func merge2(_ leftArr: [Int], _ rightArr: [Int]) -> [Int] {
    
    var leftIndex  = 0
    var rightIndex = 0
    
    var resultArr = [Int]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        // compare
        if leftElement < rightElement {
            resultArr.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultArr.append(rightElement)
            rightIndex += 1
        } else { // both elements are equal
            resultArr.append(leftElement)
            leftIndex += 1
            resultArr.append(rightElement)
            rightIndex += 1
        }
    }
    
    // append remaining elements
    if leftIndex < leftArr.count {
        resultArr.append(contentsOf: leftArr[leftIndex...])
    }

    if rightIndex < rightArr.count {
        resultArr.append(contentsOf: rightArr[rightIndex...])
    }

    return resultArr
    
}

let list1 = [12, 8, 29, -100, 0, 234]
print(mergeSort2(list1))
