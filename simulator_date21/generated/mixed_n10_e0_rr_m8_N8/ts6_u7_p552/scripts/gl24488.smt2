; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c =  61, r = 100
(declare-const m2 Int) ; h = 4, c =  81, r = 9
(declare-const m3 Int) ; h = 3, c =  60, r = 27
(declare-const m4 Int) ; h = 2, c = 101, r = 3
(declare-const m5 Int) ; h = 5, c =  84, r = 15

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 100 0) (ite (= m2 1) 9 0)) (ite (= m3 1) 27 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 15 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 100 0) (ite (= m2 2) 9 0)) (ite (= m3 2) 27 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 15 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 100 0) (ite (= m2 3) 9 0)) (ite (= m3 3) 27 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 15 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 100 0) (ite (= m2 4) 9 0)) (ite (= m3 4) 27 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 15 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  61 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  81 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  60 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 101 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  84 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  61 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  81 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  60 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 101 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  84 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  61 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  81 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  60 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 101 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  84 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  61 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  81 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  60 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 101 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  84 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 24488 ))

(check-sat)
(get-model)
