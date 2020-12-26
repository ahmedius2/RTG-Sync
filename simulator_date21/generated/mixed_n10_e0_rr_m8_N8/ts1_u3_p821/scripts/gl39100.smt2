; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 118, r = 4
(declare-const m2 Int) ; h = 4, c =  84, r = 32
(declare-const m3 Int) ; h = 8, c = 113, r = 53
(declare-const m4 Int) ; h = 2, c = 128, r = 3
(declare-const m5 Int) ; h = 2, c = 108, r = 52
(declare-const m6 Int) ; h = 6, c =  66, r = 19

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 3 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 3 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 32 0)) (ite (= m3 1) 53 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 52 0)) (ite (= m6 1) 19 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 32 0)) (ite (= m3 2) 53 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 52 0)) (ite (= m6 2) 19 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 32 0)) (ite (= m3 3) 53 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 52 0)) (ite (= m6 3) 19 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 4 0) (ite (= m2 4) 32 0)) (ite (= m3 4) 53 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 52 0)) (ite (= m6 4) 19 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 4 0) (ite (= m2 5) 32 0)) (ite (= m3 5) 53 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 52 0)) (ite (= m6 5) 19 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 118 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  84 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 113 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 128 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 108 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  66 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 118 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  84 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 113 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 128 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 108 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  66 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 118 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  84 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 113 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 128 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 108 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  66 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 118 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  84 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 113 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 128 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 108 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  66 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 118 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  84 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 113 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 128 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 108 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  66 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 39100 ))

(check-sat)
(get-model)
