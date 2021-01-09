import Foundation

/// Squares of a Sorted Array
/// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3240/

/// Given an integer array nums sorted in non-decreasing order,
/// return an array of the squares of each number sorted in non-decreasing order.

/// Example 1:
///
/// `Input: nums = [-4,-1,0,3,10]`
/// `Output: [0,1,9,16,100]`
/// `Explanation: After squaring, the array becomes [16,1,0,9,100].`
/// `After sorting, it becomes [0,1,9,16,100].`

/// Example 2:
///
/// `Input: nums = [-7,-3,2,3,11]`
/// `Output: [4,9,9,49,121]`

/// Constraints:
///
/// `1 <= nums.length <= 104`
/// `-104 <= nums[i] <= 104`
/// `nums is sorted in non-decreasing order.`

struct SquaresOfSortedArray {

	/// Time: O(nlogn); Memory: O(logn) - ?
	struct Solution1 {

		func sortedSquares(_ nums: [Int]) -> [Int] {
			nums.map { $0 * $0 }.sorted()
		}
	}

	/// Time: O(n); Memory: O(1)
	struct Solution2 {

		func sortedSquares(_ nums: [Int]) -> [Int] {
			var result: [Int] = [Int](repeating: 0, count: nums.count)
			var l: Int = 0
			var r: Int = nums.count - 1
			var index: Int = r

			while l <= r {
				let left = nums[l] * nums[l]
				let right = nums[r] * nums[r]
				if right > left {
					result[index] = right
					r -= 1
				} else {
					result[index] = left
					l += 1
				}
				index -= 1
			}

			return result
		}
	}
}
