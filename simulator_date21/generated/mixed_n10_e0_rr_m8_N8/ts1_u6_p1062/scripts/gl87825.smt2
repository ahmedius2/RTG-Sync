; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c = 159, r = 66
(declare-const m2 Int) ; h = 3, c = 168, r = 21
(declare-const m3 Int) ; h = 8, c = 160, r = 63
(declare-const m4 Int) ; h = 7, c = 114, r = 73
(declare-const m5 Int) ; h = 2, c = 203, r = 75
(declare-const m6 Int) ; h = 6, c = 112, r = 28
(declare-const m7 Int) ; h = 8, c = 130, r = 11
(declare-const m8 Int) ; h = 7, c = 125, r = 25

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)
(declare-const s5 Int)
(declare-const s6 Int)
(declare-const s7 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)
(declare-const l4 Int)
(declare-const l5 Int)
(declare-const l6 Int)
(declare-const l7 Int)

(assert (and (<= 1 m1) (<= m1 7))) ; 1 <= m1 <= 7
(assert (and (<= 1 m2) (<= m2 7))) ; 1 <= m2 <= 7
(assert (and (<= 1 m3) (<= m3 7))) ; 1 <= m3 <= 7
(assert (and (<= 1 m4) (<= m4 7))) ; 1 <= m4 <= 7
(assert (and (<= 1 m5) (<= m5 7))) ; 1 <= m5 <= 7
(assert (and (<= 1 m6) (<= m6 7))) ; 1 <= m6 <= 7
(assert (and (<= 1 m7) (<= m7 7))) ; 1 <= m7 <= 7
(assert (and (<= 1 m8) (<= m8 7))) ; 1 <= m8 <= 7

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 6 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 6 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 6 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 6 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 5 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 6 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 5 0) (ite (= m2 6) 3 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 7 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 6 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 5 0) (ite (= m2 7) 3 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 7 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 6 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 66 0) (ite (= m2 1) 21 0)) (ite (= m3 1) 63 0)) (ite (= m4 1) 73 0)) (ite (= m5 1) 75 0)) (ite (= m6 1) 28 0)) (ite (= m7 1) 11 0)) (ite (= m8 1) 25 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 66 0) (ite (= m2 2) 21 0)) (ite (= m3 2) 63 0)) (ite (= m4 2) 73 0)) (ite (= m5 2) 75 0)) (ite (= m6 2) 28 0)) (ite (= m7 2) 11 0)) (ite (= m8 2) 25 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 66 0) (ite (= m2 3) 21 0)) (ite (= m3 3) 63 0)) (ite (= m4 3) 73 0)) (ite (= m5 3) 75 0)) (ite (= m6 3) 28 0)) (ite (= m7 3) 11 0)) (ite (= m8 3) 25 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 66 0) (ite (= m2 4) 21 0)) (ite (= m3 4) 63 0)) (ite (= m4 4) 73 0)) (ite (= m5 4) 75 0)) (ite (= m6 4) 28 0)) (ite (= m7 4) 11 0)) (ite (= m8 4) 25 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 66 0) (ite (= m2 5) 21 0)) (ite (= m3 5) 63 0)) (ite (= m4 5) 73 0)) (ite (= m5 5) 75 0)) (ite (= m6 5) 28 0)) (ite (= m7 5) 11 0)) (ite (= m8 5) 25 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 66 0) (ite (= m2 6) 21 0)) (ite (= m3 6) 63 0)) (ite (= m4 6) 73 0)) (ite (= m5 6) 75 0)) (ite (= m6 6) 28 0)) (ite (= m7 6) 11 0)) (ite (= m8 6) 25 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 66 0) (ite (= m2 7) 21 0)) (ite (= m3 7) 63 0)) (ite (= m4 7) 73 0)) (ite (= m5 7) 75 0)) (ite (= m6 7) 28 0)) (ite (= m7 7) 11 0)) (ite (= m8 7) 25 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 159 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 168 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 160 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 114 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 203 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 112 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 130 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 125 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 159 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 168 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 160 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 114 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 203 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 112 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 130 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 125 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 159 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 168 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 160 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 114 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 203 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 112 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 130 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 125 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 159 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 168 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 160 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 114 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 203 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 112 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 130 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 125 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 159 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 168 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 160 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 114 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 203 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 112 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 130 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 125 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 159 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 168 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 160 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 114 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 203 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 112 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 130 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 125 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 159 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 168 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 160 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 114 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 203 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 112 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 130 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 125 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 87825 ))

(check-sat)
(get-model)
