; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c =  55, r = 100
(declare-const m2 Int) ; h = 2, c =  46, r = 90

(declare-const s1 Int)

(declare-const l1 Int)

(assert (and (<= 1 m1) (<= m1 1))) ; 1 <= m1 <= 1
(assert (and (<= 1 m2) (<= m2 1))) ; 1 <= m2 <= 1

(assert ( <= (+ (ite (= m1 1) 5 0) (ite (= m2 1) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (ite (= m1 1) 100 0) (ite (= m2 1) 90 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  55 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  46 s1))))

(assert (= l1 10100 ))

(check-sat)
(get-model)
