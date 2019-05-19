//
//  ViewController.swift
//  myapi
//
//  Created by 馬馬桑 on 2019/5/17.
//  Copyright © 2019  kfvzfur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animal:Animal!
    @IBOutlet weak var vcimage: UIImageView!
    
    @IBOutlet weak var vcremark: UILabel!
    @IBOutlet weak var vcopendate: UILabel!
    @IBOutlet weak var vcsterilization: UILabel!
    @IBOutlet weak var vccaption: UILabel!
    @IBOutlet weak var vcbodytype: UILabel!
    @IBOutlet weak var vctel: UILabel!
    @IBOutlet weak var vccolor: UILabel!
    @IBOutlet weak var vcsex: UILabel!
    @IBOutlet weak var vcaddress: UILabel!
    @IBOutlet weak var vcshelter: UILabel!
    @IBOutlet weak var vcid: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ee = Bundle.main.url(forResource: "大圖", withExtension: "png")
        let eq = URL(string: animal.album_file!)
        let task = URLSession.shared.dataTask(with: eq ?? ee!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    
                    self.vcimage.image = UIImage(data: data)
                    self.vcid.text = "編號："+String(self.animal.animal_id)
                    self.vcsex.text = "性別：" + self.animal.animal_sex
                    self.vccolor.text = "顏色：" + self.animal.animal_colour
                    self.vcaddress.text = "地址：" + self.animal.shelter_address!
                    self.vcbodytype.text = "體型：" + self.animal.animal_bodytype
                    self.vccaption.text = "疫苗情況：" + self.animal.animal_bacterin!
                    self.vcsterilization.text = "絕育：" + self.animal.animal_sterilization!
                    self.vctel.text = "連絡電話" + self.animal.shelter_tel!
                    self.vcshelter.text = "收容所：" + self.animal.shelter_name!
                    self.vcopendate.text = "開放認養時間：" + self.animal.animal_opendate!
                    self.vcremark.text = "備註：" + self.animal.animal_remark!
                }
            }
            
        }
        task.resume()
    }

    
}

