import Foundation

// Template for solving a Hacker Rank Problem

class QueuesATaleOfTwoStacks: HackerRank {

    // NOT YET IMPLEMENTED

    // Set up your inputs variables
    var inputParameters: [String] = []
    var statusCode: Int = 0
    var statusMessage: String = ""

    // Read in values to the inputs
    // Don't forget to reset all variable to assumed default values
    override func setUpInputs() {
        inputParameters = readLine()!.components(separatedBy: " ").map{ String($0) }
        statusCode = Int(inputParameters.first!)!
        statusMessage = inputParameters.last!
    }

    override func addSolutions() {
        solutions.append(solution)
    }

    // Example solution
    func solution() -> String {
        if statusCode == 200 {
            return "success"
        } else if statusCode == 404 {
            return "failure"
        } else {
            return "unknown"
        }
    }

    // Optionally override a custom solve() method
    // override func solve() {}
}
