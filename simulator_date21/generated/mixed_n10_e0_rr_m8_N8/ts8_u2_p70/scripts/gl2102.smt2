; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c =  10, r = 46
(declare-const m2 Int) ; h = 2, c =  12, r = 24
(declare-const m3 Int) ; h = 5, c =   7, r = 93
(declare-const m4 Int) ; h = 7, c =   2, r = 39

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 46 0) (ite (= m2 1) 24 0)) (ite (= m3 1) 93 0)) (ite (= m4 1) 39 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 46 0) (ite (= m2 2) 24 0)) (ite (= m3 2) 93 0)) (ite (= m4 2) 39 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 46 0) (ite (= m2 3) 24 0)) (ite (= m3 3) 93 0)) (ite (= m4 3) 39 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  10 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  12 s1))))
(assert (or (not (= m3 1)) (>= l1 (*   7 s1))))
(assert (or (not (= m4 1)) (>= l1 (*   2 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  10 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  12 s2))))
(assert (or (not (= m3 2)) (>= l2 (*   7 s2))))
(assert (or (not (= m4 2)) (>= l2 (*   2 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  10 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  12 s3))))
(assert (or (not (= m3 3)) (>= l3 (*   7 s3))))
(assert (or (not (= m4 3)) (>= l3 (*   2 s3))))

(assert (= (+ (+ l1 l2) l3) 2102 ))

(check-sat)
(get-model)
