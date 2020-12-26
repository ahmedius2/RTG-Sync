; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c =  77, r = 86
(declare-const m2 Int) ; h = 1, c =  89, r = 61
(declare-const m3 Int) ; h = 5, c =  79, r = 18
(declare-const m4 Int) ; h = 1, c =  69, r = 94
(declare-const m5 Int) ; h = 5, c =  79, r = 31

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

(assert ( <= (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (ite (= m1 1) 86 0) (ite (= m2 1) 61 0)) (ite (= m3 1) 18 0)) (ite (= m4 1) 94 0)) (ite (= m5 1) 31 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (ite (= m1 2) 86 0) (ite (= m2 2) 61 0)) (ite (= m3 2) 18 0)) (ite (= m4 2) 94 0)) (ite (= m5 2) 31 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (ite (= m1 3) 86 0) (ite (= m2 3) 61 0)) (ite (= m3 3) 18 0)) (ite (= m4 3) 94 0)) (ite (= m5 3) 31 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (ite (= m1 4) 86 0) (ite (= m2 4) 61 0)) (ite (= m3 4) 18 0)) (ite (= m4 4) 94 0)) (ite (= m5 4) 31 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  77 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  89 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  79 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  69 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  79 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  77 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  89 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  79 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  69 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  79 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  77 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  89 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  79 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  69 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  79 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  77 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  89 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  79 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  69 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  79 s4))))

(assert (= (+ (+ (+ l1 l2) l3) l4) 25450 ))

(check-sat)
(get-model)
