//
//  CollectionViewController.swift
//  myapi
//
//  Created by 馬馬桑 on 2019/5/18.
//  Copyright © 2019  kfvzfur. All rights reserved.
//

import UIKit

private let reuseIdentifier = "mycell"

class CollectionViewController: UICollectionViewController {
    @IBOutlet weak var mysearch: UISearchBar!
    @IBOutlet weak var viewlayout: UICollectionViewFlowLayout!
    var searchController: UISearchController!
    var cats = [Animal]()
    var cats2 = [Animal]()
let fullScreenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController:nil)
        //tableView.tableHeaderView = searchController.searchBar
         //collectionView
    
        //調整上下左右的間距
        viewlayout.sectionInset = UIEdgeInsets(top: 15, left: 5, bottom: 5, right: 5)
        //用得到得手機大小來設置cell的大小
        viewlayout.itemSize = CGSize(width: fullScreenSize.width/2-10, height: 150)
        //cell之間的間距
        viewlayout.minimumLineSpacing = 5
        //設置畫面為上下捲動 vertical為上下捲動，horizontal為左右捲動
        viewlayout.scrollDirection = .vertical
       
        for i in cats
        {
            var j = i
            if j.animal_sex == "M"
            {
                j.animal_sex = "母"
            }
            else
            {
                j.animal_sex = "公"
            }
            if j.animal_sterilization == "F"
            {
                j.animal_sterilization = "無"
            }else{
                j.animal_sterilization = "有"
            }
            switch j.animal_bodytype
            {
            case "SMALL":
                j.animal_bodytype = "小型"
            case "BIG":
                j.animal_bodytype = "大型"
            case "MEDIUM":
                j.animal_bodytype = "中型"
                
            default: break
                
            }
            cats2.append(j)
        }
       //images.sort({ image1, image2 in return image1.fileID > image2.fileID })
        //cats2.sort(by: {Animal,Animal in return Animal.album_file> Animal.album_file})
        //用album_file排序將有照片的優先顯示
        cats2.sort { (Animal1, Animal2) -> Bool in
            Animal1.album_file! > Animal2.album_file!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //collectionView.indexPathsForSelectedItems
       
        //UICollectionView.IndexDisplayMode.RawValue.self
        
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell)
        {
           
            let animal = cats2[indexPath.row]
            let VC = segue.destination as! ViewController
            VC.animal = animal
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cats.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
     
       
        // Configure  // Configure the cell...
        
       
        let cat = cats2[indexPath.row]
        cell.tag = indexPath.row
        cell.celllable.text = cat.animal_bodytype
    // cell.cellimage.image = UIImage(named: )
        // 抓圖
       // URL(string: "#imageLiteral(resourceName: "大圖.png")")
      // let ee = URL(string: "https://ws3.sinaimg.cn/bmiddle/9150e4e5ly1fl77ly1f86j208c08cq36.jpg")
        let ee = Bundle.main.url(forResource: "大圖", withExtension: "png")
        let eq = URL(string: cat.album_file!)
        let task = URLSession.shared.dataTask(with: eq ?? ee!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    if cell.tag == indexPath.row{
                        cell.cellimage.image = UIImage(data: data)
                        
                    }
                }
              }
            
           }
           task.resume()
        
        return cell
        
      }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
