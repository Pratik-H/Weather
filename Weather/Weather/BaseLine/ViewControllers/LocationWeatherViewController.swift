//
//  LocationWeatherViewController.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit
import MapKit

class LocationWeatherViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    // MARK: Parameters
    var coordinates: CLLocationCoordinate2D?
    var titles: [String] = ["Location","Weather", "Temperature", "Feels Like", "Min Temperature", "Max Temperature", "Pressure", "Humidity", "Sea Level", "Visibility", "Wind", "Wind Degree", "Clouds"]
    
    var detials: [String: String]?
    var weatherDetails: WeatherAPISuccess? {
        didSet {
            detials = [
                "Location" : weatherDetails?.name ?? "",
                "Weather" : weatherDetails?.weather?.first?.main ?? "",
                "Temperature": "\(weatherDetails?.main?.temp ?? 0)",
                "Feels Like" : "\(weatherDetails?.main?.feelsLike ?? 0)",
                "Min Temperature" : "\(weatherDetails?.main?.tempMin ?? 0)",
                "Max Temperature" : "\(weatherDetails?.main?.tempMax ?? 0)",
                "Pressure" : "\(weatherDetails?.main?.pressure ?? 0)",
                "Humidity" : "\(weatherDetails?.main?.humidity ?? 0)",
                "Sea Level" : "\(weatherDetails?.main?.seaLevel ?? 0)",
                "Visibility" : "\(weatherDetails?.visibility ?? 0)",
                "Wind" : "\(weatherDetails?.wind?.speed ?? 0)",
                "Wind Degree" : "\(weatherDetails?.wind?.deg ?? 0)",
                "Clouds" : "\(weatherDetails?.clouds?.all ?? 0)"]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDatForCoordinates()
        navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchDatForCoordinates() {
        guard let coordinates = self.coordinates else {return}
        let model = WeatherAPIParameters(lat: coordinates.latitude, lon: coordinates.longitude)
        guard let parameters = convertModelToJSON(model: model) else {return}
        let api: WeatherAPIConfig = .getWeatherForLocation(parameters)
        WeatherAPIRouter.getData(ofURL: api) { [weak self] result in
            switch result {
                
                case .success(let data):
                    let weatherData = data.decodeData(ofType: WeatherAPISuccess.self)
                    self?.weatherDetails = weatherData
                case .failure(let error):
                    print(error.errorDescription)
            }
        }
    }
    
}


// MARK: - Extension
// MARK: UITableViewDelegate, UITableViewDataSource
extension LocationWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationWeatherTableViewCell") as? LocationWeatherTableViewCell else {return UITableViewCell()}
        cell.titleLabel.text = titles[indexPath.row]
        cell.valueLabel.text = detials?[titles[indexPath.row]]
        return cell
    }
    
    
}
