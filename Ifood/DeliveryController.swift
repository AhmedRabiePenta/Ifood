//
//  DeliveryController.swift
//  Ifood
//
//  Created by Abdelrahman ElJazzar on 3/1/18.
//  Copyright © 2018 Abdelrahman ElJazzar. All rights reserved.
//

import UIKit

class DeliveryController: UIViewController {

//    @IBOutlet weak var setDataView: UIView!
//    @IBOutlet weak var assoonView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var canselButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var delivaryView: UIView!
    @IBOutlet weak var assoonView: UIView!
    @IBOutlet weak var setDataView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    private func initView(){
        let todaysDate = Date()
        datePicker.minimumDate = todaysDate
        delivaryView.layer.cornerRadius = 10
        delivaryView.clipsToBounds = true
        canselButton.layer.cornerRadius = 10
        canselButton.clipsToBounds = true
        sendButton.layer.cornerRadius = 10
        sendButton.clipsToBounds = true
        setDataView.layer.cornerRadius = 5
        setDataView.clipsToBounds = true
        assoonView.layer.cornerRadius = 5
        assoonView.clipsToBounds = true
    }
}
