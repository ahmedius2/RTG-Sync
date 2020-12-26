; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c =  96, r = 87
(declare-const m2 Int) ; h = 5, c =  70, r = 90
(declare-const m3 Int) ; h = 5, c =  31, r = 62

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 5 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 87 0) (ite (= m2 1) 90 0)) (ite (= m3 1) 62 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 87 0) (ite (= m2 2) 90 0)) (ite (= m3 2) 62 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  96 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  70 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  31 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  96 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  70 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  31 s2))))

(assert (= (+ l1 l2) 19700 ))

(check-sat)
(get-model)
