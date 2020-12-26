; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c =  24, r = 6
(declare-const m2 Int) ; h = 2, c =  28, r = 4
(declare-const m3 Int) ; h = 4, c =  35, r = 85
(declare-const m4 Int) ; h = 6, c =  36, r = 50
(declare-const m5 Int) ; h = 4, c =  40, r = 28
(declare-const m6 Int) ; h = 8, c =   5, r = 85

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)
(declare-const s5 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)
(declare-const l4 Int)
(declare-const l5 Int)

(assert (and (<= 1 m1) (<= m1 5))) ; 1 <= m1 <= 5
(assert (and (<= 1 m2) (<= m2 5))) ; 1 <= m2 <= 5
(assert (and (<= 1 m3) (<= m3 5))) ; 1 <= m3 <= 5
(assert (and (<= 1 m4) (<= m4 5))) ; 1 <= m4 <= 5
(assert (and (<= 1 m5) (<= m5 5))) ; 1 <= m5 <= 5
(assert (and (<= 1 m6) (<= m6 5))) ; 1 <= m6 <= 5

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 4 0)) (ite (= m6 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 4 0)) (ite (= m6 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 4 0)) (ite (= m6 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 4 0)) (ite (= m6 4) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 5 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 4 0)) (ite (= m6 5) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 85 0)) (ite (= m4 1) 50 0)) (ite (= m5 1) 28 0)) (ite (= m6 1) 85 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 85 0)) (ite (= m4 2) 50 0)) (ite (= m5 2) 28 0)) (ite (= m6 2) 85 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 85 0)) (ite (= m4 3) 50 0)) (ite (= m5 3) 28 0)) (ite (= m6 3) 85 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 85 0)) (ite (= m4 4) 50 0)) (ite (= m5 4) 28 0)) (ite (= m6 4) 85 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 6 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 85 0)) (ite (= m4 5) 50 0)) (ite (= m5 5) 28 0)) (ite (= m6 5) 85 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  24 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  28 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  35 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  36 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  40 s1))))
(assert (or (not (= m6 1)) (>= l1 (*   5 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  24 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  28 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  35 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  36 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  40 s2))))
(assert (or (not (= m6 2)) (>= l2 (*   5 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  24 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  28 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  35 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  36 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  40 s3))))
(assert (or (not (= m6 3)) (>= l3 (*   5 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  24 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  28 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  35 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  36 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  40 s4))))
(assert (or (not (= m6 4)) (>= l4 (*   5 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  24 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  28 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  35 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  36 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  40 s5))))
(assert (or (not (= m6 5)) (>= l5 (*   5 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 10894 ))

(check-sat)
(get-model)
