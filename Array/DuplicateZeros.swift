import Foundation

/// Duplicate Zeros
/// https://leetcode.com/explore/featured/card/fun-with-arrays/525/inserting-items-into-an-array/3245/

/// Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.
/// Note that elements beyond the length of the original array are not written.
/// Do the above modifications to the input array in place, do not return anything from your function.

/// Example 1:
///
/// `Input: [1,0,2,3,0,4,5,0]`
/// `Output: null`
/// `Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]`

/// Example 2:
///
/// `Input: [1,2,3]`
/// `Output: null`
/// `Explanation: After calling your function, the input array is modified to: [1,2,3]`

/// Constraints:
///
/// `1 <= arr.length <= 10000`
/// `0 <= arr[i] <= 9`

struct DuplicateZeros {

	/// Time: O(n); Memory: O(1)
	struct Solution1 {

		func duplicateZeros(_ arr: inout [Int]) {
			var index = 0
			while index < arr.count {
				if arr[index] == 0 {
					arr.insert(0, at: index)
					arr.remove(at: arr.count - 1)
					index += 2
				} else {
					index += 1
				}
			}
		}
	}
}
