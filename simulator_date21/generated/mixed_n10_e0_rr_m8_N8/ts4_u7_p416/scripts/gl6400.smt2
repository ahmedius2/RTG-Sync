; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c =  64, r = 37



(assert (and (<= 1 m1) (<= m1 0))) ; 1 <= m1 <= 0





(assert (= (+ l1 l2) 6400 ))

(check-sat)
(get-model)
