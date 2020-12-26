; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 181, r = 15
(declare-const m2 Int) ; h = 2, c = 144, r = 9
(declare-const m3 Int) ; h = 6, c = 143, r = 7
(declare-const m4 Int) ; h = 6, c =  22, r = 77

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 15 0) (ite (= m2 1) 9 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 77 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 15 0) (ite (= m2 2) 9 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 77 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 15 0) (ite (= m2 3) 9 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 77 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 181 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 144 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 143 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  22 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 181 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 144 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 143 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  22 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 181 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 144 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 143 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  22 s3))))

(assert (= (+ (+ l1 l2) l3) 34645 ))

(check-sat)
(get-model)
