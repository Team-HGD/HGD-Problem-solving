//https://leetcode.com/problems/diameter-of-binary-tree/

import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution { // input 노드 중 제일 길이가 긴 노드 사이의 거리를 구하는 문제 -> root 혹은 left, right를 타고 가는 문제
    var maxDiameter: Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        func depth (_ node: TreeNode? ) -> Int {
            guard let node else { return 0 }
            let leftDepth = depth(node.left) // 왼쪽 자식 노드의 깊이
            let rightDepth = depth(node.right) // 오른쪽 자식 노드의 깊이
            
            maxDiameter = max(maxDiameter, leftDepth + rightDepth)
            
            // 현재 노드의 깊이는 자식 중 더 큰 깊이에 1을 더한 값
            return max(leftDepth, rightDepth) + 1
        }
        depth(root)
        return maxDiameter
    }
}
