; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c = 207, r = 29
(declare-const m2 Int) ; h = 4, c = 216, r = 69
(declare-const m3 Int) ; h = 2, c = 215, r = 77
(declare-const m4 Int) ; h = 8, c = 219, r = 62

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 29 0) (ite (= m2 1) 69 0)) (ite (= m3 1) 77 0)) (ite (= m4 1) 62 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 29 0) (ite (= m2 2) 69 0)) (ite (= m3 2) 77 0)) (ite (= m4 2) 62 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 29 0) (ite (= m2 3) 69 0)) (ite (= m3 3) 77 0)) (ite (= m4 3) 62 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 207 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 216 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 215 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 219 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 207 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 216 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 215 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 219 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 207 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 216 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 215 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 219 s3))))

(assert (= (+ (+ l1 l2) l3) 64993 ))

(check-sat)
(get-model)
