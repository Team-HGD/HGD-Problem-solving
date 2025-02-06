// https://leetcode.com/problems/clone-graph/description/
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
       var valDict: [Int: Node] = [:]
       var firstNode: Node? = nil
       
       func cloneNode(_ connectedCopiedNode: Node?, _ currentNotCopiedNode: Node?) {
        guard let currentNotCopiedNode else { return }
        if let node = valDict[currentNotCopiedNode.val] { // 이미 해당 val을 가진 node가 생성됨
            if let beforeNode = connectedCopiedNode {
                beforeNode.neighbors.append(node)
            }
            return
        }
        var newNode = Node(currentNotCopiedNode.val)
        valDict[newNode.val] = newNode
        if firstNode == nil { firstNode = newNode }
        
        connectedCopiedNode?.neighbors.append(newNode)
        currentNotCopiedNode.neighbors.forEach { cloneNode(newNode, $0) }
       }
       cloneNode(nil, node)
       return firstNode
    }
}
