//
//  File.swift
//  Calculator
//
//  Created by neerajar on 29/01/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case times = "*"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
