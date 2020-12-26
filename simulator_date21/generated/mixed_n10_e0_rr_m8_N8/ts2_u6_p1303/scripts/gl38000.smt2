; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 171, r = 90
(declare-const m2 Int) ; h = 4, c = 179, r = 53
(declare-const m3 Int) ; h = 5, c =  30, r = 56

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 5 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 90 0) (ite (= m2 1) 53 0)) (ite (= m3 1) 56 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 90 0) (ite (= m2 2) 53 0)) (ite (= m3 2) 56 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 171 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 179 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  30 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 171 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 179 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  30 s2))))

(assert (= (+ l1 l2) 38000 ))

(check-sat)
(get-model)
