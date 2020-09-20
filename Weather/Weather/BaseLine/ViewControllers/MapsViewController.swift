//
//  MapsViewController.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {
    
    // MARK: - OutLet
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.isZoomEnabled = true
        }
    }
    
    // MARK: - IBAction
    @IBAction func locationTapGesture(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        guard let locationWeatherViewController = storyboard?.instantiateViewController(identifier: "LocationWeatherViewController") as? LocationWeatherViewController else {return}
        locationWeatherViewController.coordinates = coordinate
        
        navigationController?.pushViewController(locationWeatherViewController, animated: true)
    }
    
    // MARK: - Parameters
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
}
