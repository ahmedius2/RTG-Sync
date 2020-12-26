; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 131, r = 82
(declare-const m2 Int) ; h = 4, c = 137, r = 11
(declare-const m3 Int) ; h = 2, c = 125, r = 63
(declare-const m4 Int) ; h = 2, c = 148, r = 63
(declare-const m5 Int) ; h = 1, c =  66, r = 65

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 1 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 82 0) (ite (= m2 1) 11 0)) (ite (= m3 1) 63 0)) (ite (= m4 1) 63 0)) (ite (= m5 1) 65 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 82 0) (ite (= m2 2) 11 0)) (ite (= m3 2) 63 0)) (ite (= m4 2) 63 0)) (ite (= m5 2) 65 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 82 0) (ite (= m2 3) 11 0)) (ite (= m3 3) 63 0)) (ite (= m4 3) 63 0)) (ite (= m5 3) 65 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 82 0) (ite (= m2 4) 11 0)) (ite (= m3 4) 63 0)) (ite (= m4 4) 63 0)) (ite (= m5 4) 65 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 131 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 137 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 125 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 148 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  66 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 131 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 137 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 125 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 148 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  66 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 131 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 137 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 125 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 148 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  66 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 131 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 137 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 125 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 148 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  66 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 39479 ))

(check-sat)
(get-model)
