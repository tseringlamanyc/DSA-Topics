import UIKit

/*
 BINARY SEARCH
 
 array must be sorted
 array divided by the middle index
 use either left array or right array
 log n
 divide and conquer
 */

func binarySearch<T: Comparable>(arr: [T], searchKey: T, range: Range<Int>) -> Int? {
    
    // check for lower and upper bound
    // upper bound has to be higher than lower bound
    // [4,7,1] - lowerbound 0 & upperbound 2
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    // calculate middle index
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    // middleIndex = key ?
    if arr[middleIndex] == searchKey {
        return middleIndex
    }
        
        // middleIndex > key, look at the left side
    else if arr[middleIndex] > searchKey {
        return binarySearch(arr: arr, searchKey: searchKey, range: range.lowerBound..<middleIndex) // not including middle index
    }
        
        // middleIndex < key, look at the right side
    else if arr[middleIndex] < searchKey {
        return binarySearch(arr: arr, searchKey: searchKey, range: middleIndex + 1..<range.upperBound) // not including middleIndex
    }
    
    // no value found
    return nil
}

let list = [2,3,5,6,7,10,11]

let index = binarySearch(arr: list, searchKey: 10, range: 0..<list.count)

// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.
func binarySearch1<T: Comparable>(arr: [T], target: T) -> Bool {
    
    for _ in arr {
        if arr.contains(target) {
            return true
        }
    }
    return false
}

binarySearch1(arr: list, target: 10)

// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.
func recursiveBinarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    
    guard arr.count != 0 else { return false }
    
    let lowerBound = 0
    let upperBound = arr.count - 1
    
    let middleIndex = lowerBound + (upperBound - lowerBound) / 2
    
    if lowerBound >= upperBound {
        return false
    }
    
    if arr[middleIndex] == target {
        return true
    }
        
    else if target > arr[middleIndex] {  // right side
        let rightSide = arr[middleIndex + 1...upperBound]
        let array = Array(rightSide)
        return binarySearch1(arr: array, target: target)
    }
        
        
    else if target < arr[middleIndex] { // left side
        let leftSide = arr[lowerBound..<middleIndex]
        let array = Array(leftSide)
        return binarySearch1(arr: array, target: target)
    }
    
    return false
}

recursiveBinarySearch(arr: list, target: 11)

// https://www.interviewbit.com/problems/matrix-search/
// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:
// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.
func contains(value: Int, in arr: [[Int]]) -> Bool {
    return false
}

// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time
func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
    
    guard arr.count != 0 else {return nil}
    
    let lowerBound = 0
    let upperBound = arr.count - 1
    
    if lowerBound >= upperBound {
        return nil
    }
    
    let middleIndex = lowerBound + (upperBound - lowerBound) / 2
    
    if arr[middleIndex] == value {
        return middleIndex
    }
        
    else if arr[middleIndex] > value {
        return binarySearch(arr: arr, searchKey: value, range: lowerBound..<middleIndex)
    }
        
    else if arr[middleIndex] < value {
        return binarySearch(arr: arr, searchKey: value, range: middleIndex..<upperBound + 1)
    }
    
    return nil
}

lastOccurrence(of: 2, in: list)

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time
func smallestMissingNumber(in arr: [Int]) -> Int {
    return -1
}

func search(_ nums: [Int], _ target: Int) -> Int {
    
    guard nums.count > 0 else {return 0}
    
    var lowerBound = 0
    var upperBound = nums.count - 1
    
    if lowerBound >= upperBound {
        return 0
    }
    
    let middleIndex = lowerBound + (upperBound - lowerBound) / 2
    
    if nums[middleIndex] == target {
        return middleIndex
    }
        
    else if nums[middleIndex] < target {
        lowerBound = middleIndex + 1
    }
        
    else if nums[middleIndex] > target {
        upperBound = middleIndex - 1
    }
    
    return 0
}

search([-1,0,3,5,9,12], 9)
