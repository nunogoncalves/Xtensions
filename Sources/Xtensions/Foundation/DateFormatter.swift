//
//  DateFormatter.swift
//  Xtensions
//
//  Created by Nuno Gonçalves on 21/03/2020.
//  Copyright © 2020 Nuno Gonçalves. All rights reserved.
//
import Foundation

public extension DateFormatter {

    convenience init(format: String) {
        self.init()
        self.dateFormat = format
    }
}
