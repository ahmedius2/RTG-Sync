; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c = 105, r = 18
(declare-const m2 Int) ; h = 8, c = 155, r = 6
(declare-const m3 Int) ; h = 5, c = 149, r = 15
(declare-const m4 Int) ; h = 8, c = 122, r = 100
(declare-const m5 Int) ; h = 6, c =  60, r = 96

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 8 0)) (ite (= m5 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 8 0)) (ite (= m5 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 8 0)) (ite (= m5 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 8 0)) (ite (= m5 4) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 18 0) (ite (= m2 1) 6 0)) (ite (= m3 1) 15 0)) (ite (= m4 1) 100 0)) (ite (= m5 1) 96 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 18 0) (ite (= m2 2) 6 0)) (ite (= m3 2) 15 0)) (ite (= m4 2) 100 0)) (ite (= m5 2) 96 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 18 0) (ite (= m2 3) 6 0)) (ite (= m3 3) 15 0)) (ite (= m4 3) 100 0)) (ite (= m5 3) 96 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 18 0) (ite (= m2 4) 6 0)) (ite (= m3 4) 15 0)) (ite (= m4 4) 100 0)) (ite (= m5 4) 96 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 105 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 155 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 149 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 122 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  60 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 105 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 155 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 149 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 122 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  60 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 105 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 155 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 149 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 122 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  60 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 105 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 155 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 149 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 122 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  60 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 59100 ))

(check-sat)
(get-model)
