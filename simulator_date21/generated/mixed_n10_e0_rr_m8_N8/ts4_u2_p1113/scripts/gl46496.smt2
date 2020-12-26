; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c = 214, r = 47
(declare-const m2 Int) ; h = 6, c = 216, r = 91
(declare-const m3 Int) ; h = 4, c = 123, r = 25
(declare-const m4 Int) ; h = 5, c =  44, r = 2

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 6 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 6 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 6 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 47 0) (ite (= m2 1) 91 0)) (ite (= m3 1) 25 0)) (ite (= m4 1) 2 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 47 0) (ite (= m2 2) 91 0)) (ite (= m3 2) 25 0)) (ite (= m4 2) 2 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 47 0) (ite (= m2 3) 91 0)) (ite (= m3 3) 25 0)) (ite (= m4 3) 2 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 214 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 216 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 123 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  44 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 214 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 216 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 123 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  44 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 214 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 216 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 123 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  44 s3))))

(assert (= (+ (+ l1 l2) l3) 46496 ))

(check-sat)
(get-model)
