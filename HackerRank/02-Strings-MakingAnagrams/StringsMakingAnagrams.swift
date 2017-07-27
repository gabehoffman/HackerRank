import Foundation

// Template for solving a Hacker Rank Problem

class StringsMakingAnagrams: HackerRank {

    // Set up your inputs variables
    var arrayA = [Character]()
    var arrayB = [Character]()

    var indexA = 0
    var indexB = 0

    var deletions = 0

    // Read in values to the inputs
    // Don't forget to reset all variable to assumed default values
    override func setUpInputs() {
        indexA = 0
        indexB = 0
        deletions = 0
        arrayA = readLine()!.characters.sorted()
        arrayB = readLine()!.characters.sorted()
    }

    override func addSolutions() {
        solutions.append(solution)
    }

    // Example good solution
    func solution() -> String {
        while (indexA < arrayA.count) && (indexB < arrayB.count) {
            let a = arrayA[indexA]
            let b = arrayB[indexB]
            if a == b {
                indexA += 1
                indexB += 1
            } else if a < b {
                indexA += 1
                deletions += 1
            } else if b < a {
                indexB += 1
                deletions += 1
            }
        }

        deletions += arrayA.count - indexA
        deletions += arrayB.count - indexB

        let result = "\(deletions)"
        return result
    }

    // Optionally override a custom solve() method


}


