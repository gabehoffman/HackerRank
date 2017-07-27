import Foundation

// Template for solving a Hacker Rank Problem

class HashTablesRansomNote: HackerRank {

    // Set up your inputs variables
    var inputParameters = [Int]()
    var wordCount = 0
    var noteCount = 0

    var magazineArray = [String]()
    var noteArray = [String]()

    // Read in values to the inputs
    // Don't forget to reset all variable to assumed default values
    override func setUpInputs() {
        inputParameters = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        wordCount = inputParameters.first!
        noteCount = inputParameters.last!

        magazineArray = readLine()!.components(separatedBy: " ").map{ String($0) }.sorted()
        noteArray = readLine()!.components(separatedBy: " ").map{ String($0) }.sorted()
    }

    override func addSolutions() {
        //solutions.append(solutionA)
        solutions.append(solutionB)
    }

    // First Solution - large lists take about 17s (too slow)
    func solutionA() -> String {
        var match = true

        for i in 0..<noteCount {
            guard let index = magazineArray.index(of: noteArray[i]) else {
                match = false
                break
            }
            magazineArray.remove(at: index)
        }

        if match {
            return("Yes")
        } else {
            return("No")
        }
    }

    // Uses dictionary to hash result, and word counts (under 1s)
    func solutionB() -> String {
        var match = true

        // Create hashtable with magazineArray
        var magazineWordDictionary: [String : Int] = [:]
        for word in magazineArray {
            if magazineWordDictionary[word] != nil {
                let count = magazineWordDictionary[word]!
                magazineWordDictionary.updateValue(count+1, forKey: word)
            } else {
                magazineWordDictionary[word] = 1
            }
        }

        for word in noteArray {
            guard let count = magazineWordDictionary[word], count > 0 else {
                match = false
                break
            }
            magazineWordDictionary.updateValue(count-1, forKey: word)
        }

        if match {
            return("Yes")
        } else {
            return("No")
        }
        
    }

    // Optionally override a custom solve() method
    // override func solve() {}

}


