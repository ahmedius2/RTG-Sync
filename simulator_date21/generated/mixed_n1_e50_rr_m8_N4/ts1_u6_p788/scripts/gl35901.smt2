; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 146, r = 22
(declare-const m2 Int) ; h = 4, c = 148, r = 72
(declare-const m3 Int) ; h = 3, c =  80, r = 18
(declare-const m4 Int) ; h = 1, c = 131, r = 96

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 1 0)) 8 ))

(assert ( < m1 m4 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 22 0) (ite (= m2 1) 72 0)) (ite (= m3 1) 18 0)) (ite (= m4 1) 96 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 22 0) (ite (= m2 2) 72 0)) (ite (= m3 2) 18 0)) (ite (= m4 2) 96 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 22 0) (ite (= m2 3) 72 0)) (ite (= m3 3) 18 0)) (ite (= m4 3) 96 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 146 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 148 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  80 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 131 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 146 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 148 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  80 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 131 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 146 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 148 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  80 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 131 s3))))

(assert (= (+ (+ l1 l2) l3) 35901 ))

(check-sat)
(get-model)
