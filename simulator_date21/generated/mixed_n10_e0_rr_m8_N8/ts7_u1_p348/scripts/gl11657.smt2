; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c =  68, r = 71
(declare-const m2 Int) ; h = 2, c =  37, r = 100
(declare-const m3 Int) ; h = 6, c =  23, r = 46

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 6 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 71 0) (ite (= m2 1) 100 0)) (ite (= m3 1) 46 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 71 0) (ite (= m2 2) 100 0)) (ite (= m3 2) 46 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  68 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  37 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  23 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  68 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  37 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  23 s2))))

(assert (= (+ l1 l2) 11657 ))

(check-sat)
(get-model)
