//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [[String:Any?]] = []
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 200
        getAPIData()
        
        
    }
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            //print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData() // reload data!
        }
    }

    // Protocol Stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create Restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]

        //print(restaurant)
        
        // Display phone of restaurant
        let phone = String(restaurant["phone"] as? String ?? "Not Found")
        cell.phone.text = phone
        
        // Display type of restaurant
        let type = restaurant["categories"] as! [[String: Any]]
        for temp in type{
            print(temp["alias"]!)
            cell.type.text = temp["alias"]! as! String
        }
        
        // Display review number
        /*let reviews = restaurant["review_count"] as! String
        cell.reviews.text = reviews
        */
        
        // Display ratings
        let rating = Double(restaurant["rating"] as? Int ?? 0)
        switch rating{
            case 5:
                cell.stars.image=UIImage(named: "regular_5")
            case 4.5:
                cell.stars.image=UIImage(named: "regular_4.5")
            case 4:
                cell.stars.image=UIImage(named: "regular_4")
            case 3.5:
                cell.stars.image=UIImage(named: "regular_3_half")
            case 3:
                cell.stars.image=UIImage(named: "regular_3")
            case 2.5:
                cell.stars.image=UIImage(named: "regular_2_half")
            case 2:
                cell.stars.image=UIImage(named: "regular_2")
            case 1.5:
                cell.stars.image=UIImage(named: "regular_1_half")
            default:
                break;
        }
       
        
        // Set Label to restaurant name for each cell
        cell.label.text = restaurant["name"] as? String ?? ""
        
        // set Image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        
        return cell
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


