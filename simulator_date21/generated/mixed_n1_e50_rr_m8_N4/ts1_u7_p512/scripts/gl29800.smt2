; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  52, r = 77
(declare-const m2 Int) ; h = 8, c =  89, r = 76
(declare-const m3 Int) ; h = 6, c =  95, r = 48
(declare-const m4 Int) ; h = 6, c =  62, r = 32

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 6 0)) 8 ))

(assert ( < m2 m3 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 77 0) (ite (= m2 1) 76 0)) (ite (= m3 1) 48 0)) (ite (= m4 1) 32 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 77 0) (ite (= m2 2) 76 0)) (ite (= m3 2) 48 0)) (ite (= m4 2) 32 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 77 0) (ite (= m2 3) 76 0)) (ite (= m3 3) 48 0)) (ite (= m4 3) 32 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  52 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  89 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  95 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  62 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  52 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  89 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  95 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  62 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  52 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  89 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  95 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  62 s3))))

(assert (= (+ (+ l1 l2) l3) 29800 ))

(check-sat)
(get-model)
