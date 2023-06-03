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
    var count = 0
    for i in 0..<(inputInArray.count - 1) {
        
        if i >= 1 && inputInArray[i-1] == inputInArray[i+1]{
            count = 0
        }
        
        if Int(inputInArray[i])! + 1 == Int(inputInArray[i+1])! ||
            Int(inputInArray[i])! - 1 == Int(inputInArray[i+1])! {
            count += 1
        } else {
            count = 0
        }

        if count == 2 {
            return false
        }
    }

    /*
     4.input จะต้องกันไม่ให้มีเลขชุดซ้ำ เกิน 2 ชุด
         1. 112233 ❌
         2. 882211 ❌
         3. 887712 ✅
     */
    var duplicateDoubleTextCount = 0
    var isCounting = true
    for i in 0..<(inputInArray.count - 1) {
        if inputInArray[i] == inputInArray[i+1] && isCounting {
            duplicateDoubleTextCount += 1
            isCounting = false

        } else {
            isCounting = true
        }

        if duplicateDoubleTextCount == 3 {
            return false
        }
    }
    
    return true
}

// Bonus Track

// * เขียน program generate ตัวเลข Fibonacci (0, 1, 1, 2, 3, 5, 8, 13, …)
public func generateFibonanci(number n: Int) -> [Int] {
    guard n >= 2 else {
        return Array(0..<n)
    }
    
    var fibonanciList = [0, 1]
    for index in 2..<n {
        let nextFibonanci = fibonanciList[index - 1] + fibonanciList[index - 2]
        fibonanciList.append(nextFibonanci)
    }
    
    return fibonanciList
}


// * เขียนโค้ดในการ filter array จาก array ของตัวเลข 2 ชุด โดยให้สมาชิกของ array ชุดแรก เหลือเพียงแค่สมาชิกที่มีอยู่ใน array ชุดที่สองเท่านั้น โดยห้ามใช้ function ที่มีอยู่ เช่น map, filter, contain, etc.
public func filterTwoArray(array1: [Int], array2: [Int]) -> [Int] {
    var filteredArray1 = array1
    let filteredArray2 = array2
    var isFoundSameNum = false
    var currentIndex = 0
    
    while currentIndex < filteredArray1.count {
        for index2 in filteredArray2.indices {
            if filteredArray1[currentIndex] == filteredArray2[index2] {
                isFoundSameNum = true
            }
        }
        
        if !isFoundSameNum {
            filteredArray1.remove(at: currentIndex)
        } else {
            currentIndex += 1
        }
        
        isFoundSameNum = false
    }
    
    return filteredArray1
}
