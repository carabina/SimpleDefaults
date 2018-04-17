//
//  SimpleDefaultsTests.swift
//  SimpleDefaultsTests
//
//  Created by 刘栋 on 2018/4/17.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import XCTest
@testable import SimpleDefaults

class SimpleDefaultsTests: XCTestCase {
    
    private enum Gender: Int, Codable, Hashable {
        case male
        case female
    }
    
    private struct Persion: Codable, Hashable {
        let name: String
        let gender: Gender
    }
    
    let defaults = Defaults(userDefaults: .standard)
    
    func testCustomCodable() {
        let persion1 = Persion(name: "Jack Ma", gender: .male)
        let persion2 = Persion(name: "Elon Musk", gender: .male)
        let persion3 = Persion(name: "Margaret Heafield Hamilton", gender: .female)
        
        let persionKey = Key<Persion>("Persion_Key")
        let persionListKey = Key<[Persion]>("Persion_List_Key")
        
        let persions = [persion1, persion2, persion3]
        
        // Persion Set & Get
        for persion in persions {
            defaults.set(persion, for: persionKey)
            guard let _persion = defaults.get(for: persionKey) else {
                fatalError("Can't find key:\(persionKey)")
            }
            XCTAssert(_persion == persion)
        }
        
        // PersionList Set & Get
        defaults.set(persions, for: persionListKey)
        guard let _persions = defaults.get(for: persionListKey) else {
            fatalError("Can't find key:\(persionListKey)")
        }
        XCTAssert(_persions == persions)
    }
    
    func testSwiftCodable() {
        let string: String = "Hello World!"
        let stringKey = Key<String>("String_Key")
        
        let int: Int = 100
        let intKey = Key<Int>("Int_key")
        
        let bool: Bool = true
        let boolKey = Key<Bool>("Bool_Key")
        
        let float: Float = 100.0
        let floatKey = Key<Float>("Float_Key")
        
        let double: Double = 100.0
        let doubleKey = Key<Double>("Double_Key")
        
        // String Set & Get
        defaults.set(string, for: stringKey)
        guard let _string = defaults.get(for: stringKey) else {
            fatalError("Can't find key:\(stringKey)")
        }
        XCTAssert(_string == string)
        
        // Int Set & Get
        defaults.set(int, for: intKey)
        guard let _int = defaults.get(for: intKey) else {
            fatalError("Can't find key:\(intKey)")
        }
        XCTAssert(_int == int)
        
        // Bool Get & Set
        defaults.set(bool, for: boolKey)
        guard let _bool = defaults.get(for: boolKey) else {
            fatalError("Can't find key:\(boolKey)")
        }
        XCTAssert(_bool == bool)
        
        // Float Get & Set
        defaults.set(float, for: floatKey)
        guard let _float = defaults.get(for: floatKey) else {
            fatalError("Can't find key:\(floatKey)")
        }
        XCTAssert(_float == float)
        
        // Double Get & Set
        defaults.set(double, for: doubleKey)
        guard let _double = defaults.get(for: doubleKey) else {
            fatalError("Can't find key:\(doubleKey)")
        }
        XCTAssert(_double == double)
    }
    
    func testFoundationCodable() {
        let date = Date()
        let dateKey = Key<Date>("Date_Key")
        
        // Date Get & Set
        defaults.set(date, for: dateKey)
        guard let _date = defaults.get(for: dateKey) else {
            fatalError("Can't find key:\(dateKey)")
        }
        XCTAssert(_date == date)
    }
}
