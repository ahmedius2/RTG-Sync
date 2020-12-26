; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 102, r = 84
(declare-const m2 Int) ; h = 2, c =  74, r = 2
(declare-const m3 Int) ; h = 4, c =  86, r = 91
(declare-const m4 Int) ; h = 1, c =  94, r = 26
(declare-const m5 Int) ; h = 1, c = 137, r = 63
(declare-const m6 Int) ; h = 6, c =  73, r = 34

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 84 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 91 0)) (ite (= m4 1) 26 0)) (ite (= m5 1) 63 0)) (ite (= m6 1) 34 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 84 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 91 0)) (ite (= m4 2) 26 0)) (ite (= m5 2) 63 0)) (ite (= m6 2) 34 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 84 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 91 0)) (ite (= m4 3) 26 0)) (ite (= m5 3) 63 0)) (ite (= m6 3) 34 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 84 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 91 0)) (ite (= m4 4) 26 0)) (ite (= m5 4) 63 0)) (ite (= m6 4) 34 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 84 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 91 0)) (ite (= m4 5) 26 0)) (ite (= m5 5) 63 0)) (ite (= m6 5) 34 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 102 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  74 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  86 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 137 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  73 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 102 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  74 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  86 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 137 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  73 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 102 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  74 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  86 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 137 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  73 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 102 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  74 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  86 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  94 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 137 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  73 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 102 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  74 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  86 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  94 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 137 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  73 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 33518 ))

(check-sat)
(get-model)
