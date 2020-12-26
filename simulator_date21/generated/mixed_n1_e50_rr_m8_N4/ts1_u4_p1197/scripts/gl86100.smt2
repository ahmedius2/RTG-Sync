; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 207, r = 77
(declare-const m2 Int) ; h = 3, c = 214, r = 99
(declare-const m3 Int) ; h = 2, c = 235, r = 76
(declare-const m4 Int) ; h = 4, c = 205, r = 54

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 4 0)) 8 ))

(assert ( < m1 m4 ))
(assert ( < m2 m3 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 77 0) (ite (= m2 1) 99 0)) (ite (= m3 1) 76 0)) (ite (= m4 1) 54 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 77 0) (ite (= m2 2) 99 0)) (ite (= m3 2) 76 0)) (ite (= m4 2) 54 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 77 0) (ite (= m2 3) 99 0)) (ite (= m3 3) 76 0)) (ite (= m4 3) 54 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 207 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 214 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 235 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 205 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 207 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 214 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 235 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 205 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 207 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 214 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 235 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 205 s3))))

(assert (= (+ (+ l1 l2) l3) 86100 ))

(check-sat)
(get-model)
