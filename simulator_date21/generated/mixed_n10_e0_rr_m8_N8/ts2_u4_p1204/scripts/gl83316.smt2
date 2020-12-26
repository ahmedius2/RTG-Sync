; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 173, r = 88
(declare-const m2 Int) ; h = 2, c = 131, r = 22
(declare-const m3 Int) ; h = 4, c = 236, r = 63
(declare-const m4 Int) ; h = 5, c = 156, r = 39
(declare-const m5 Int) ; h = 5, c = 162, r = 59
(declare-const m6 Int) ; h = 6, c = 106, r = 93

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 5 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 88 0) (ite (= m2 1) 22 0)) (ite (= m3 1) 63 0)) (ite (= m4 1) 39 0)) (ite (= m5 1) 59 0)) (ite (= m6 1) 93 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 88 0) (ite (= m2 2) 22 0)) (ite (= m3 2) 63 0)) (ite (= m4 2) 39 0)) (ite (= m5 2) 59 0)) (ite (= m6 2) 93 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 88 0) (ite (= m2 3) 22 0)) (ite (= m3 3) 63 0)) (ite (= m4 3) 39 0)) (ite (= m5 3) 59 0)) (ite (= m6 3) 93 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 88 0) (ite (= m2 4) 22 0)) (ite (= m3 4) 63 0)) (ite (= m4 4) 39 0)) (ite (= m5 4) 59 0)) (ite (= m6 4) 93 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 88 0) (ite (= m2 5) 22 0)) (ite (= m3 5) 63 0)) (ite (= m4 5) 39 0)) (ite (= m5 5) 59 0)) (ite (= m6 5) 93 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 173 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 131 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 236 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 162 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 106 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 173 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 131 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 236 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 162 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 106 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 173 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 131 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 236 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 162 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 106 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 173 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 131 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 236 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 162 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 106 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 173 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 131 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 236 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 156 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 162 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 106 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 83316 ))

(check-sat)
(get-model)
