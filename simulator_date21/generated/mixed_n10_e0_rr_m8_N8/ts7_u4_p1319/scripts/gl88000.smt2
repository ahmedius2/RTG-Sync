; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 148, r = 10
(declare-const m2 Int) ; h = 6, c = 222, r = 95
(declare-const m3 Int) ; h = 5, c = 243, r = 20
(declare-const m4 Int) ; h = 5, c = 150, r = 51
(declare-const m5 Int) ; h = 8, c = 117, r = 51

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 6 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 6 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 6 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 6 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 10 0) (ite (= m2 1) 95 0)) (ite (= m3 1) 20 0)) (ite (= m4 1) 51 0)) (ite (= m5 1) 51 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 10 0) (ite (= m2 2) 95 0)) (ite (= m3 2) 20 0)) (ite (= m4 2) 51 0)) (ite (= m5 2) 51 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 10 0) (ite (= m2 3) 95 0)) (ite (= m3 3) 20 0)) (ite (= m4 3) 51 0)) (ite (= m5 3) 51 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 10 0) (ite (= m2 4) 95 0)) (ite (= m3 4) 20 0)) (ite (= m4 4) 51 0)) (ite (= m5 4) 51 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 148 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 222 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 243 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 150 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 117 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 148 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 222 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 243 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 150 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 117 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 148 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 222 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 243 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 150 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 117 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 148 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 222 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 243 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 150 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 117 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 88000 ))

(check-sat)
(get-model)
