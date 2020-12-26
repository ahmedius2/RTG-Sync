; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 222, r = 21
(declare-const m2 Int) ; h = 6, c = 280, r = 97
(declare-const m3 Int) ; h = 3, c = 273, r = 37
(declare-const m4 Int) ; h = 2, c = 168, r = 7
(declare-const m5 Int) ; h = 5, c = 187, r = 1
(declare-const m6 Int) ; h = 3, c = 223, r = 31

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 6 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 6 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 6 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 6 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 6 0) (ite (= m2 5) 6 0)) (ite (= m3 5) 3 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 21 0) (ite (= m2 1) 97 0)) (ite (= m3 1) 37 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 31 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 21 0) (ite (= m2 2) 97 0)) (ite (= m3 2) 37 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 31 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 21 0) (ite (= m2 3) 97 0)) (ite (= m3 3) 37 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 31 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 21 0) (ite (= m2 4) 97 0)) (ite (= m3 4) 37 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 31 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 21 0) (ite (= m2 5) 97 0)) (ite (= m3 5) 37 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 31 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 222 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 280 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 273 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 168 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 187 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 223 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 222 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 280 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 273 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 168 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 187 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 223 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 222 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 280 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 273 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 168 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 187 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 223 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 222 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 280 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 273 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 168 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 187 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 223 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 222 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 280 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 273 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 168 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 187 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 223 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 96322 ))

(check-sat)
(get-model)
