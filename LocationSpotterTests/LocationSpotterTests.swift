//
//  LocationSpotterTests.swift
//  LocationSpotterTests
//
//  Created by Cameron Little on 1/30/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import UIKit
import XCTest
import CoreLocation
import CoreMotion

import LocationSpotter

class LocationSpotterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /*
    func testViewDidLoad() {
        // we only have access to this if we import our project above
        let v = CameraViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(v.view, "view did not load")
    }*/

    func testRadiansDegrees() {
        XCTAssertEqualWithAccuracy(radians(180), M_PI, 0.000001, "180 degrees doesn't equal pi radians")
        XCTAssertEqualWithAccuracy(radians(75), (5*M_PI)/12, 0.000001, "radians failed")
        XCTAssertEqualWithAccuracy(degrees(M_PI), 180, 0.000001, "180 degrees doesn't equal pi radians")
        XCTAssertEqualWithAccuracy(degrees((5*M_PI)/12), 75, 0.000001, "degrees failed")
    }
    
    func testInvalidElevationQuery() {
        let lat = -999.0
        let lng = 999.0
        let pos = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let elevation = getElevationAt(pos)
        
        XCTAssertNil(elevation, "invalid elevation not nil")
    }

    func testEstimateElevation() {
        let lat = 48.72277
        let lng = -122.489905
        let pos = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        XCTAssertEqualWithAccuracy(estimateElevation(400, 400, 0.1), 440.13386883418, 0.00001, "estimated elevation not accurate")
    }
    
    func testGetElevationAt() {
        let lat = 48.72277
        let lng = -122.489905
        let pos = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let elevation = getElevationAt(pos)
        
        XCTAssertNotNil(elevation, "elevation nil")
        
        XCTAssertEqual(elevation!, 61.80685043334961)
    }
    
    func testNewLocation() {
        let lat = 48.72277
        let lng = -122.489905
        let pos = CLLocation(latitude: lat, longitude: lng)
        
        let newLoc = newLocation(pos, 250, radians(12))
        
        XCTAssertEqualWithAccuracy(newLoc.coordinate.latitude, 48.7249703989242, 0.00001, "latitude not accurate")
        XCTAssertEqualWithAccuracy(newLoc.coordinate.longitude, -122.489195998955, 0.00001, "longitude not accurate")
    }
    
}
