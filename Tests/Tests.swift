import UIKit
import XCTest

class Tests: XCTestCase {
    override func setUp() {
        super.setUp()

        for activity in NetworkActivityIndicatorManager.all() {
            NetworkActivityIndicatorManager.remove(activity)
        }
    }

    func testAdd() {
        NetworkActivityIndicatorManager.add("test")
        XCTAssertEqual(NetworkActivityIndicatorManager.all().first, "test")
    }

    func testAddUnique() {
        NetworkActivityIndicatorManager.add("test")
        NetworkActivityIndicatorManager.add("test")
        NetworkActivityIndicatorManager.add("test")
        XCTAssertEqual(NetworkActivityIndicatorManager.all().count, 1)
    }

    func testRemove() {
        NetworkActivityIndicatorManager.add("test")
        XCTAssertEqual(NetworkActivityIndicatorManager.all().first, "test")

        NetworkActivityIndicatorManager.remove("test")
        XCTAssertEqual(NetworkActivityIndicatorManager.all().count, 0)
    }

    func testSafeRemoval() {
        NetworkActivityIndicatorManager.remove("test")
        NetworkActivityIndicatorManager.remove("test")
        NetworkActivityIndicatorManager.remove("test")
        XCTAssertEqual(NetworkActivityIndicatorManager.all().count, 0)
    }

    func testAll() {
        NetworkActivityIndicatorManager.add("test1")
        NetworkActivityIndicatorManager.add("test2")
        NetworkActivityIndicatorManager.add("test3")

        XCTAssertEqual(Set(NetworkActivityIndicatorManager.all()), Set(["test1", "test2", "test3"]))
    }
}
