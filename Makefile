.PHONY: test

lists/generated_german_word_list.txt: make_list.py lists/wordlist_de.txt
	python make_list.py > lists/generated_german_word_list.txt

test: lists/generated_german_word_list.txt
	dd if=/dev/urandom bs=8 count=4 status=none | janet encode.janet
