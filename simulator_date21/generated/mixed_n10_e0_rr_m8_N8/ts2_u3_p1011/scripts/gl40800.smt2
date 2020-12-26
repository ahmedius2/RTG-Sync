; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 107, r = 60
(declare-const m2 Int) ; h = 1, c = 131, r = 87
(declare-const m3 Int) ; h = 6, c = 149, r = 88
(declare-const m4 Int) ; h = 8, c = 157, r = 40

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 60 0) (ite (= m2 1) 87 0)) (ite (= m3 1) 88 0)) (ite (= m4 1) 40 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 60 0) (ite (= m2 2) 87 0)) (ite (= m3 2) 88 0)) (ite (= m4 2) 40 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 60 0) (ite (= m2 3) 87 0)) (ite (= m3 3) 88 0)) (ite (= m4 3) 40 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 107 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 131 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 149 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 157 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 107 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 131 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 149 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 157 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 107 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 131 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 149 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 157 s3))))

(assert (= (+ (+ l1 l2) l3) 40800 ))

(check-sat)
(get-model)
