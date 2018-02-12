//
//  InventoryLocationViewController.swift
//  LM Inventory
//
//  Created by Zachary Quemore on 2/11/18.
//  Copyright © 2018 Zachary Quemore. All rights reserved.
//

import UIKit
import Parse

class InventoryLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    var currentProject = ""
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var error:String = ""
    var Locations = [PFObject]()
    var LocationsNames = [String]()
    var NFLocationsNames = [String]()
    var SelectedLocation = ""
    
    
    @IBAction func AddLocationButton(_ sender: Any) {
    }
    
    @IBOutlet var LocationTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentProject
        print(currentProject)
        
        self.LocationTableView.dataSource = self
        self.LocationTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.SelectedLocation = ""
        self.LocationsNames.removeAll(keepingCapacity: true)
        self.Locations.removeAll(keepingCapacity: true)
        self.NFLocationsNames.removeAll(keepingCapacity: true)
        
        // Mark: -  Query
        
        let query = PFQuery(className: "Location")
        query.whereKey("Project", equalTo: currentProject)
        
        
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil{
                
                print("There is a error while searching please check internet connection")
                
                self.displayAlert("Location not found", error: "Please check internet conection")
                print(error as Any)
                
            }else if let objects = objects {
                //print(objects)
                
                //stops Activity Indicator
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                self.Locations.removeAll(keepingCapacity: true)
                for object in objects {
                    self.Locations.append(object)
                    
                    let Name: String = object["Name"] as! String
                    
                    
                    self.LocationsNames.append(Name)
                   
                    // print("location progress is \(self.LocationsProgress)")
                    self.LocationTableView.reloadData()
                    
                    
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
        
    }
    
    //Helper Methiods
    //this function creats and alert that you can display errors with
    func displayAlert(_ title:String,error:String){
        
        let alert = UIAlertController(title:title, message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
