//
//  Filter.swift
//  FilterAppDemo
//
//  Created by iMac on 09/03/2023.
//

import Foundation
import CoreImage

public struct Filter {
    let name: String
    let ciFilterName: String?

    public init(name: String, ciFilterName: String?) {
        self.name = name
        self.ciFilterName = ciFilterName
    }
}

extension Filter: Equatable {
    public static func ==(lhs: Filter, rhs: Filter) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Filter {
    static var all: [Filter] = [
        Filter(name: "Normal", ciFilterName: nil),
        Filter(name: "Instant", ciFilterName: "CIPhotoEffectInstant"),
        Filter(name: "Transfer", ciFilterName: "CIPhotoEffectTransfer"),
        Filter(name: "Tone", ciFilterName: "CILinearToSRGBToneCurve"),
        Filter(name: "Linear", ciFilterName: "CISRGBToneCurveToLinear"),
        Filter(name: "Sepia", ciFilterName: "CISepiaTone"),
    ]
}
