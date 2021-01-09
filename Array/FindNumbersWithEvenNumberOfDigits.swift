import Foundation

/// Find Numbers with Even Number of Digits
/// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3237/
/// Example 3:
///
/// `Input: nums = [12,345,2,6,7896]`
/// `Output: 2`
/// `Explanation:`
/// `12 contains 2 digits (even number of digits).`
/// `345 contains 3 digits (odd number of digits).`
/// `2 contains 1 digit (odd number of digits).`
/// `6 contains 1 digit (odd number of digits).`
/// `7896 contains 4 digits (even number of digits).`
/// `Therefore only 12 and 7896 contain an even number of digits.`

/// Example 2:
///
/// `Input: nums = [555,901,482,1771]`
/// `Output: 1`
/// `Explanation:`
/// `Only 1771 contains an even number of digits.`

/// Constraints:
///
/// `1 <= nums.length <= 500`
/// `1 <= nums[i] <= 10^5`

struct FindNumbersWithEvenNumberOfDigits {

	/// Time: O(n); Memory: O(n)
	struct Solution1 {

		func findNumbers(_ nums: [Int]) -> Int {
			var evenCount = 0
			for i in nums {
				evenCount += String(i).count % 2 == 0 ? 1 : 0
			}
			return evenCount
		}
	}

	/// Time: O(N * logN); Memory: O(1)
	struct Solution2 {

		func findNumbers(_ nums: [Int]) -> Int {
			var evenCount = 0
			for i in nums {
				var count = 0
				var num = i
				while num != 0 {
					count += 1
					num = num / 10
				}

				if count % 2 == 0 {
					evenCount += 1
				}
			}

			return evenCount
		}
	}

	/// Time: O(n); Memory: O(n)
	struct Solution3 {

		func findNumbers(_ nums: [Int]) -> Int {
			var evenCount: Int = 0
			nums.forEach { num in
				let numLg = log10(Float(num))
				let numCount = Int(floor(numLg))
				evenCount += numCount % 2 == 0 ? 0 : 1
			}
			return evenCount
		}
	}
}
