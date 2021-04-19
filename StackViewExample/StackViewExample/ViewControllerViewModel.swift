//
//  ViewControllerViewModel.swift
//  StackViewExample
//
//  Created by Pablo Blanco Peris on 03/02/2021.
//  Copyright © 2021 Pablo Blanco Peris. All rights reserved.
//

import Foundation

protocol VcViewModel {
    func getSections() -> [Section]
}

class ViewControllerViewModel : VcViewModel {
    
    let views1 = [
        TitleViewModel(title: "Title 1", subtitles: [SubtitleViewModel(subtitle: "Subtitle 1", details: [DetailViewModel(detail: "Detail 1"), DetailViewModel(detail: "Detail 2"), DetailViewModel(detail: "Detail 3")]), SubtitleViewModel(subtitle: "Subtitle 2", details: [])])
    ]
    
    let views2 = [
        TitleViewModel(title: "Title 2", subtitles: [SubtitleViewModel(subtitle: "Subtitle 3", details: [DetailViewModel(detail: "Detail 5"), DetailViewModel(detail: "Detail 6")])])
    ]
    
    let views3 = [
        TitleViewModel(title: "Title 3", subtitles: [SubtitleViewModel(subtitle: "Subtitle 4", details: [DetailViewModel(detail: "Detail 7"), DetailViewModel(detail: "Detail 8"), DetailViewModel(detail: "Detail 9")])]),
        TitleViewModel(title: "Title 4", subtitles: [SubtitleViewModel(subtitle: "Subtitle 5", details: [DetailViewModel(detail: "Detail 10")]), SubtitleViewModel(subtitle: "Subtitle 5", details: [DetailViewModel(detail: "Detail 11"), DetailViewModel(detail: "Detail 12")])])
    ]
    
    
    func getSections() -> [Section] {
        let random = Int.random(in: 1...3)
        switch random {
        case 1: return getSections1()
        case 2: return getSections2()
        case 3: return getSections3()
        default: return getSections3()
        }
    }
    
    func getSections1() -> [Section] {
        return [.title(views1)]
    }
    
    func getSections2() -> [Section] {
        return [.title(views1), .separator(2), .title(views2)]
    }
    
    func getSections3() -> [Section] {
        return [.title(views1), .separator(2), .empty(10), .title(views2), .empty(20), .separator(2), .title(views3)]
    }
}
