// https://leetcode.com/problems/add-two-numbers
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentNodes = (l1: l1, l2: l2)
        var answer: ListNode? = nil
        var currentAnswerNode: ListNode? = nil
        var carry = 0
        while currentNodes.l1 != nil || currentNodes.l2 != nil {
            var sum = (currentNodes.l1?.val ?? 0) + (currentNodes.l2?.val ?? 0) + carry
            carry = sum / 10
            sum %= 10
            let sumNode = ListNode(sum)
            if answer == nil {
                answer = sumNode
                currentAnswerNode = sumNode
            } else {
                currentAnswerNode?.next = sumNode
                currentAnswerNode = sumNode
            }
            currentNodes = (l1: currentNodes.l1?.next, l2: currentNodes.l2?.next)
        }
        if carry > 0 {
            currentAnswerNode?.next = ListNode(carry)
        }
        return answer
    }
}
