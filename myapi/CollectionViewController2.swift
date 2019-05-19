//
//  CollectionViewController2.swift
//  myapi
//
//  Created by 馬馬桑 on 2019/5/18.
//  Copyright © 2019  kfvzfur. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell2"

class CollectionViewController2: UICollectionViewController{
    @IBOutlet weak var myactivity: UIActivityIndicatorView!
    @IBOutlet weak var outley2: UICollectionViewFlowLayout!
    let fullScreenSize = UIScreen.main.bounds.size
    var animals = [Animal]()
    var allkind = Set<String>()
    var allkinds = [String]()
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //.headerReferenceSize =
        //outley2.headerReferenceSize = self.UISearchController
        //outley2.header = self.searchController.searchBar
        outley2.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
        //用得到得手機大小來設置cell的大小
        outley2.itemSize = CGSize(width: fullScreenSize.width/2-15, height: 150)
        //cell之間的間距
        outley2.minimumLineSpacing = 15
        //設置畫面為上下捲動 vertical為上下捲動，horizontal為左右捲動
        outley2.scrollDirection = .vertical
        if let urlstring = "http://data.coa.gov.tw/Service/OpenData/TransService.aspx?UnitId=QcbUEzN6E6DL".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url  = URL(string: urlstring)
        {
           
            let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                if let data = data{
                    let decoder = JSONDecoder()
                    
                    if let animal = try? decoder.decode([Animal].self, from: data)
                    {
                        
                        self.animals = animal
                       
                        //找出動物種類來設cell數量
                        for i in self.animals
                        {
                             self.allkind.insert(i.animal_kind)
                          
                        }
                        
                        for i in self.allkind
                        {
                            self.allkinds.append(i)
                        }
                        DispatchQueue.main.async
                            {
                                self.collectionView.reloadData()
                                self.myactivity.stopAnimating()
                        }
                    }
                    else
                    {
                        print("error")
                        
                    }
                    
                }
            }
            task.resume()
        }
       
          myactivity.startAnimating()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell)
        {
            var qq = [Animal]()
            let animalkind = allkinds[indexPath.row]
            for i in animals
            {
                if i.animal_kind == animalkind
                {
                    qq.append(i)
                }
            }
           let VC = segue.destination as! CollectionViewController
               VC.cats = qq
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
       
        return allkind.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ViewCell2
        var url = ""
        let kind = allkinds[indexPath.row]
          cell.cell2lable.text = kind
        //重陣列內取一張圖當同kind的首圖
        for i in animals
        {
            if kind == i.animal_kind && i.album_file != "N"
            {
                url = i.album_file!
            }
        }
        let ee = Bundle.main.url(forResource: "大圖", withExtension: "png")
        let eq = URL(string:url)
        let task = URLSession.shared.dataTask(with: eq ?? ee!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    
                    cell.cell2image.image = UIImage(data: data)
                }
            }
            
        }
        task.resume()
        
        return cell
    }

   

}
