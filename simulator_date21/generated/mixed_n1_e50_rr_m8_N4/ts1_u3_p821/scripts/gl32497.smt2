; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 118, r = 4
(declare-const m2 Int) ; h = 4, c =  84, r = 32
(declare-const m3 Int) ; h = 8, c = 113, r = 53
(declare-const m4 Int) ; h = 2, c = 128, r = 3

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 2 0)) 8 ))

(assert ( < m1 m2 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 32 0)) (ite (= m3 1) 53 0)) (ite (= m4 1) 3 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 32 0)) (ite (= m3 2) 53 0)) (ite (= m4 2) 3 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 32 0)) (ite (= m3 3) 53 0)) (ite (= m4 3) 3 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 118 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  84 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 113 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 128 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 118 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  84 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 113 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 128 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 118 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  84 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 113 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 128 s3))))

(assert (= (+ (+ l1 l2) l3) 32497 ))

(check-sat)
(get-model)
