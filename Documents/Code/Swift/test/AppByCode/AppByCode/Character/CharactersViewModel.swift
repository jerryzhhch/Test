//
//  CharactersViewModel.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/21/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol CharactersViewable {
    var charRelay: BehaviorRelay<[Character]> { get }
    func getCharacters()
}

class CharactersViewModel: CharactersViewable {

    private let apiService: APIServiceLayer
    var charRelay: BehaviorRelay<[Character]> = BehaviorRelay(value: [])
    var characters: [Character] = []

    init(apiService: APIServiceLayer = APIManager.shared) {
        self.apiService = apiService
    }

    func getCharacters() {
        apiService.getCharacters { [weak self] characters in
            guard let self = self else { return }
            self.characters = characters
            self.characters.sort(by: {
                guard let first = $0.name, let second = $1.name else { return false }
                return first < second
            })
            self.charRelay.accept(self.characters)
        }
    }
}
