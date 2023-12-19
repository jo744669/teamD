import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button("send request") {
                buttonTapped()
            }
            .padding()
            
            Spacer()
        }
    }

    func buttonTapped() {
        let url = URL(string: "http://192.168.1.23:3000/insertData")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let data: [String: Any] = [
            "field1": "value1",
            "field2": "value2",
            "field3": "value3"
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                if let data = data {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        print("Response: \(jsonResponse ?? [:])")
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }

            task.resume()

        } catch {
            print("Error converting data to JSON: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
