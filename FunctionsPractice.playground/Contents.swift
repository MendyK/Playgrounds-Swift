/*
 Some function and closure excersies I did while learning Swift 3
 Excercises found here - https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/
 
 */

import UIKit

//1. Write a function applyTwice(f:(Float -> Float),x:Float) -> Float that takes a function f and a float x and aplies f to x twice i.e. f(f(x))
func applyTwice(f: (Float) -> Float, x: Float) -> Float
{
    return f(f(x))
}
func square (i : Float) -> Float
{
    return i * i
}
let appTwiceTest = applyTwice(f: square, x: 4)



//2. Write a function applyKTimes(f:(Float -> Float),x:Float,k:Int) -> Float that takes a function f and a float x and aplies f to x k times
func applyKTimes(f:(Float) -> Float, x: Float, k: Float) -> Float
{
    if(k > 1){
        return applyKTimes(f: f, x: f(x), k: k - 1)
    }else{
        return f(x)
    }
}
let applyKtimesTest = applyKTimes(f: square, x: 2, k: 3) //Square 2 three times i.e. ((2^2)^2)^2



//3. Using applyKTimes write a function that raises x to the kth power
func raise(_ number: Float, toPower power: Int) -> Float
{
    return applyKTimes(f: { number * $0 }, x: number, k: Float(power) - 1)
}
let exponentTest = raise(2, toPower: 9)



//4. Given an array of Users which have properties name:String and age:Int write a map function that returns an array of strings consisting of the user’s names

let users = [("Chris", 20), ("Steve", 11), ("Joe", 15)] //Array containing tuples
let names = users.map({ $0.0 })
names



// 5. Given an array of of dictionaries containing keys for “name” and “age” write a map function that returns an array of users created from it
func mkMap(dicts: [Dictionary<String, Int>]) -> [(String, Int)]
{
    //We'll use tuples here again
    var users = [(String, Int)]()
    for dict in dicts{
        for(name, age) in dict{
            users.append(name, age)
        }
    }
    return users
}

let dict1 = ["Norman": 11, "Chad": 12]
let dict2 = ["Harry": 90, "John": 49, "Mary" : 33]
let dict3 = ["Hope": 23, "Norma": 35, "Jen" : 44]
let arrayOfDicts = [dict1, dict2, dict3]
let usersArray = mkMap(dicts: arrayOfDicts)
print(usersArray)



// 6. Given an array of numbers write a filter method that only selects odd integers
let numsArray = [13,2,4,5,7,2,234,463,62,46,66,26,73,74,524,534526,2346,27,234,5,23]
let oddInts = numsArray.filter({ $0 % 2 != 0 } )
oddInts



// 7. Given an array of strings write a filter function that selects only strings that can be converted to Ints
let strings = ["A", "3", "34", "h", "yyy", "3552", "werr", "10", "8", "4444"]
let convertableStrings = strings.filter({ Int($0) != nil })
convertableStrings



// 8. Given an array of UIViews write a filter function that selects only those views that are a subclass of UILabel
//Create a few UIViews
class View1 : UIView{}
class View2 : UIView{}
class View3 : UILabel{}
class View4 : UILabel {}
let v1 = View1.init(frame: CGRect.zero)
let v2 = View2.init(frame: CGRect.zero)
let v3 = View3.init(frame: CGRect.zero)
let v4 = View4.init(frame: CGRect.zero)
let views = [v1, v2, v3, v4]
let subclassesOfUILabel = views.filter { $0 is UILabel }

for subclass in subclassesOfUILabel{ // Test the filter
    if let sc = subclass as? UILabel {
        type(of:sc)
    }
}



// 9. Write a reduce function that takes an array of strings and returns a single string consisting of the given strings separated by newlines
let countries = ["USA", "Canada", "Russia", "Japan", "Australia", "India", "Brazil"]
let reducedCountries = countries.reduce("") { $0 + "\n" + $1 }
print(reducedCountries)



//10. Write a reduce function that finds the largest element in an array of Ints
let ages = [13,42,4,25,15,2,52,34,23,6,24,45,55,78,2,4,2,4]
let oldest = ages.reduce(0) { (largest: Int, current: Int) -> Int in
    return current > largest ? current : largest
}
//OR
let oldestOption2 = ages.reduce(0) { $1 > $0 ? $1 : $0 }
oldest
oldestOption2





