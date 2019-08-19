//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChangingText{
    var currentFont: CGFloat = 17
    @IBOutlet weak var tableViewOutlet: UITableView!
    var movie = Movie.allMovies
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func textFont(fontSize: CGFloat) {
        currentFont = fontSize
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath) as? FontTableViewCell{
        
        cell.title?.text = movie[indexPath.row].name
        cell.subtitle?.text = "\(movie[indexPath.row].year)"

        cell.title?.font = UIFont.systemFont(ofSize: currentFont)
        cell.subtitle?.font = UIFont.systemFont(ofSize: currentFont)
            
        
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let fontVC = segue.destination as? FontViewController else {
            fatalError("Unexpected segue VC")
            
        }
        fontVC.delegate = self
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }


}

