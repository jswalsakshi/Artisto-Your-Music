//
//  ArrayExtension.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 12/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index]: nil
    }
}
