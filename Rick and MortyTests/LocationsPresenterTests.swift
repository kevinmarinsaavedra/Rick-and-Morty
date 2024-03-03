//
//  LocationsPresenterTests.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import XCTest
@testable import Rick_and_Morty

class LocationsPresenterTests: XCTestCase {

    var sutView: LocationsViewMock?
    var sutRepository: LocationRepositoryMock!
    var sutCoordinator: BaseLocationsCoordinatorMock!
    var sut: LocationsPresenter?
    
    override func setUpWithError() throws {
        sutView = LocationsViewMock()
        sutRepository = LocationRepositoryMock()
        sutCoordinator = BaseLocationsCoordinatorMock()
        sut = LocationsPresenter(view: sutView, locationRepository: sutRepository, coordinator: sutCoordinator)
    }

    override func tearDownWithError() throws {
        sutView = nil
        sutRepository = nil
        sutCoordinator = nil
        sut = nil
    }

    func test_fetchLocations() throws {
        
        //GIVEN
        let request = Location.FetchLocations.Request()
        
        //WHEN
        sutRepository.expectation = self.expectation(description: "fetchLocations")
        
        sut?.fetchLocations(request: request)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        //THEN
        XCTAssertTrue(sutView?.starLoadingIsCalled ?? false, "view.starLoading is not called")
        XCTAssertTrue(sutRepository.fetchLocationsIsCalled, "locationRepository.fetchLocations is not called")
                
        XCTAssertTrue(sutView?.stopLoadingIsCalled ?? false, "view.stopLoading is not called")
        XCTAssertTrue(sutView?.displayFetchLocationsIsCalled ?? false, "view.displayFetchLocationsIsCalled is not called")
    }
    
    func test_navigationDetail() throws {
        
        //GIVEN
        let location = Location.LocationModel(
            id: 0, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137",
            residents: ["https://rickandmortyapi.com/api/character/38"],
            url: "https://rickandmortyapi.com/api/location/1", created: "2017-11-10T12:42:04.162Z"
        )
        
        //WHEN
        sut?.navigationDetails(location: location)
        
        //THEN
        XCTAssertTrue(sutCoordinator.navigateIsCalled, "coordinator.navigate is not called")
    }
}
