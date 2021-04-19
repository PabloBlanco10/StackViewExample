//
//  TitleView.swift
//  StackViewExample
//
//  Created by Pablo Blanco Peris on 03/02/2021.
//  Copyright © 2021 Pablo Blanco Peris. All rights reserved.
//

import UIKit

struct TitleViewModel {
    var title : String
    var subtitles : [SubtitleViewModel]
}

class TitleView : UIView, NibLoadableView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    func configure(with viewModel : TitleViewModel) {
        title.text = viewModel.title
        viewModel.subtitles.forEach { subtitle in self.addSubtitle(subtitle) }
    }
    
    func addSubtitle(_ subtitleViewModel : SubtitleViewModel) {
        let subtitleView = SubtitleView.instantiate()
        subtitleView.configure(with: subtitleViewModel)
        stack.addArrangedSubview(subtitleView)
    }
}
