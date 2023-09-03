//
//  LogicalValidation.swift
//  BonusTrack
//
//  Created by Beamtan on 3/6/2566 BE.
//

import Foundation

public func validate(input: Int) -> Bool {
    
    let inputInArray: [String] = Array(String(input)).map { String($0) }
    
    /*
     1. input จะต้องมีความยาวมากกว่าหรือเท่ากับ 6 ตัวอักษร เช่น
        1. 17283 ❌
        2. 172839 ✅
     */
    if inputInArray.count < 6 {
        return false
    }
    
    /*
     2. input จะต้องกันไม่ให้มีเลขซ้ำติดกันเกิน 2 ตัว
        1. 111822 ❌
        2. 112762 ✅
     */
    var doubleTextCount = 0
    for i in 0..<(inputInArray.count - 1) {
        if inputInArray[i] == inputInArray[i+1] {
            doubleTextCount += 1
        }
        else {
            doubleTextCount = 0
        }
        if doubleTextCount == 2 {
            return false
        }
    }
    
    /*
     3. input จะต้องกันไม่ให้มีเลขเรียงกันเกิน 2 ตัว
         1. 123743 ❌
         2. 321895 ❌
         3. 124578 ✅
     */
    var doubleTextCount = 0
    let inputString = String(input)
    let inputArray = Array(inputString)
    
    for i in 0..<(inputArray.count - 1) {
        if inputArray[i] == inputArray[i + 1] {
            doubleTextCount += 1
            if doubleTextCount == 2 {
                return false
            }
        } else {
            doubleTextCount = 0
        }
    }

    /*
     4.input จะต้องกันไม่ให้มีเลขชุดซ้ำ เกิน 2 ชุด
         1. 112233 ❌
         2. 882211 ❌
         3. 887712 ✅
     */
    var consecutiveCount = 0
    for i in stride(from: 0, to: inputArray.count - 1, by: 2) {
        if inputArray[i] == inputArray[i + 1] {
            consecutiveCount += 1
            if consecutiveCount > 2 {
                return false
            }
        }
    }
    for i in stride(from: 1, to: inputArray.count , by: 2) {
        if inputArray[i] == inputArray[i + 1] {
            consecutiveCount += 1
            if consecutiveCount > 2 {
                return false
            }
        }
    }
    
    return true
}

// Bonus Track

// * เขียน program generate ตัวเลข Fibonacci (0, 1, 1, 2, 3, 5, 8, 13, …)
func generateFibonacci(_ n: Int) -> [Int] {
    var result = [Int]()
    if n <= 0 {
        return result
    }
    
    var a = 0
    var b = 1
    
    for _ in 1...n {
        result.append(a)
        let temp = a + b
        a = b
        b = temp
    }
    
    return result
}


// * เขียนโค้ดในการ filter array จาก array ของตัวเลข 2 ชุด โดยให้สมาชิกของ array ชุดแรก เหลือเพียงแค่สมาชิกที่มีอยู่ใน array ชุดที่สองเท่านั้น โดยห้ามใช้ function ที่มีอยู่ เช่น map, filter, contain, etc.
public func filterTwoArray(array1: [Int], array2: [Int]) -> [Int] {
    var filterArray: [Int] = []
    
    for numArray1 in array1 {
        for numArray2 in array2 {
            if numArray1 == numArray2 {
                filterArray.append(numArray2)
            }
        }
    }
    
    return filterArray
}
