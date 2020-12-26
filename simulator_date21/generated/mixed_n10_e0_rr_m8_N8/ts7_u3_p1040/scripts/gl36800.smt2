; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 156, r = 91
(declare-const m2 Int) ; h = 2, c = 165, r = 7
(declare-const m3 Int) ; h = 4, c = 203, r = 20
(declare-const m4 Int) ; h = 5, c = 203, r = 73
(declare-const m5 Int) ; h = 3, c =   9, r = 36

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)
(declare-const l4 Int)

(assert (and (<= 1 m1) (<= m1 4))) ; 1 <= m1 <= 4
(assert (and (<= 1 m2) (<= m2 4))) ; 1 <= m2 <= 4
(assert (and (<= 1 m3) (<= m3 4))) ; 1 <= m3 <= 4
(assert (and (<= 1 m4) (<= m4 4))) ; 1 <= m4 <= 4
(assert (and (<= 1 m5) (<= m5 4))) ; 1 <= m5 <= 4

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 91 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 20 0)) (ite (= m4 1) 73 0)) (ite (= m5 1) 36 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 91 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 20 0)) (ite (= m4 2) 73 0)) (ite (= m5 2) 36 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 91 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 20 0)) (ite (= m4 3) 73 0)) (ite (= m5 3) 36 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 91 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 20 0)) (ite (= m4 4) 73 0)) (ite (= m5 4) 36 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 165 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 203 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 203 s1))))
(assert (or (not (= m5 1)) (>= l1 (*   9 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 165 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 203 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 203 s2))))
(assert (or (not (= m5 2)) (>= l2 (*   9 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 165 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 203 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 203 s3))))
(assert (or (not (= m5 3)) (>= l3 (*   9 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 165 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 203 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 203 s4))))
(assert (or (not (= m5 4)) (>= l4 (*   9 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 36800 ))

(check-sat)
(get-model)
