//
//  CategoriesViewController.swift
//  UserDefaultsApplication
//
//  Created by Sarveshwar Reddy on 07/04/20.
//  Copyright © 2020 Sarveshwar Reddy. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items = ["1", "2", "3","1", "2", "3","1", "2", "3"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
        
    }

    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CategoriesCollectionViewCell

        cell.myLabel?.text = "Hello"
        print(items[indexPath.item])
           return cell
        
      
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
         
        
    }
}
