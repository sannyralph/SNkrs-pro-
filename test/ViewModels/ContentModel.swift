//
//  ContentModel.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 22/06/2023.
//

import Foundation

import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject  {
    
    var  locationManager  = CLLocationManager()
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var sneakers = [Sneakers]()
    @Published var searchText = ""
    
    override init () {
        
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
//        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if  locationManager.authorizationStatus ==  .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
            
            
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        if  userLocation  != nil {
            
            locationManager.stopUpdatingLocation()
            
            func performSearch(searchText: String) {
                guard !searchText.isEmpty else {
                    // Show an alert or handle an empty search text
                    return
                }
            }
            getSneakerBrand(category: Constants.sneakersKey, location: userLocation!, searchText: searchText)
        }
        
        func getSneakerBrand(category:String, location:CLLocation, searchText: String) {
            
            var urlComponents = URLComponents(string: Constants.apiUrl )
                urlComponents?.queryItems = [
                    URLQueryItem(name: "limit", value: "10"),
                    URLQueryItem(name: "query", value: searchText)
                ]
            let url = urlComponents?.url
            
            if let url = url {
                
                let headers = [
                    "X-RapidAPI-Key": Constants.apiKey ,
                    "X-RapidAPI-Host": "the-sneaker-database.p.rapidapi.com"
                ]
                
                
                var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                
                let session = URLSession.shared
                let dataTask = session.dataTask(with: request) {(data, response, error) in
                    
                    if error == nil {
                       
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(SneakersSearch.self, from: data!)
                            
                            for s in result.results {
                                s.getImageData()
                            }
        
                            DispatchQueue.main.async {
                                if category == Constants.sneakersKey  {
                                    self.sneakers = result.results
                                }
                            }
                           
                        }
                        catch {
                            print(error)
                        }
                    }
                }
                dataTask.resume()
            }
                    
            }


    
    }
        
    }












    
   
