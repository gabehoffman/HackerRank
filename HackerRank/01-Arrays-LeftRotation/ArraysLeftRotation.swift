import Foundation

// Template for solving a Hacker Rank Problem

class ArraysLeftRotation: HackerRank {

    // Set up your inputs variables
    var inputParameters: [Int] = []
    var length: Int = 0
    var rotations: Int = 0
    var array: [Int] = []

    // Read in values to the inputs
    override func setUpInputs() {
        inputParameters = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        length = inputParameters.first!
        rotations = inputParameters.last!

        array = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    }

    override func addSolutions() {
        // n^2 slow solution (252 seconds)
        // solutions.append(solutionSlow)
        solutions.append(solutionBetter)
    }

    func solutionSlow() -> String {
        for _ in 1...rotations {
            let first = array.first!
            var temp = array.dropFirst().map{ Int($0) }
            temp.append(first)
            array = temp
        }

        let solution = array.flatMap { String($0) }.joined(separator: (" "))
        return(solution)

    }

    func solutionBetter() -> String {
        let firstElements = array[0..<rotations]
        for i in 0..<length-rotations {
            array[i] = array[i+rotations]
        }

        for i in 0..<rotations {
            let index = length-rotations
            array[index + i] = firstElements[i]
        }

        let solution = array.flatMap { String($0) }.joined(separator: (" "))
        return(solution)
    }

}


