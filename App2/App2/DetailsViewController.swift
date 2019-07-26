//
//  DetailsViewController.swift
//  App2
//
//  Created by cda2019 on 2019-07-26.
//  Copyright © 2019 SMU. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var w_name: UILabel!
    @IBOutlet weak var w_desc: UILabel!
    @IBOutlet weak var w_rating: UILabel!
    @IBOutlet weak var w_coordinates: UILabel!
    @IBOutlet weak var w_imgeURL: UIImageView!
    
    var details: [Wonders] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        w_name.text = details[0].name
        w_desc.text = details[0].description ?? "Description (Empty)"
        w_rating.text = String(details[0].userRating)
        w_coordinates.text = "Lat: " + String(details[0].coordinates[0]) + " Long: " + String(details[0].coordinates[1])
        
        downloaded(from: URL(string: details[0].imageURL)!)
        // Do any additional setup after loading the view.
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.w_imgeURL.image  = image
            }
            }.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
