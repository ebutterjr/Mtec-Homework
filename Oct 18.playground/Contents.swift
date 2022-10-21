import UIKit

func countSentences(_ paragraph: String) -> Int {
    var sentences = 0
    let punc = ".?!"
    for word in paragraph {
        if (punc).contains(word) {
            sentences += 1
        }
        return sentences
    }
    return sentences
}
countSentences("This is a sentance. This is another sentance. This is the last sentance. ")
