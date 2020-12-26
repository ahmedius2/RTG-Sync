; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  39, r = 16
(declare-const m2 Int) ; h = 4, c =  38, r = 92
(declare-const m3 Int) ; h = 7, c =   7, r = 23

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 7 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 16 0) (ite (= m2 1) 92 0)) (ite (= m3 1) 23 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 16 0) (ite (= m2 2) 92 0)) (ite (= m3 2) 23 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  39 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  38 s1))))
(assert (or (not (= m3 1)) (>= l1 (*   7 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  39 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  38 s2))))
(assert (or (not (= m3 2)) (>= l2 (*   7 s2))))

(assert (= (+ l1 l2) 4913 ))

(check-sat)
(get-model)
