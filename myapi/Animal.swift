
import Foundation

struct Animal: Codable{
    var animal_id:Int
    var animal_kind:String
    var animal_colour: String
    var animal_sex:String
    var anilmal_age:String?
    var animal_bodytype:String//體型
    var animal_sterilization:String? //絕育
    var animal_bacterin:String? //打過疫苗
    var animal_opendate:String?
   // var animal_update:String?
    var shelter_name:String? //所在收容所名稱
    var shelter_address:String? //地址
    var shelter_tel:String? //電話
    var cDate:String?//資料更新時間
    var animal_remark:String?
    var album_file:String?  //URL(fileURLWithPath: "http://ws3.sinaimg.cn/bmiddle/9150e4e5ly1fl77ly1f86j208c08cq36.jpg")
   
}

//struct Dog:Codable {
//    var dogs:[Animal]
//} //動物的流水編號、動物的區域編號、動物所屬縣市代碼、動物所屬收容所代碼、動物的實際所在地、動物的類型、動物性別、動物體型、動物毛色、動物年紀、是否絕育、是否施打狂犬病疫苗、動物尋獲地、動物網頁標題、動物狀態、資料備註、其他說明、開放認養時間(起)、開放認養時間(迄)、動物資料異動時間、動物資料建立時間、動物所屬收容所名稱、圖片名稱、異動時間、資料更新時間、地址、聯絡電話等欄位資訊。
//    animal_id": 54351,
//    "animal_subid": "LAAAG1070628A21",
//    "animal_area_pkid": 17,
//    "animal_shelter_pkid": 75,
//    "animal_place": "高雄市壽山動物保護教育園區",
//    "animal_kind": "狗",
//    "animal_sex": "F",
//    "animal_bodytype": "BIG",
//    "animal_colour": "白色",
//    "animal_age": "ADULT",
//    "animal_sterilization": "F",
//    "animal_bacterin": "F",
//    "animal_foundplace": "民有路",
//    "animal_title": "",
//    "animal_status": "OPEN",
//    "animal_remark": "",
//    "animal_caption": "",
//    "animal_opendate": "2018-06-28",
//    "animal_closeddate": "2999-12-31",
//    "animal_update": "2019/05/17",
//    "animal_createtime": "2018/06/28",
//    "shelter_name": "高雄市壽山動物保護教育園區",
//    "album_file": "http://asms.coa.gov.tw/amlapp/upload/pic/059dabca-3f40-44ef-bf0a-73f06f1290d1_org.JPG",
//    "album_update": "",
//    "cDate": "2019/05/17",
//    "shelter_address": "高雄市鼓山區萬壽路350號",
//    "shelter_tel": "07-5519059"

