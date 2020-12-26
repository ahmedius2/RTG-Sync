; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 136, r = 56
(declare-const m2 Int) ; h = 3, c = 147, r = 81
(declare-const m3 Int) ; h = 7, c = 137, r = 34
(declare-const m4 Int) ; h = 7, c =  88, r = 81
(declare-const m5 Int) ; h = 1, c = 117, r = 20
(declare-const m6 Int) ; h = 3, c =  10, r = 96

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 56 0) (ite (= m2 1) 81 0)) (ite (= m3 1) 34 0)) (ite (= m4 1) 81 0)) (ite (= m5 1) 20 0)) (ite (= m6 1) 96 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 56 0) (ite (= m2 2) 81 0)) (ite (= m3 2) 34 0)) (ite (= m4 2) 81 0)) (ite (= m5 2) 20 0)) (ite (= m6 2) 96 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 56 0) (ite (= m2 3) 81 0)) (ite (= m3 3) 34 0)) (ite (= m4 3) 81 0)) (ite (= m5 3) 20 0)) (ite (= m6 3) 96 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 56 0) (ite (= m2 4) 81 0)) (ite (= m3 4) 34 0)) (ite (= m4 4) 81 0)) (ite (= m5 4) 20 0)) (ite (= m6 4) 96 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 56 0) (ite (= m2 5) 81 0)) (ite (= m3 5) 34 0)) (ite (= m4 5) 81 0)) (ite (= m5 5) 20 0)) (ite (= m6 5) 96 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 136 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 147 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 137 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  88 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 117 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  10 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 136 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 147 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 137 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  88 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 117 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  10 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 136 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 147 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 137 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  88 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 117 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  10 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 136 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 147 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 137 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  88 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 117 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  10 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 136 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 147 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 137 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  88 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 117 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  10 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 43642 ))

(check-sat)
(get-model)
