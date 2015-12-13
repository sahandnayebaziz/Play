//
//  PlayColors.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit

struct PlayColors {
    private static func createColorFromRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var lightGray: UIColor {
        return createColorFromRGB(239, g: 239, b: 239)
    }
}