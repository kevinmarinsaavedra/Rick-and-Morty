//
//  LocationDetailsPresenterTests.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class LocationDetailsPresenterTests: XCTestCase {

    var sutView: LocationDetailsViewMock?
    var sutRepository: LocationRepositoryMock!
    var sut: LocationDetailsPresenter?
    
    override func setUpWithError() throws {
        sutView = LocationDetailsViewMock()
        sutRepository = LocationRepositoryMock()
        sut = LocationDetailsPresenter(view: sutView, locationRepository: sutRepository)
    }

    override func tearDownWithError() throws {
        sutView = nil
        sutRepository = nil
        sut = nil
    }

    func test_fetchTitleView() throws {
        //GIVEN
        let expected = "Location details"
        
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
        sutRepository.expectation = self.expectation(description: "fetchLocations")
        
        sut?.fetchDetails(id: id)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        //THEN
        XCTAssertTrue(sutView?.starLoadingIsCalled ?? false, "view.starLoading is not called")
        XCTAssertTrue(sutRepository.fetchLocationIsCalled, "episodeRepository.fetchLocation is not called")
                
        XCTAssertTrue(sutView?.stopLoadingIsCalled ?? false, "view.stopLoading is not called")
        XCTAssertTrue(sutView?.displayFetchDetailsIsCalled ?? false, "view.displayFetchDetailsIsCalled is not called")
    }
}
