; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  31, r = 54
(declare-const m2 Int) ; h = 1, c =  31, r = 50
(declare-const m3 Int) ; h = 4, c =   6, r = 40

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 4 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 4 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 54 0) (ite (= m2 1) 50 0)) (ite (= m3 1) 40 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 54 0) (ite (= m2 2) 50 0)) (ite (= m3 2) 40 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  31 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  31 s1))))
(assert (or (not (= m3 1)) (>= l1 (*   6 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  31 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  31 s2))))
(assert (or (not (= m3 2)) (>= l2 (*   6 s2))))

(assert (= (+ l1 l2) 3400 ))

(check-sat)
(get-model)
