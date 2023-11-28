import Foundation

//get

func makeGetRequest() {
    let url = URL(string: "https://api.com/get")!

    let session = URLSession.shared

    let task = session.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            let result = String(data: data, encoding: .utf8)
            print("GET request result: \(result ?? "")")
        }
    }

    task.resume()
}
// makeGetRequest()

// post ==========

func makePostRequest() {
    let url = URL(string: "https://api.com/post")!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let parameters = ["key1": "value1", "key2": "value2"]
    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let session = URLSession.shared

    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            let result = String(data: data, encoding: .utf8)
            print("POST request result: \(result ?? "")")
        }
    }

    task.resume()
}

// how to make a post request:
 //makePostRequest()

//example:
//let postParameters = ["key1": "value1", "key2": "value2"]
//makePostRequest(url: "https://api.api.com/post", parameters: postParameters)
