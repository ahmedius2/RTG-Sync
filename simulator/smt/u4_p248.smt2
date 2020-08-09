; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c =  29, r = 10
(declare-const m2 Int) ; h = 2, c =  37, r = 47
(declare-const m3 Int) ; h = 1, c =  27, r = 57
(declare-const m4 Int) ; h = 4, c =  34, r = 31

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 4 0)) 4 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 4 0)) 4 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 4 0)) 4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 10 0) (ite (= m2 1) 47 0)) (ite (= m3 1) 57 0)) (ite (= m4 1) 31 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 10 0) (ite (= m2 2) 47 0)) (ite (= m3 2) 57 0)) (ite (= m4 2) 31 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 10 0) (ite (= m2 3) 47 0)) (ite (= m3 3) 57 0)) (ite (= m4 3) 31 0)) ))

(assert (or (not (= m1 1)) (>= l1 (*  29 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  37 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  27 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  34 s1))))
(assert (or (not (= m1 2)) (>= l2 (*  29 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  37 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  27 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  34 s2))))
(assert (or (not (= m1 3)) (>= l3 (*  29 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  37 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  27 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  34 s3))))

(assert (= (+ (+ l1 l2) l3) 12700 ))

(check-sat)
(get-model)
