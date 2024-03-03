//
//  EpisodeDetailsPresenterTests.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class EpisodeDetailsPresenterTests: XCTestCase {

    var sutView: EpisodeDetailsViewMock?
    var sutRepository: EpisodeRepositoryMock!
    var sut: EpisodeDetailsPresenter?
    
    override func setUpWithError() throws {
        sutView = EpisodeDetailsViewMock()
        sutRepository = EpisodeRepositoryMock()
        sut = EpisodeDetailsPresenter(view: sutView, episodeRepository: sutRepository)
    }

    override func tearDownWithError() throws {
        sutView = nil
        sutRepository = nil
        sut = nil
    }

    func test_fetchTitleView() throws {
        //GIVEN
        let expected = "Episode details"
        
        //WHEN
        sut?.fetchTitleView()
        
        //THEN
        XCTAssertTrue(sutView?.displayFetchTitleIsCalled ?? false,
                      "view.displayFetchTitleIsCalled is not called")
        XCTAssertEqual(sutView?.displayFetchTitleValue, expected,
                       "the expected result is '\(expected)' and received '\(sutView!.displayFetchTitleValue)'")
    }
    
    func test_fetchDetails() throws {
        //GIVEN
        let id = 1
        
        //WHEN
        sutRepository.expectation = self.expectation(description: "fetchEpisodes")
        
        sut?.fetchDetails(id: id)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        //THEN
        XCTAssertTrue(sutView?.starLoadingIsCalled ?? false, "view.starLoading is not called")
        XCTAssertTrue(sutRepository.fetchEpisodeIsCalled, "episodeRepository.fetchEpisode is not called")
                
        XCTAssertTrue(sutView?.stopLoadingIsCalled ?? false, "view.stopLoading is not called")
        XCTAssertTrue(sutView?.displayFetchDetailsIsCalled ?? false, "view.displayFetchDetailsIsCalled is not called")
    }
}
