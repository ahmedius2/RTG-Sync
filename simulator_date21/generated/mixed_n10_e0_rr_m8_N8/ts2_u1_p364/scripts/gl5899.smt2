; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c =  56, r = 61
(declare-const m2 Int) ; h = 1, c =  59, r = 2
(declare-const m3 Int) ; h = 3, c =  45, r = 24

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 3 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 61 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 24 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 61 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 24 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  56 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  59 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  45 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  56 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  59 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  45 s2))))

(assert (= (+ l1 l2) 5899 ))

(check-sat)
(get-model)
