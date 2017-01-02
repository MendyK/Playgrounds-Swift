//: Playground - noun: a place where people can play
//https://www.weheartswift.com/tuples-enums/

import UIKit


/** 10.3
 1) Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
 2) Define an enumeration named MatchResult with three members: .win, .draw, .lose.
 3) write a function called match that takes two hand shapes and returns a match result. It should return the outcome for the first player (the one with the first hand shape).
 */

enum HandShape{
    case rock
    case paper
    case scissors
}

enum MatchResult{
    case win
    case lose
    case draw
}

func match(_ first: HandShape, _ second: HandShape) -> MatchResult
{
    if(first == second){
        return MatchResult.draw
    }
    
    switch first {
    case .rock:
        if second == .paper { return .lose }
    case .paper:
        if second == .scissors { return .lose }
    case .scissors:
        if second == .rock { return .lose }
    }
    return .win
}
match(.scissors, .scissors)
match(.rock, .paper)
match(.rock, .scissors)


/** 10.4 Fractions
 You are given 2 tuples of a, b type (Int,Int) representing fractions. The first value in the tuple represents the numerator, the second value represents the denominator. Create a new tuple sum of type (Int,Int) that holds the sum of the fractions
*/
func addFractions(fraction1: (Int, Int), fraction2: (Int, Int)) -> (Int, Int)
{
    let commonDenominator = fraction1.1 * fraction2.1
    return ((fraction1.0 * fraction2.1 + fraction2.0 * fraction1.1), commonDenominator)
}
print(addFractions(fraction1: (2,5), fraction2: (3,10)))

/**10.5 Money
 You are given the CoinType enumeration which describes different coin values and moneyArray which has tuples(ammount, coinType). Print the total value of the coins in the array.
 */
enum CoinType: Double
{
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.10
    case quarter = 0.25
}
var moneyArray:[(Int,CoinType)] = [(10,.penny),
                                   (15,.nickel),
                                   (3,.quarter),
                                   (20,.penny),
                                   (3,.dime),
                                   (7,.quarter)]
var sum = 0.0
for (amount, coinType) in moneyArray{
    sum += Double(amount) * coinType.rawValue
}
print(sum)


/** 10.6 Counting Strings
 You are given an array of strings stored in the variable strings. Create a new array named countedStrings containing values of type (String,Int). Each tuple contains a string from the strings array followed by an integer indicating how many times it appears in the strings array. Each string should only appear once in thecountedStrings array.
 */
var strings = ["tuples", "are", "awesome", "tuples", "are", "cool",
               "tuples", "tuples", "tuples", "shades"]
var countedStrings: [(String,Int)] = []

for newElement in strings
{
    var alreadyAdded = false
    
    for j in 0..<countedStrings.count{
        if newElement == countedStrings[j].0 {
            countedStrings[j].1 += 1
            alreadyAdded = true
        }
    }
    
    if !alreadyAdded {
        countedStrings.append((newElement, 1))
    }
}
print(countedStrings)

