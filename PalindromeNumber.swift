/// Palindrome Number
/// https://leetcode.com/problems/palindrome-number/
/// Given an integer x, return true if x is palindrome integer.
///
/// An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
///
/// Example 1:
/// `Input: x = 121`
/// `Output: true`
///
/// Example 2:
/// `Input: x = -121`
///` Output: false`
/// Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
///
/// Example 3:
/// `Input: x = 10`
/// `Output: false`
/// Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
///
/// Example 4:
/// `Input: x = -101`
/// `Output: false`
///
/// Constraints:
/// `-231 <= x <= 231 - 1`
///
/// `Follow up: Could you solve it without converting the integer to a string?`

struct Solution1 {

	/// Time: O(log2n); Space: O(n)
	func isPalindrome(_ x: Int) -> Bool {
		let array = Array(String(x))
		var left = 0
		var right = array.count - 1

		while left <= right {
			if array[left] == array[right] {
				left += 1
				right -= 1
			} else {
				return false
			}
		}

		return true
	}
}

struct Solution2 {

	/// Time: O(log10n); Space: O(1)
	func isPalindrome(_ x: Int) -> Bool {
		if x < 0 || (x % 10 == 0 && x != 0) { return false }

		var reverted = 0
		var temp = x
		while(temp > reverted) {
			reverted = reverted * 10 + temp % 10
			temp /= 10

			print(reverted, temp)
		}

		return temp == reverted || temp == reverted / 10
	}
}
