//
//  Key.swift
//  SimpleDefaults
//
//  Created by 刘栋 on 2018/4/17.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

public struct Key<ValueType: Codable>: Hashable {
    
    let defaultName: String
    
    public init(_ defaultName: String) {
        self.defaultName = defaultName
    }
}

extension Key: CustomStringConvertible {
    
    public var description: String {
        return "Key(type:(\(String(describing: ValueType.self)),key:\(defaultName)"
    }
}
