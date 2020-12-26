; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 109, r = 73
(declare-const m2 Int) ; h = 2, c = 103, r = 33
(declare-const m3 Int) ; h = 2, c = 118, r = 91
(declare-const m4 Int) ; h = 8, c =  88, r = 31

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 8 0)) 8 ))

(assert ( < m1 m3 ))
(assert ( < m1 m4 ))
(assert ( < m2 m3 ))
(assert ( < m2 m4 ))
(assert ( < m3 m4 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 73 0) (ite (= m2 1) 33 0)) (ite (= m3 1) 91 0)) (ite (= m4 1) 31 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 73 0) (ite (= m2 2) 33 0)) (ite (= m3 2) 91 0)) (ite (= m4 2) 31 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 73 0) (ite (= m2 3) 33 0)) (ite (= m3 3) 91 0)) (ite (= m4 3) 31 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 109 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 103 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 118 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  88 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 109 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 103 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 118 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  88 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 109 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 103 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 118 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  88 s3))))

(assert (= (+ (+ l1 l2) l3) 41800 ))

(check-sat)
(get-model)
