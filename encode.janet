(def list (string/split "\n" (string/trimr (slurp "lists/generated_german_word_list.txt"))))

(defmacro toggle [x]
  ~(set ,x (not ,x)))

(defn encode [x]
  (var odd true)
  (seq (e :in x)
    (toggle odd)
    (if odd
      (list (+ e 1024))
      (list e))))

(defn main [_]
  (def buf @"")
  (var odd true)
  (var cont true)
  (while cont
    (file/read stdin 5 buf)
    (toggle odd)
    (if (= (length buf) 0) (break))
    (when (< (length buf) 4)
      (repeat (- 4 (length buf)) (buffer/push buf 0))
      (set cont false))
    (prin
      (if odd
        (list (+ (sum (slice buf 0 3)) 1024))
        (list (sum (slice buf 0 3))))
      " ")
    (buffer/clear buf)))
