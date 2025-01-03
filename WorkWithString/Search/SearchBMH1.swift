final class SearchBMH1: Search {
    
    private var shift: [Int] = []
    
    init(text: String, mask: String) {
        super.init(text: text, mask: mask, name: "Алгоритм Бойера-Мура-Хорспула (сдвиг на 1)")
    }
    
    override func prepare() {
        let size = 128
        shift = Array(repeating: mask.count, count: size)
        
        for char in mask {
            if let asciiValue = char.asciiValue {
                shift[Int(asciiValue)] = 1
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
