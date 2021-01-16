import Foundation

// Quick Sort implementation using Lomuto's Partitioning algorithm
// Quick Sort uses a pivot in our example we use the last element (Lomuto's Partitioning) as the pivot
// Using this pivot we split the array to the left of the pivot and to the right of the pivot
// example 10, -9, 0, -11, (pivot is 13) , 80
// Quick Sort uses divide and conquer approach to solve the sorting algorithm, divide and conquer is spliting the problem in half on every interation (or recursive call)
// runtime: O(n log n)

//MARK:- LOMUTO PARTITION

// returns new index which we will use as the pivot to partition the array into a left and right
func lomotoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    
    /*
      Steps of Lomuto's Partitioning
      1. Use the last element as the pivot
      2. Iterate the array with i and j variables
      3. If element at j is less than the pivot then swap i and j, increment i
      4. Swap i and the high indices
      5. Return i (new pivot to divide the array using recursion)
     */
    
    let pivot = arr[high]
    
    var i = low
    
    // iterate through the array using j
    
    for j in low..<high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    // change pivot (high) and i
    arr.swapAt(i, high)
    return i // returns pivot
}


// Second part is using recursion to break up array into subarrays while sorting in place
func quickSortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    
    /*
      Steps for Quick sort using Lomuto's partitioning
      
      1. Calculate the new pivot
      2. left array recursive call will be low, pivot - 1
      3. right array recursive call will be pivot + 1, high
     */
    
    
    if low < high {  // check to see if the arr has multiple elements
        // get a new pivot
       let pivot = lomotoPartition(&arr, low: low, high: high)
        
        // recursive
        
        // left array
        quickSortLomuto(&arr, low: low, high: pivot - 1)
        
        // right array
        quickSortLomuto(&arr, low: pivot + 1, high: high)
    }
}


var list = [80, 10, -9, 0, -11, 13]
quickSortLomuto(&list, low: 0, high: list.count - 1)


// LEETCODE

func sortArray(_ nums: [Int]) -> [Int] {
    
    var sortedArr = nums
    
    quickSortLomuto(&sortedArr, low: 0, high: sortedArr.count - 1)
    
    return sortedArr
}
