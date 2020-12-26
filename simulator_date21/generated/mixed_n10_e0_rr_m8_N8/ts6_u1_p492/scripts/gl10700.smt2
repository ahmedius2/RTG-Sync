; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c =  56, r = 8
(declare-const m2 Int) ; h = 3, c =  51, r = 6

(declare-const s1 Int)

(declare-const l1 Int)

(assert (and (<= 1 m1) (<= m1 1))) ; 1 <= m1 <= 1
(assert (and (<= 1 m2) (<= m2 1))) ; 1 <= m2 <= 1

(assert ( <= (+ (ite (= m1 1) 6 0) (ite (= m2 1) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (ite (= m1 1) 8 0) (ite (= m2 1) 6 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  56 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  51 s1))))

(assert (= l1 10700 ))

(check-sat)
(get-model)
