//
//  Brain.swift
//  E-Phone
//
//  Created by Esraa Gamal on 9/18/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import Foundation

struct EPhoneBrain{
    
    //MARK:- Categories

    // Download Category From Firebase
    func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void){
        var categoryArray: [Category] = []
        Firebasereference(.Category).getDocuments { (snapshot, error) in
            guard let snapShot = snapshot else{
                completion(categoryArray)
                return
            }
            if !snapShot.isEmpty{
                for categDic in snapShot.documents{
                    categoryArray.append(Category(dictionary: categDic.data() as NSDictionary))
                }
            }
            completion(categoryArray)
        }
    }
    
    //Save Category Function
    func saveCategoryToFirebase(_ category : Category){
        let id = UUID().uuidString
        category.id = id
        Firebasereference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
    }

    //Helpers
    func categoryDictionaryFrom(_ category : Category) -> NSDictionary {
        return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [K.name as NSCopying,K.objectId as NSCopying,K.imageName as NSCopying])
    }


    //only used one time
//    func createCategorySet(){
//        let apple = Category(_name: "Apple", _imageName: "appleComp")
//        let samsung = Category(_name: "Samsung", _imageName: "samsungComp")
//        let oppo = Category(_name: "OPPO", _imageName: "oppoComp")
//        let huawei = Category(_name: "Huawei", _imageName: "huaweiComp")
//        let htc = Category(_name: "HTC", _imageName: "htcComp")
//        let lenovo = Category(_name: "Lenovo", _imageName: "lenovoComp")
//        let sony = Category(_name: "Sony", _imageName: "sonyComp")
//        let infinx = Category(_name: "Infinx", _imageName: "infinxComp")
//        let xiaomi = Category(_name: "Xiaomi", _imageName: "xiaomiComp")
//        let tecno = Category(_name: "Tecno", _imageName: "tecnoComp")
//
//        let categoriesArray = [apple, samsung, huawei, xiaomi ,oppo, htc, infinx, tecno, lenovo, sony]
//        for category in categoriesArray{
//            saveCategoryToFirebase(category)
//        }
//    }
    



}
