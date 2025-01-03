final class SearchFullScan: Search {
    
    init(text: String, mask: String) {
        super.init(text: text, mask: mask, name: "Алгоритм полного перебора")
    }
    
    override func run() -> Int {
        cmp = 0
        var indexText = 0
        
        while indexText <= text.count - mask.count {
            var indexMask = 0
            while indexMask < mask.count && text[indexText + indexMask] == mask[indexMask] {
                cmp += 1
                indexMask += 1
            }
            
            if indexMask == mask.count {
                return indexText
            }
            indexText += 1
        }
        return -1
    }
}
