//
//  DetailView.swift
//  StackViewExample
//
//  Created by Pablo Blanco Peris on 03/02/2021.
//  Copyright © 2021 Pablo Blanco Peris. All rights reserved.
//

import UIKit

struct DetailViewModel {
    var detail : String
}

class DetailView : UIView, NibLoadableView {
    
    @IBOutlet weak var detail: UILabel!
    
    
    func configure(with viewModel : DetailViewModel) {
        detail.text = viewModel.detail
    }
}
