; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 256, r = 17
(declare-const m2 Int) ; h = 8, c = 239, r = 91
(declare-const m3 Int) ; h = 6, c = 201, r = 22
(declare-const m4 Int) ; h = 5, c = 236, r = 29
(declare-const m5 Int) ; h = 7, c =  85, r = 99

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 17 0) (ite (= m2 1) 91 0)) (ite (= m3 1) 22 0)) (ite (= m4 1) 29 0)) (ite (= m5 1) 99 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 17 0) (ite (= m2 2) 91 0)) (ite (= m3 2) 22 0)) (ite (= m4 2) 29 0)) (ite (= m5 2) 99 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 17 0) (ite (= m2 3) 91 0)) (ite (= m3 3) 22 0)) (ite (= m4 3) 29 0)) (ite (= m5 3) 99 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 17 0) (ite (= m2 4) 91 0)) (ite (= m3 4) 22 0)) (ite (= m4 4) 29 0)) (ite (= m5 4) 99 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 256 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 239 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 201 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 236 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  85 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 256 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 239 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 201 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 236 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  85 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 256 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 239 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 201 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 236 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  85 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 256 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 239 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 201 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 236 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  85 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 101700 ))

(check-sat)
(get-model)
