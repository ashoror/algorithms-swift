/// Valid Parentheses
/// https://leetcode.com/problems/valid-parentheses/
///
/// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']',
/// determine if the input string is valid.
///
/// An input string is valid if:
/// Open brackets must be closed by the same type of brackets.
/// Open brackets must be closed in the correct order.
///
/// Example 1:
///
/// `Input: s = "()"`
///` Output: true`
///
/// Example 2:
///
/// `Input: s = "()[]{}"`
/// `Output: true`
///
/// Example 3:
///
/// `Input: s = "(]"`
/// `Output: false`
///
/// Example 4:
///
/// `Input: s = "([)]"`
///` Output: false`
///
/// Example 5:
///
/// `Input: s = "{[]}"`
/// `Output: true`
///
///
/// Constraints:
///
/// `1 <= s.length <= 104`
/// `s consists of parentheses only '()[]{}'.`

struct Solution {

	/// Time: O(n) - because we simply traverse the given string one character at a time
	/// and push and pop operations on a stack take O(1) time
	///
	/// Space: O(n) - as we push all opening brackets onto the stack and in the worst case,
	/// we will end up pushing all the brackets onto the stack. e.g. ((((((((((.
	func isValid(_ s: String) -> Bool {

		var stack: [String] = []
		let mapping: [String: String] = [")": "(", "}": "{", "]": "["]

		for char in s {
			let char = String(char)
			if mapping.keys.contains(char) {
				let topElement = stack.isEmpty ? "#" : stack.popLast()
				if topElement != mapping[char] {
					return false
				}
			} else {
				stack.append(char)
			}
		}

		return stack.isEmpty
	}
}
