//
//  ViewController.swift
//  StackViewExample
//
//  Created by Pablo Blanco Peris on 03/02/2021.
//  Copyright © 2021 Pablo Blanco Peris. All rights reserved.
//

import UIKit

enum Section {
    case title([TitleViewModel])
    case separator(CGFloat)
    case empty(CGFloat)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var stack: UIStackView!
    
    var viewModel : VcViewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    func addViews() {
        let sections = viewModel.getSections()
        sections.forEach{ section in
            switch section{
            case .separator(let height): self.addSeparator(height)
            case .title(let titleViewModels): self.addTitles(titleViewModels)
            case .empty(let height): self.addEmpty(height)
            }
        }
    }
    
    func addTitles(_ titleViewModels : [TitleViewModel]) {
        titleViewModels.forEach{ titleViewModel in self.addTitle(titleViewModel) }
    }
    
    func addTitle(_ v : TitleViewModel) {
        let titleView = TitleView.instantiate()
        titleView.configure(with: v)
        stack.addArrangedSubview(titleView)
    }
    
    func addSeparator(_ height : CGFloat) {
        let container = UIView()
        let separator = UIView()
        
        container.addSubview(separator)
        stack.addArrangedSubview(container)

        separator.backgroundColor = .opaqueSeparator
        container.backgroundColor = .white
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: height).isActive = true
        separator.heightAnchor.constraint(equalToConstant: height).isActive = true
        separator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 16).isActive = true
        separator.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        separator.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
    }
    
    func addEmpty(_ height : CGFloat) {
        let empty = UIView()
        stack.addArrangedSubview(empty)
        empty.backgroundColor = .white
        empty.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
