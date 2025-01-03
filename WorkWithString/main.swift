//let text = "KOLKOKAKOLOKOLL"
//let mask = "KOLOKOL"

let text = "BC-ABC-BC-AC-ABCBC-ABC-BC-C-ABC-ABC-BC-C-ABC"
let mask = "BC-ABC-BC-C-ABC"

let searches = [
    SearchFullScan(text: text, mask: mask),
    SearchBackScan(text: text, mask: mask),
    SearchBMH1(text: text, mask: mask),
    SearchBMH(text: text, mask: mask),
    SearchBM(text: text, mask: mask)
]

print("text: \(text)")
print("mask: \(mask)")

for methodSearch in searches {
    print("------------------------------")
    print(methodSearch.name.uppercased())
    
    print("Позиция, откуда начинается совпадение: \(methodSearch.run())")
    print("Количество сравнений: \(methodSearch.cmp)")
}
