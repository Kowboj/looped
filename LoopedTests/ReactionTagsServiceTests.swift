import XCTest
@testable import Looped

class ReactionTagsServiceTests: XCTestCase {
    var mockAPIRequest: MockAPIRequest!
    var mockAPIClient: MockAPIClient!
    var sut: ReactionTagsService!
    
    override func setUp() {
        super.setUp()
        mockAPIRequest = MockAPIRequest()
        mockAPIClient = MockAPIClient()
        sut = ReactionTagsService(apiClient: mockAPIClient)
    }

    func testSendRequest() {
        mockAPIClient.send(request: mockAPIRequest, completion: { (result) in })
        XCTAssert(mockAPIClient.isSendRequestCalled)
    }
    
    override func tearDown() {
        super.tearDown()
        mockAPIRequest = nil
        mockAPIClient = nil
        sut = nil
    }
}