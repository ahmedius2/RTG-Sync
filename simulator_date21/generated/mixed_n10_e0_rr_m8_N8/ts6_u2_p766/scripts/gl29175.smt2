; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  78, r = 7
(declare-const m2 Int) ; h = 4, c =  83, r = 83
(declare-const m3 Int) ; h = 2, c =  85, r = 63
(declare-const m4 Int) ; h = 5, c = 143, r = 40

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

(assert ( <= (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 83 0)) (ite (= m3 1) 63 0)) (ite (= m4 1) 40 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 83 0)) (ite (= m3 2) 63 0)) (ite (= m4 2) 40 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 83 0)) (ite (= m3 3) 63 0)) (ite (= m4 3) 40 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  78 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  83 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  85 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 143 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  78 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  83 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  85 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 143 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  78 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  83 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  85 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 143 s3))))

(assert (= (+ (+ l1 l2) l3) 29175 ))

(check-sat)
(get-model)
