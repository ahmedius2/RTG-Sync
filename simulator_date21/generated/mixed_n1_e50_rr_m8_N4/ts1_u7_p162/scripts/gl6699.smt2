; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c =  23, r = 13
(declare-const m2 Int) ; h = 4, c =  25, r = 52
(declare-const m3 Int) ; h = 8, c =  18, r = 26
(declare-const m4 Int) ; h = 4, c =  26, r = 2

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 4 0)) 8 ))

(assert ( < m1 m4 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 13 0) (ite (= m2 1) 52 0)) (ite (= m3 1) 26 0)) (ite (= m4 1) 2 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 13 0) (ite (= m2 2) 52 0)) (ite (= m3 2) 26 0)) (ite (= m4 2) 2 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 13 0) (ite (= m2 3) 52 0)) (ite (= m3 3) 26 0)) (ite (= m4 3) 2 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  23 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  25 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  18 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  26 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  23 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  25 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  18 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  26 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  23 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  25 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  18 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  26 s3))))

(assert (= (+ (+ l1 l2) l3) 6699 ))

(check-sat)
(get-model)
