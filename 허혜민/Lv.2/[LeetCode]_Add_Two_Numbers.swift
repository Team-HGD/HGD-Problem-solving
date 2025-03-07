// https://leetcode.com/problems/add-two-numbers/

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
        let head = ListNode()
        var graphCurrent: ListNode = head 
        var firstCurrent = l1
        var secondCurrent = l2 
        var carry = 0 
        while true {
            if firstCurrent == nil, secondCurrent == nil {
                guard carry != 0 else { break }
                graphCurrent.next = ListNode(carry)
                graphCurrent = graphCurrent.next!
                break  
            } 
            
            if firstCurrent == nil {
                var next: ListNode? 
                if let sumCarry = findCarry(secondCurrent!.val + carry) {
                    next = ListNode(sumCarry.mod)
                    carry = sumCarry.carry 
                } else {
                    next = ListNode(secondCurrent!.val + carry)
                    carry = 0 
                }
                graphCurrent.next = next
                graphCurrent = graphCurrent.next!
                secondCurrent = secondCurrent?.next
                continue 
            }   
            
            if secondCurrent == nil {
                var next: ListNode? 
                if let sumCarry = findCarry(firstCurrent!.val + carry) {
                    next = ListNode(sumCarry.mod)
                    carry = sumCarry.carry 
                } else {
                    next = ListNode(firstCurrent!.val + carry)
                    carry = 0 
                }
                graphCurrent.next = next
                graphCurrent = graphCurrent.next!
                firstCurrent = firstCurrent?.next
                continue 
            }

            // else 둘다 nil이 아닐때 
            let sum = firstCurrent!.val + secondCurrent!.val + carry 
            carry = 0 
            firstCurrent = firstCurrent?.next
            secondCurrent = secondCurrent?.next 
            if let sumCarry = findCarry(sum) {
                graphCurrent.next = ListNode(sumCarry.mod)
                carry = sumCarry.carry 
            } else {
                graphCurrent.next = ListNode(sum)
            }
            graphCurrent = graphCurrent.next!
        }
        return head.next == nil ? head : head.next
    }

    func findCarry(_ val: Int) -> (carry: Int, mod: Int)? {
        guard val > 9 else { return nil }
        return (val / 10, val % 10)
    }
}
