class Search {
    
    var text: String
    var mask: String
    
    let name: String
    var cmp: Int
    
    init(text: String, mask: String, name: String = "") {
        self.text = text
        self.mask = mask
        self.name = name
        self.cmp = 0
    }
    
    func prepare() {}
    
    func run() -> Int {
        -1
    }
    
}
