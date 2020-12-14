import UIKit

/*
 MERGE SORT
 O(n log n) - only possibility
 divide and conquer
 splits array in 2 , using middle index
 recursion until base case of count = 1 is reached
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
