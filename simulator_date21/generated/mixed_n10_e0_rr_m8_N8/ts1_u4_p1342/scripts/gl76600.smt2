; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 241, r = 91
(declare-const m2 Int) ; h = 7, c = 236, r = 36
(declare-const m3 Int) ; h = 8, c = 266, r = 17
(declare-const m4 Int) ; h = 6, c =  23, r = 47

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 91 0) (ite (= m2 1) 36 0)) (ite (= m3 1) 17 0)) (ite (= m4 1) 47 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 91 0) (ite (= m2 2) 36 0)) (ite (= m3 2) 17 0)) (ite (= m4 2) 47 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 91 0) (ite (= m2 3) 36 0)) (ite (= m3 3) 17 0)) (ite (= m4 3) 47 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 241 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 236 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 266 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  23 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 241 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 236 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 266 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  23 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 241 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 236 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 266 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  23 s3))))

(assert (= (+ (+ l1 l2) l3) 76600 ))

(check-sat)
(get-model)
