//
//  ContentModel.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/22/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init () { getLocalData() }
    
    func getLocalData() {
        
        //assign a url for the json data
        //instead of Bundle.main.path we're using .url which returns and optional url
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //read the file into an array of Modules
            let jsonData = try Data(contentsOf: jsonURL!)
            //try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            //assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            //Log error
            print("Couldn't parse local data.")
        }
        
        // Pars the HTML data
        let htmlURL = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleURL)
            self.styleData = styleData
        }
        catch {
            //Catch error
            print("Couldn't parse style data.")
        }
        
    }
    
}
