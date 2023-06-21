from phonetisch import soundex
from collections import defaultdict
from wordfreq import word_frequency

sound_words = defaultdict(set)

with open('lists/wordlist_de.txt','r') as fh:
    for line in fh:
        word = line.split()[1]
        sound = soundex.encode_word(word)
        if len(sound) > 1:
            sound_words[sound].add(word)

words = []

for word_set in sound_words.values():
    if len(word_set) > 1:
        word_list = [ (word_frequency(word, 'de'), word) for word in word_set ]
        word_list.sort()
        words.append(word_list[-1])
    else:
        word = list(word_set)[0]
        words.append((word_frequency(word, 'de'), word))

words.sort()
for word in words[:2048]:
    print(word[1])
