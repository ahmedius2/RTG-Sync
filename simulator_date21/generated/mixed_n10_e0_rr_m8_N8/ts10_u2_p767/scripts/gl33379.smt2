; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 121, r = 52
(declare-const m2 Int) ; h = 7, c = 125, r = 10
(declare-const m3 Int) ; h = 1, c =  99, r = 81
(declare-const m4 Int) ; h = 1, c = 130, r = 99
(declare-const m5 Int) ; h = 6, c =  31, r = 62

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 52 0) (ite (= m2 1) 10 0)) (ite (= m3 1) 81 0)) (ite (= m4 1) 99 0)) (ite (= m5 1) 62 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 52 0) (ite (= m2 2) 10 0)) (ite (= m3 2) 81 0)) (ite (= m4 2) 99 0)) (ite (= m5 2) 62 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 52 0) (ite (= m2 3) 10 0)) (ite (= m3 3) 81 0)) (ite (= m4 3) 99 0)) (ite (= m5 3) 62 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 52 0) (ite (= m2 4) 10 0)) (ite (= m3 4) 81 0)) (ite (= m4 4) 99 0)) (ite (= m5 4) 62 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 121 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 125 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  99 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 130 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  31 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 121 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 125 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  99 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 130 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  31 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 121 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 125 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  99 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 130 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  31 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 121 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 125 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  99 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 130 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  31 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 33379 ))

(check-sat)
(get-model)
