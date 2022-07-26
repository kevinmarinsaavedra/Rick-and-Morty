//
//  EpisodesPresenterTests.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class EpisodesPresenterTests: XCTestCase {

    var sutView: EpisodesViewMock?
    var sutRepository: EpisodeRepositoryMock!
    var sutCoordinator: BaseEpisodesCoordinatorMock!
    var sut: EpisodesPresenter?
    
    override func setUpWithError() throws {
        sutView = EpisodesViewMock()
        sutRepository = EpisodeRepositoryMock()
        sutCoordinator = BaseEpisodesCoordinatorMock()
        sut = EpisodesPresenter(view: sutView, episodeRepository: sutRepository, coordinator: sutCoordinator)
    }

    override func tearDownWithError() throws {
        sutView = nil
        sutRepository = nil
        sutCoordinator = nil
        sut = nil
    }

    func test_fetchEpisodes() throws {
        
        //GIVEN
        let request = Episode.FetchEpisodes.Request()
        
        //WHEN
        sutRepository.expectation = self.expectation(description: "fetchEpisodes")
        
        sut?.fetchEpisodes(request: request)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        //THEN
        XCTAssertTrue(sutView?.starLoadingIsCalled ?? false, "view.starLoading is not called")
        XCTAssertTrue(sutRepository.fetchEpisodesIsCalled, "episodeRepository.fetchEpisodes is not called")
                
        XCTAssertTrue(sutView?.stopLoadingIsCalled ?? false, "view.stopLoading is not called")
        XCTAssertTrue(sutView?.displayFetchEpisodesIsCalled ?? false, "view.displayFetchEpisodesIsCalled is not called")
    }
    
    func test_navigationDetail() throws {
        
        //GIVEN
        let episode = Episode.EpisodeModel(
            id: 0, name: "Earth (C-137)", airDate: "Planet", episode: "Dimension C-137",
            characters: ["https://rickandmortyapi.com/api/character/38"],
            url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:42:04.162Z"
        )
        
        //WHEN
        sut?.navigationDetails(episode: episode)
        
        //THEN
        XCTAssertTrue(sutCoordinator.navigateIsCalled, "coordinator.navigate is not called")
    }
}
