; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c = 141, r = 99
(declare-const m2 Int) ; h = 2, c = 117, r = 42
(declare-const m3 Int) ; h = 4, c =  81, r = 25
(declare-const m4 Int) ; h = 7, c = 151, r = 50
(declare-const m5 Int) ; h = 3, c =  40, r = 25

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 4 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 99 0) (ite (= m2 1) 42 0)) (ite (= m3 1) 25 0)) (ite (= m4 1) 50 0)) (ite (= m5 1) 25 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 99 0) (ite (= m2 2) 42 0)) (ite (= m3 2) 25 0)) (ite (= m4 2) 50 0)) (ite (= m5 2) 25 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 99 0) (ite (= m2 3) 42 0)) (ite (= m3 3) 25 0)) (ite (= m4 3) 50 0)) (ite (= m5 3) 25 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 99 0) (ite (= m2 4) 42 0)) (ite (= m3 4) 25 0)) (ite (= m4 4) 50 0)) (ite (= m5 4) 25 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 141 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 117 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  81 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 151 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  40 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 141 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 117 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  81 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 151 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  40 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 141 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 117 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  81 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 151 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  40 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 141 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 117 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  81 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 151 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  40 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 43083 ))

(check-sat)
(get-model)
