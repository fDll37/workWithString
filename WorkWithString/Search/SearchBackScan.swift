final class SearchBackScan: Search {
    
    init(text: String, mask: String) {
        super.init(text: text, mask: mask, name: "Алгоритм обратного сравнения")
    }
    
    override func run() -> Int {
        cmp = 0
        var indexText = 0
        
        while indexText <= text.count - mask.count {
            var indexMask = mask.count - 1
            
            while indexMask >= 0 && text[indexText + indexMask] == mask[indexMask] {
                indexMask -= 1
                cmp += 1
            }
            if indexMask < 0 {
                return indexText
            }

            indexText += 1
        }
        return -1
    }
}
