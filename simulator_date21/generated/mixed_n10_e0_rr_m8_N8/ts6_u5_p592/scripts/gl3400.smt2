; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  34, r = 45



(assert (and (<= 1 m1) (<= m1 0))) ; 1 <= m1 <= 0





(assert (= (+ l1 l2) 3400 ))

(check-sat)
(get-model)
