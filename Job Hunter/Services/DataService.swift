//
//  DataService.swift
//  Job Hunter
//
//  Created by Jerry Lai on 2021-04-01.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let instance = DataService()
    
    var featureJobs = [Job]()
    
    func getFeatureJobs(completion: @escaping (_ status: Bool)->()){
        
        AF.request("https://api.adzuna.com/v1/api/jobs/ca/search/1?app_id=\(APP_ID)&app_key=\(APP_KEY)&results_per_page=10&where=toronto&full_time=1").responseJSON { (res) in
            if res.error == nil{
                do {
                    guard let data = res.data else {
                        completion(false)
                        return
                    }
                    
                    guard let json = try? JSON(data: data) else {
                        completion(false)
                        return
                    }
                    
                    guard let results = json["results"].array else {
                        completion(false)
                        return
                    }
                    
                    for result in results{
                        let title = result["title"].stringValue
                        let url = result["redirect_url"].stringValue
                        let created = result["created"].stringValue
                        let lat = result["latitude"].stringValue
                        let lng = result["longitude"].stringValue
                        let location = result["location"]["display_name"].stringValue
                        let contract = result["contract_time"].stringValue
                        let company = result["company"]["display_name"].stringValue
                        let desc = result["description"].stringValue
                        
                        let job = Job(title: title, company: company, desc: desc, url: url, lat: lat, lng: lng, contract: contract, created: created, location: location)
                        
                        self.featureJobs.append(job)
                    }
                    
                    completion(true)
                    
                } catch {
                    completion(false)
                    print(error.localizedDescription)
                }
            }else{
                completion(false)
            }
        }
        
    }
    
}
