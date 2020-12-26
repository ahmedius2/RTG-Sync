; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c = 280, r = 9
(declare-const m2 Int) ; h = 6, c = 192, r = 67

(declare-const s1 Int)

(declare-const l1 Int)

(assert (and (<= 1 m1) (<= m1 1))) ; 1 <= m1 <= 1
(assert (and (<= 1 m2) (<= m2 1))) ; 1 <= m2 <= 1

(assert ( <= (+ (ite (= m1 1) 1 0) (ite (= m2 1) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (ite (= m1 1) 9 0) (ite (= m2 1) 67 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 280 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 192 s1))))

(assert (= l1 27934 ))

(check-sat)
(get-model)
