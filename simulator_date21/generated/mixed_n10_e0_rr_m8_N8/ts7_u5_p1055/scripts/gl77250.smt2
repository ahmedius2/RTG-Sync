; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 128, r = 2
(declare-const m2 Int) ; h = 3, c = 141, r = 43
(declare-const m3 Int) ; h = 7, c = 145, r = 90
(declare-const m4 Int) ; h = 4, c = 123, r = 17
(declare-const m5 Int) ; h = 8, c = 175, r = 21
(declare-const m6 Int) ; h = 3, c = 187, r = 2
(declare-const m7 Int) ; h = 3, c = 186, r = 18
(declare-const m8 Int) ; h = 2, c = 151, r = 42

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 8 0)) (ite (= m6 1) 3 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 8 0)) (ite (= m6 2) 3 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 8 0)) (ite (= m6 3) 3 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 8 0)) (ite (= m6 4) 3 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 8 0)) (ite (= m6 5) 3 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 3 0)) (ite (= m3 6) 7 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 8 0)) (ite (= m6 6) 3 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 3 0)) (ite (= m3 7) 7 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 8 0)) (ite (= m6 7) 3 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 43 0)) (ite (= m3 1) 90 0)) (ite (= m4 1) 17 0)) (ite (= m5 1) 21 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 18 0)) (ite (= m8 1) 42 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 43 0)) (ite (= m3 2) 90 0)) (ite (= m4 2) 17 0)) (ite (= m5 2) 21 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 18 0)) (ite (= m8 2) 42 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 43 0)) (ite (= m3 3) 90 0)) (ite (= m4 3) 17 0)) (ite (= m5 3) 21 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 18 0)) (ite (= m8 3) 42 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 43 0)) (ite (= m3 4) 90 0)) (ite (= m4 4) 17 0)) (ite (= m5 4) 21 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 18 0)) (ite (= m8 4) 42 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 43 0)) (ite (= m3 5) 90 0)) (ite (= m4 5) 17 0)) (ite (= m5 5) 21 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 18 0)) (ite (= m8 5) 42 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 43 0)) (ite (= m3 6) 90 0)) (ite (= m4 6) 17 0)) (ite (= m5 6) 21 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 18 0)) (ite (= m8 6) 42 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 43 0)) (ite (= m3 7) 90 0)) (ite (= m4 7) 17 0)) (ite (= m5 7) 21 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 18 0)) (ite (= m8 7) 42 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 128 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 141 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 145 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 123 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 175 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 187 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 186 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 151 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 128 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 141 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 145 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 123 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 175 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 187 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 186 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 151 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 128 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 141 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 145 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 123 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 175 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 187 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 186 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 151 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 128 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 141 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 145 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 123 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 175 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 187 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 186 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 151 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 128 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 141 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 145 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 123 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 175 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 187 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 186 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 151 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 128 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 141 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 145 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 123 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 175 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 187 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 186 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 151 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 128 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 141 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 145 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 123 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 175 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 187 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 186 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 151 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 77250 ))

(check-sat)
(get-model)
