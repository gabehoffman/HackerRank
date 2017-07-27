import Foundation

open class HackerRank {

    public var inputs: [String] = []
    public var outputs: [String] = []
    public var solutions: [String] = []
    
    var lines: [String] = []
    var currentLineNumber = 0
    var displayMetrics: Bool = false

    public init() {
        // Gather Input and Output files from subdirectories
        guard let inputUrls = Bundle.main.urls(forResourcesWithExtension: "txt", subdirectory: "inputs"),
            let outputUrls = Bundle.main.urls(forResourcesWithExtension: "txt", subdirectory: "outputs")  else {
                print("Input/Output files not found.")
                return
        }

        // Read input files
        for input in inputUrls {
            do {
                let contents = try String(contentsOf: input, encoding: String.Encoding.utf8)
                inputs.append(contents)
                let contentLines = contents.components(separatedBy: "\n").map{ String($0) }
                lines += contentLines
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }

        // Read output files
        for output in outputUrls {
            do {
                let contents = try String(contentsOf: output, encoding: String.Encoding.utf8)
                outputs.append(contents)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        if displayMetrics {
            print(inputs)
            print(lines)
            print(outputs)
        }

        // Gather Solutions
        var count:UInt32 = 0
        let methods = class_copyMethodList(HackerRank.self, &count)
        var methodNames = [String]()
        for i in 0..<Int(count) {
            let methName = method_getName(methods![i]).description
            methodNames.append(methName)
        }
        free(methods)
        solutions = methodNames.filter({$0.hasPrefix("solution")}).sorted()
        print(solutions)
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

}

public protocol Problem {
    //func inputs() -> [String]
}

public protocol Solution {
    func solve()
}
