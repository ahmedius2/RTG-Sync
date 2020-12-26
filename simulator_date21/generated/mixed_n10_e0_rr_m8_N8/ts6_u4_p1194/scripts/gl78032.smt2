; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 202, r = 58
(declare-const m2 Int) ; h = 8, c = 182, r = 73
(declare-const m3 Int) ; h = 8, c = 153, r = 12
(declare-const m4 Int) ; h = 7, c = 169, r = 16
(declare-const m5 Int) ; h = 1, c = 177, r = 67
(declare-const m6 Int) ; h = 5, c =  66, r = 88

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 8 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 58 0) (ite (= m2 1) 73 0)) (ite (= m3 1) 12 0)) (ite (= m4 1) 16 0)) (ite (= m5 1) 67 0)) (ite (= m6 1) 88 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 58 0) (ite (= m2 2) 73 0)) (ite (= m3 2) 12 0)) (ite (= m4 2) 16 0)) (ite (= m5 2) 67 0)) (ite (= m6 2) 88 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 58 0) (ite (= m2 3) 73 0)) (ite (= m3 3) 12 0)) (ite (= m4 3) 16 0)) (ite (= m5 3) 67 0)) (ite (= m6 3) 88 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 58 0) (ite (= m2 4) 73 0)) (ite (= m3 4) 12 0)) (ite (= m4 4) 16 0)) (ite (= m5 4) 67 0)) (ite (= m6 4) 88 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 58 0) (ite (= m2 5) 73 0)) (ite (= m3 5) 12 0)) (ite (= m4 5) 16 0)) (ite (= m5 5) 67 0)) (ite (= m6 5) 88 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 202 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 182 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 153 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 169 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 177 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  66 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 202 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 182 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 153 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 169 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 177 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  66 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 202 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 182 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 153 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 169 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 177 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  66 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 202 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 182 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 153 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 169 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 177 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  66 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 202 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 182 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 153 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 169 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 177 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  66 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 78032 ))

(check-sat)
(get-model)
