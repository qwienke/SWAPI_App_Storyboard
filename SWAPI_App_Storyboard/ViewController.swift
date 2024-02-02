//
//  ViewController.swift
//  SWAPI_App_Storyboard
//
//  Created by Quinn Wienke on 2/1/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    
    let peopleInfoController = PeopleInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star Wars character index"
        peopleLabel.text = ""
        heightLabel.text = ""
        birthYearLabel.text = ""
        homeworldLabel?.text = ""
        
        Task {
            do {
                let personInfo = try await
                peopleInfoController.fetchPeopleInfo()
                
                let resultsInfo = personInfo.results
                
                for person in resultsInfo {
                    self.peopleLabel.text = person.name
                    self.heightLabel.text = person.height
                    self.birthYearLabel.text = person.birthYear
                    self.homeworldLabel.text = person.homeworld
                }
            } catch {
                self.title = "Error fetching info"
            }
        }
        
    }
}
