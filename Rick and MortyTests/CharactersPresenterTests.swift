//
//  CharactersPresenterTests.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class CharactersPresenterTests: XCTestCase {

    var sutView: CharactersViewMock?
    var sutRepository: CharacterRepositoryMock!
    var sutCoordinator: BaseCharactersCoordinatorMock!
    var sut: CharactersPresenter?
    
    override func setUpWithError() throws {
        sutView = CharactersViewMock()
        sutRepository = CharacterRepositoryMock()
        sutCoordinator = BaseCharactersCoordinatorMock()
        sut = CharactersPresenter(view: sutView, characterRepository: sutRepository, coordinator: sutCoordinator)
    }

    override func tearDownWithError() throws {
        sutView = nil
        sutRepository = nil
        sutCoordinator = nil
        sut = nil
    }

    func test_fetchCharacters() throws {
        
        //GIVEN
        let request = Character.FetchCharacters.Request()
        
        //WHEN
        sutRepository.expectation = self.expectation(description: "fetchCharacters")
        
        sut?.fetchCharacters(request: request)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        //THEN
        XCTAssertTrue(sutView?.starLoadingIsCalled ?? false, "view.starLoading is not called")
        XCTAssertTrue(sutRepository.fetchCharactersIsCalled, "characterRepository.fetchCharacters is not called")
                
        XCTAssertTrue(sutView?.stopLoadingIsCalled ?? false, "view.stopLoading is not called")
        XCTAssertTrue(sutView?.displayFetchCharactersIsCalled ?? false, "view.displayFetchCharactersIsCalled is not called")
    }

    func test_navigationDetail() throws {
        
        //GIVEN
        let character = Character.CharacterModel(
            id: 0, name: "rick", status: .alive,
            species: "Human", type: "", gender: "Male",
            origin: Character.LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
            location: Character.LocationModel(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"],
            url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z"
        )
        
        //WHEN
        sut?.navigationDetails(character: character)
        
        //THEN
        XCTAssertTrue(sutCoordinator.navigateIsCalled, "coordinator.navigate is not called")
    }

}
