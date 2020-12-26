; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c =  42, r = 77
(declare-const m2 Int) ; h = 7, c =  38, r = 14
(declare-const m3 Int) ; h = 2, c =  53, r = 1
(declare-const m4 Int) ; h = 2, c =  62, r = 22
(declare-const m5 Int) ; h = 7, c =  23, r = 29

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 77 0) (ite (= m2 1) 14 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 22 0)) (ite (= m5 1) 29 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 77 0) (ite (= m2 2) 14 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 22 0)) (ite (= m5 2) 29 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 77 0) (ite (= m2 3) 14 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 22 0)) (ite (= m5 3) 29 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 77 0) (ite (= m2 4) 14 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 22 0)) (ite (= m5 4) 29 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  42 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  38 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  53 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  62 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  23 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  42 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  38 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  53 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  62 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  23 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  42 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  38 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  53 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  62 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  23 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  42 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  38 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  53 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  62 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  23 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 16508 ))

(check-sat)
(get-model)
