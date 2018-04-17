//
//  Defaults.swift
//  SimpleDefaults
//
//  Created by 刘栋 on 2018/4/17.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

final public class Defaults {
    
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    public func clear(_ key: Key<String>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear(_ key: Key<Bool>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear(_ key: Key<Int>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear(_ key: Key<Float>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear(_ key: Key<Double>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear(_ key: Key<Date>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func clear<ValueType>(_ key: Key<ValueType>) {
        userDefaults.removeObject(forKey: key.defaultName)
    }
    
    public func get(for key: Key<String>) -> String? {
        return userDefaults.object(forKey: key.defaultName) as? String
    }
    
    public func get(for key: Key<Bool>) -> Bool? {
        return userDefaults.object(forKey: key.defaultName) as? Bool
    }
    
    public func get(for key: Key<Int>) -> Int? {
        return userDefaults.object(forKey: key.defaultName) as? Int
    }
    
    public func get(for key: Key<Float>) -> Float? {
        return userDefaults.object(forKey: key.defaultName) as? Float
    }
    
    public func get(for key: Key<Double>) -> Double? {
        return userDefaults.object(forKey: key.defaultName) as? Double
    }
    
    public func get(for key: Key<Date>) -> Date? {
        return userDefaults.object(forKey: key.defaultName) as? Date
    }
    
    public func get<ValueType>(for key: Key<ValueType>) -> ValueType? {
        guard let data = userDefaults.data(forKey: key.defaultName) else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(ValueType.self, from: data)
            return decoded
        } catch {
            #if DEBUG
            print(error)
            #endif
            return nil
        }
    }
    
    public func set(_ value: String, for key: Key<String>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set(_ value: Bool, for key: Key<Bool>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set(_ value: Int, for key: Key<Int>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set(_ value: Float, for key: Key<Float>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set(_ value: Double, for key: Key<Double>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set(_ value: Date, for key: Key<Date>) {
        userDefaults.set(value, forKey: key.defaultName)
    }
    
    public func set<ValueType>(_ value: ValueType, for key: Key<ValueType>) {
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(value)
            userDefaults.set(encoded, forKey: key.defaultName)
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
    }
}
