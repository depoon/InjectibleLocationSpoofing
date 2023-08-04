//
//  LocationSwizzler.swift
//  LocationSpoofing
//
//  Created by Kenneth Poon on 28/11/16.
//  Copyright © 2016 Kenneth Poon. All rights reserved.
//

import Foundation
import CoreLocation

@objc public class LocationSwizzler: NSObject {

    static var currentLocation = CLLocationCoordinate2DMake(1.293760, 103.853709) //Raffles City

    static var originalMethod: Method?
    static var swizzleMethod: Method?

    static var originalDelegate: CLLocationManagerDelegate?

    @objc static public func turnOnSwizzleForCoordinate() {
        print("turnOnSwizzle")

        guard let m1 = class_getInstanceMethod(CLLocation.self, #selector(getter: CLLocation.coordinate)) else { return }
        guard let m2 = class_getInstanceMethod(self, #selector(self.fakeCoordinate)) else { return }
        method_exchangeImplementations(m1, m2)
    }

    @objc public func fakeCoordinate() -> CLLocationCoordinate2D {
        return LocationSwizzler.currentLocation
    }

}
