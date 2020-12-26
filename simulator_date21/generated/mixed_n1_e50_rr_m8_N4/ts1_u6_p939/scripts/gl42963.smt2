; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 100, r = 73
(declare-const m2 Int) ; h = 2, c = 179, r = 75
(declare-const m3 Int) ; h = 6, c =  98, r = 28
(declare-const m4 Int) ; h = 8, c = 114, r = 11

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 8 0)) 8 ))

(assert ( < m1 m3 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 73 0) (ite (= m2 1) 75 0)) (ite (= m3 1) 28 0)) (ite (= m4 1) 11 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 73 0) (ite (= m2 2) 75 0)) (ite (= m3 2) 28 0)) (ite (= m4 2) 11 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 73 0) (ite (= m2 3) 75 0)) (ite (= m3 3) 28 0)) (ite (= m4 3) 11 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 100 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 179 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  98 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 114 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 100 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 179 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  98 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 114 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 100 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 179 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  98 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 114 s3))))

(assert (= (+ (+ l1 l2) l3) 42963 ))

(check-sat)
(get-model)
