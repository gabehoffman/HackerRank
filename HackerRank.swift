import Foundation

open class HackerRank {

    public var inputs: [String] = []
    public var outputs: [String] = []
    public var solutions: [()->String] = []
    
    var lines: [String] = []
    var currentLineNumber = 0
    var displayMetrics: Bool = true
    var debug = false

    public init(named directoryName: String) {
        let defaultDirectory = "/Users/gabehoffman/Developer/HackerRank/HackerRank/"
        let dataDirectory = defaultDirectory + directoryName
        
        do {
            let inputDirectory = "\(dataDirectory)/inputs"
            let inputsPath = URL(fileURLWithPath: "\(dataDirectory)/inputs")
            let inputUrls = try FileManager.default.contentsOfDirectory(atPath: inputDirectory)
            // Read input files
            for input in inputUrls {
                do {
                    let inputURL = inputsPath.appendingPathComponent(input)
                    let contents = try String(contentsOf: inputURL, encoding: String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)
                    inputs.append(contents)
                    let contentLines = contents.components(separatedBy: "\n").map{ String($0) }
                    lines += contentLines
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }

        }
        catch let error as NSError {
            print("Ooops! Something went wrong reading inputs: \(error)")
        }


        // Read output files
        do {
            let outputDirectory = "\(dataDirectory)/outputs"
            let outputsPath = URL(fileURLWithPath: "\(dataDirectory)/outputs")
            let outputURLs = try FileManager.default.contentsOfDirectory(atPath: outputDirectory)
            // Read input files
            for output in outputURLs {
                do {
                    let outputURL = outputsPath.appendingPathComponent(output)
                    let contents = try String(contentsOf: outputURL, encoding: String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)
                    outputs.append(contents)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }

        }
        catch let error as NSError {
            print("Ooops! Something went wrong reading outputs: \(error)")
        }

        if debug {
            print("Inputs: \(inputs) -- ")
            print("Lines: \(lines) --")
            print("Outputs: \(outputs) --")
        }
    }

    public func metricsAreOn(_ on: Bool) {
        displayMetrics = on
    }

    public func readLine() -> String? {
        if currentLineNumber > lines.count {
            return nil
        } else {
            let line = lines[currentLineNumber]
            currentLineNumber += 1
            return line
        }
    }

    func measure(name: String, block: ( () -> (String) )) -> String {

        let startTime = CFAbsoluteTimeGetCurrent()
        let result = block()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime

        if displayMetrics {
            print("\(name):: Time: \(timeElapsed)")
        }

        return result
    }

    func setUpInputs() {
        fatalError("Failed to override a required method")
    }

    func addSolutions() {
        fatalError("Failed to override a required method")
    }

    func solve() {
        addSolutions()
        for i in 0..<inputs.count {
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
