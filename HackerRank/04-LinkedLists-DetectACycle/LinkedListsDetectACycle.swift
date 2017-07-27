import Foundation

// Template for solving a Hacker Rank Problem

class LinkedListsDetectACycle: HackerRank {

    // NOT YET IMPLEMENTED

    class Node {
        var next: Node?

        init(next: Node? = nil) {
            self.next = next
        }
    }

    let node3, node2, node1, node0: Node
    var roots = [Node]()

    override init (named directoryName: String) {
        node3 = Node()
        node2 = Node(next: node3)
        node1 = Node(next: node2)

        node0 = Node()
        roots = [node0, node1]
        super.init(named: directoryName)
    }

	var rootIndex = 0
    var currentNode = Node()

    // Read in values to the inputs
    // Don't forget to reset all variable to assumed default values
    override func setUpInputs() {
        currentNode = roots[rootIndex]
    }

    override func addSolutions() {
        solutions.append(solution)
    }

    // Example solution
    func solution() -> String {
        let hasCycle = false

        // TO BE IMPLEMENTED

        if hasCycle {
            // true
            return "1"
        } else {
            // false
            return "0"
        }
    }

    // Optionally override a custom solve() method
    override func solve() {
        addSolutions()
        for i in 0..<roots.count {
            setUpInputs()
            for j in 0..<solutions.count {
                let result = measure(name: "Solution \(j)", block: solutions[j])
                if result == outputs[i] {
                    print("PASS")
                } else {
                    print("FAIL")
                }
            }
        }
    }
}


