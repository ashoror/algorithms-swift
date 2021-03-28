/// Majority Element
/// https://leetcode.com/problems/majority-element
///
/// Given an array nums of size n, return the majority element.
///
/// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
///
/// Example 1:
/// `Input: nums = [3,2,3]`
/// `Output: 3`
///
/// Example 2:
/// `Input: nums = [2,2,1,1,1,2,2]`
/// `Output: 2`
///
///
/// Constraints:
/// `n == nums.length`
/// `1 <= n <= 5 * 104`
/// `-231 <= nums[i] <= 231 - 1`
///
/// `Follow-up: Could you solve the problem in linear time and in O(1) space?`

struct Solution1 {

	/// Time: O(n), Space: O(n)
	func majorityElement(_ nums: [Int]) -> Int {

		var hashMap: [Int: Int] = [:]
		for num in nums {
			let value = hashMap[num] ?? 0
			hashMap[num] = value + 1
		}

		var maxValueKey = 0
		for (key, value) in hashMap {
			if let hashValue = hashMap[maxValueKey] {
				maxValueKey = value > hashValue ? key : maxValueKey
			} else {
				maxValueKey = key
			}
		}

		return maxValueKey
	}
}

struct Solution2 {

	/// Time: O(n), Space: O(n)
	func majorityElement2(_ nums: [Int]) -> Int {
		let newNums = nums.sorted()
		return newNums[newNums.count / 2]
	}

}

struct Solution3 {

	/// Time: O(n), Space: O(1) - Boyer-Moore Voting Algorithm
	func majorityElement3(_ nums: [Int]) -> Int {
		var count = 0
		var candidate = 0

		for num in nums {
			if count == 0 {
				candidate = num
			}
			count += (num == candidate) ? 1 : -1
		}

		return candidate
	}
}
