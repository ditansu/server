import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        let testVersion = 50
      
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world \(testVersion)")
            return json
        }

        get("plaintext") { req in
            return "Hello, world \(testVersion)!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
