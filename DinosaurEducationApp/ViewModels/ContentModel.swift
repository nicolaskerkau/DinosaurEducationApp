//
//  ContentModel.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/22/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    // Data
    @Published var modules = [Module]()
    var styleData: Data?
    
    // Module tracking
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    init () { getLocalData() }
    
    //MARK: Data methods
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
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleURL!)
            self.styleData = styleData
        }
        catch {
            //Catch error
            print("Couldn't parse style data.")
        }
        
    }
    
    //MARK: Module Navogation Methods
    func beginModule(_ moduleid:Int) {
        // Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
