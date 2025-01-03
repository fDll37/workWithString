final class SearchBMH: Search {
    
    private var shift: [Int] = []
    
    init(text: String, mask: String) {
        super.init(text: text, mask: mask, name: "Алгоритм Бойера-Мура-Хорспула")
    }
    
    override func prepare() {
        let size = 128
        shift = Array(repeating: mask.count, count: size)
        
        for (index, char) in mask.enumerated() {
            if let asciiValue = char.asciiValue {
                if mask.count - index - 1 != 0 {
                    shift[Int(asciiValue)] = mask.count - index - 1
                }
            }
        }
    }
    
    override func run() -> Int {
        prepare()
        var indexText = 0
        cmp = 0
        
        while indexText <= text.count - mask.count {
            
            var indexMask = mask.count - 1
            while indexMask >= 0 && text[indexText + indexMask] == mask[indexMask] {
                cmp += 1
                indexMask -= 1
            }
            
            if indexMask < 0 {
                return indexText
            }
            
            indexText += shift[Int(text[indexMask + mask.count - 1]!.asciiValue!)]
        }
        
        return -1
    }
    
    
}
