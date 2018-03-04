//
//  MealDescriptionController.swift
//  Ifood
//
//  Created by Abdelrahman ElJazzar on 3/4/18.
//  Copyright © 2018 Abdelrahman ElJazzar. All rights reserved.
//

import UIKit
import FSPagerView
class MealDescriptionController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{
    private let reuseIdentifier = "MealImageCell"
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    @IBOutlet weak var mealPagerCollection: UICollectionView!
    @IBOutlet weak var dotsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
     initView()
    }
    func initView(){
        
        mealPagerCollection.dataSource = self
        mealPagerCollection.dataSource = self
        dotsCollection.dataSource = self
        dotsCollection.delegate = self
//        mealPagerCollection.register(MealImageCell.self , forCellReuseIdentifier: reuseIdentifier)
       
    }
 // MARK: - CoolectionView Methods.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MealImageCell
        
        cell.mealImg.image = UIImage(named: imageNames[indexPath.row])
        
        return cell
    }
 

}
