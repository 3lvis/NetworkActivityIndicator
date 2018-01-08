import XCTest

class DemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        for _ in 0..<NetworkActivityIndicator.shared.activitiesCount {
            NetworkActivityIndicator.shared.visible = false
        }

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVisible() {
        NetworkActivityIndicator.shared.visible = true
        
        XCTAssertTrue(UIApplication.shared.isNetworkActivityIndicatorVisible)
    }
    
    func testHidden() {
        NetworkActivityIndicator.shared.visible = false
        
        XCTAssertFalse(UIApplication.shared.isNetworkActivityIndicatorVisible)
    }
    
    func testMultipleVisible() {
        NetworkActivityIndicator.shared.visible = true
        NetworkActivityIndicator.shared.visible = true
        NetworkActivityIndicator.shared.visible = true
        
        XCTAssertTrue(UIApplication.shared.isNetworkActivityIndicatorVisible)
    }
    
    func testMultipleHidden() {
        NetworkActivityIndicator.shared.visible = false
        NetworkActivityIndicator.shared.visible = false
        NetworkActivityIndicator.shared.visible = false
        
        XCTAssertFalse(UIApplication.shared.isNetworkActivityIndicatorVisible)
    }
    
    func testBalance() {
        NetworkActivityIndicator.shared.visible = true
        NetworkActivityIndicator.shared.visible = true
        NetworkActivityIndicator.shared.visible = true
        
        XCTAssertTrue(UIApplication.shared.isNetworkActivityIndicatorVisible)
        
        NetworkActivityIndicator.shared.visible = false
        
        XCTAssertTrue(UIApplication.shared.isNetworkActivityIndicatorVisible)
        
        NetworkActivityIndicator.shared.visible = false
        NetworkActivityIndicator.shared.visible = false
        
        XCTAssertFalse(UIApplication.shared.isNetworkActivityIndicatorVisible)
    }
    
}

