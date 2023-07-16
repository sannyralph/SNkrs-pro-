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
            
            getSneakerBrand(category: "sneakers", location: userLocation!)
        }
        
        func getSneakerBrand(category:String, location:CLLocation) {
            
            var urlComponents = URLComponents(string: "https://the-sneaker-database.p.rapidapi.com/search")
                urlComponents?.queryItems = [
                    URLQueryItem(name: "limit", value: "10"),
                    URLQueryItem(name: "query", value: category)
                ]
            let url = urlComponents?.url
            
            if let url = url {
                
                let headers = [
                    "X-RapidAPI-Key": "ece864edddmsh5dcae587fc1ab20p11d986jsn00085470bb28",
                    "X-RapidAPI-Host": "the-sneaker-database.p.rapidapi.com"
                ]
                
                
                var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                
                let session = URLSession.shared
                let dataTask = session.dataTask(with: request) {(data, response, error) in
                    
                    if error == nil {
                        print(response as Any)
                    }
                }
                dataTask.resume()
            }
                    
            }


    
    }
        
    }












    
   
