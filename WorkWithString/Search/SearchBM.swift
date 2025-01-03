final class SearchBM: Search {
    
    private var badCharTable: [Character: Int] = [:]
    
    init(text: String, mask: String) {
        super.init(text: text, mask: mask, name: "Алгоритм Бойера-Мура")
    }
    
    override func prepare() {
        // Подготовка таблицы плохого символа (Bad Character Table)
        let maskLength = mask.count
        for i in 0..<maskLength {
            if let char = mask[i] {  // Используем ваш субскрипт для получения символа по индексу
                badCharTable[char] = maskLength - i - 1
            }
        }
    }
    
    override func run() -> Int {
        prepare()
        let textLength = text.count
        let maskLength = mask.count
        
        // Если маска длиннее текста, поиск невозможен
        if maskLength > textLength {
            return -1
        }
        
        var i = 0
        while i <= textLength - maskLength {
            var j = maskLength - 1
            // Сравниваем маску с текущим фрагментом текста
            while j >= 0 {
                if let textChar = text[i + j], let maskChar = mask[j] {
                    cmp += 1
                    if textChar != maskChar {
                        break
                    }
                }
                j -= 1
            }
            
            if j < 0 {
                // Если нашли совпадение
                return i
            } else {
                // Применяем эвристику плохого символа
                if let textChar = text[i + j] {
                    let badCharShift = badCharTable[textChar] ?? maskLength
                    i += max(1, badCharShift)
                }
            }
        }
        
        return -1 // Совпадений не найдено
    }
}
