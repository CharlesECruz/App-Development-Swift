//
//  Todo.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import Foundation

struct Priority {
    var tasks: [Todo]
}

struct Todo: Equatable {
    let title: String
    let priority: priority
    let completed: Bool
    
    enum priority {
        case low, medium, high
    }
    static func ==(lhs: Todo, rhs: Todo) -> Bool {
        return lhs.title == rhs.title 
    }
}

extension Todo.priority: RawRepresentable {
    typealias RawValue = Int
    
    init?(rawValue myRaw: Int) {
        switch myRaw {
            case 2:
                self = .low
            case 1:
                self = .medium
            default:
                self = .high
            return nil
        }
    }
    
    var rawValue: Int {
        switch self {
            case .low:
                return 2
            case .medium:
                return 1
            case .high:
                return 0
        }
    }
}
