//
//  ViewController.swift
//  URL_Session
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()
        getData(urlRequest: "https://place.dog/300/200")
    }
}

private func getData(urlRequest: String) {
   guard let urlRequest = URL(string: "https://place.dog/300/200") else {
       fatalError("not found photo")
   }
    let url = urlRequest
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Sorry, we're found a bug")
                } else if
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    guard let data = data else { return }
                    //let dataAsString = String(data: data, encoding: .utf8)
                    print("data = \(String(describing: (String(data: data, encoding: .utf8))))")
            }
    }.resume()
}

