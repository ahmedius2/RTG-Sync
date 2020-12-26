; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c =   9, r = 12



(assert (and (<= 1 m1) (<= m1 0))) ; 1 <= m1 <= 0





(assert (= (+ l1 l2) 900 ))

(check-sat)
(get-model)
