//
//  MapController.swift
//  SampleCode
//
//  Created by klwx on 2017/9/8.
//  Copyright © 2017年 wufan. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.mapType = .standard
        mapView.showsUserLocation = true
    }

}

extension MapController: MKMapViewDelegate {
    
}
