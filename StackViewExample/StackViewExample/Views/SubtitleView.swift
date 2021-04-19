//
//  SubtitleView.swift
//  StackViewExample
//
//  Created by Pablo Blanco Peris on 03/02/2021.
//  Copyright © 2021 Pablo Blanco Peris. All rights reserved.
//

import UIKit

struct SubtitleViewModel {
    var subtitle : String
    var details : [DetailViewModel]
}

class SubtitleView : UIView, NibLoadableView {
    
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    func configure(with viewModel : SubtitleViewModel) {
        subtitle.text = viewModel.subtitle
        viewModel.details.forEach { detail in self.addDetail(detail) }
    }
    
    func addDetail(_ detailViewModel : DetailViewModel) {
        let detailView = DetailView.instantiate()
        detailView.configure(with: detailViewModel)
        stack.addArrangedSubview(detailView)
    }
}
