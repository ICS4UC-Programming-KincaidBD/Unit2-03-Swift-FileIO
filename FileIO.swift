import Foundation

/*
    This program will open a file, read its contents, split each line into the numbers,
    if there is a word, it will display the correct error in the output file. but for the numbers, each line it will print the sum
*/ 

let inputFile = "/home/vscode/ICS4UC/Unit2/Unit2-03/Unit2-03-Swift-FileIO/input.txt"
let outputFile = "/home/vscode/ICS4UC/Unit2/Unit2-03/Unit2-03-Swift-FileIO/output.txt"

// while the input file has more lines
if let input = try? String(contentsOfFile: inputFile) {
    // parse n split the line into words
    let lines = input.split(separator: "\n")
    var output = "" // output to send to the output file
    // loop through parsed lines
    for line in lines {
        let components = line.split(separator: " ")
        var sum = 0
        var hasError = false
        // loop through each component in the line
        for component in components {
            // if the component is a number, add it to the sum, convert it to an integer
            if let number = Int(component) {
                sum += number
            } else {
                // if component isnt a number the output is set to an error message
                // then break out of the loop to avoid adding more numbers
                output += "Error: \(component) is not a number\n"
                hasError = true
                break
            }
        }
        // if there is no error it will output the sum
        if !hasError {
            output += "\(sum)\n"
        }
    }
    // write the output to the output file
    try? output.write(toFile: outputFile, atomically: true, encoding: .utf8)
}