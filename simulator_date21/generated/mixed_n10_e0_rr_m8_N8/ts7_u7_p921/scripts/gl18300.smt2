; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c =  94, r = 44
(declare-const m2 Int) ; h = 8, c = 100, r = 76
(declare-const m3 Int) ; h = 6, c = 138, r = 21
(declare-const m4 Int) ; h = 5, c =  34, r = 75

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)

(assert (and (<= 1 m1) (<= m1 3))) ; 1 <= m1 <= 3
(assert (and (<= 1 m2) (<= m2 3))) ; 1 <= m2 <= 3
(assert (and (<= 1 m3) (<= m3 3))) ; 1 <= m3 <= 3
(assert (and (<= 1 m4) (<= m4 3))) ; 1 <= m4 <= 3

(assert ( <= (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 44 0) (ite (= m2 1) 76 0)) (ite (= m3 1) 21 0)) (ite (= m4 1) 75 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 44 0) (ite (= m2 2) 76 0)) (ite (= m3 2) 21 0)) (ite (= m4 2) 75 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 44 0) (ite (= m2 3) 76 0)) (ite (= m3 3) 21 0)) (ite (= m4 3) 75 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 100 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 138 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  34 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 100 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 138 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  34 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 100 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 138 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  34 s3))))

(assert (= (+ (+ l1 l2) l3) 18300 ))

(check-sat)
(get-model)
