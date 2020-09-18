//
//  FirebaseCollectionReference.swift
//  E-Phone
//
//  Created by Esraa Gamal on 9/18/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference : String {
    case User
    case Category
    case Items
    case Basket
}
func Firebasereference (_ FCollection: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(FCollection.rawValue)
}
