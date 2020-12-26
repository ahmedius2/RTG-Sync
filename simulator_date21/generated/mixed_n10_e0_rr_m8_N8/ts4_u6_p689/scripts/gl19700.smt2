; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  97, r = 92
(declare-const m2 Int) ; h = 4, c =  70, r = 84
(declare-const m3 Int) ; h = 6, c =  30, r = 95

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 6 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 92 0) (ite (= m2 1) 84 0)) (ite (= m3 1) 95 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 92 0) (ite (= m2 2) 84 0)) (ite (= m3 2) 95 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  97 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  70 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  30 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  97 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  70 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  30 s2))))

(assert (= (+ l1 l2) 19700 ))

(check-sat)
(get-model)
