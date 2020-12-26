; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 123, r = 68
(declare-const m2 Int) ; h = 4, c = 194, r = 9
(declare-const m3 Int) ; h = 2, c = 142, r = 29
(declare-const m4 Int) ; h = 2, c = 203, r = 89
(declare-const m5 Int) ; h = 1, c = 211, r = 38
(declare-const m6 Int) ; h = 1, c = 167, r = 43
(declare-const m7 Int) ; h = 1, c = 214, r = 60
(declare-const m8 Int) ; h = 5, c = 125, r = 90

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 3 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 3 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 3 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 3 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 68 0) (ite (= m2 1) 9 0)) (ite (= m3 1) 29 0)) (ite (= m4 1) 89 0)) (ite (= m5 1) 38 0)) (ite (= m6 1) 43 0)) (ite (= m7 1) 60 0)) (ite (= m8 1) 90 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 68 0) (ite (= m2 2) 9 0)) (ite (= m3 2) 29 0)) (ite (= m4 2) 89 0)) (ite (= m5 2) 38 0)) (ite (= m6 2) 43 0)) (ite (= m7 2) 60 0)) (ite (= m8 2) 90 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 68 0) (ite (= m2 3) 9 0)) (ite (= m3 3) 29 0)) (ite (= m4 3) 89 0)) (ite (= m5 3) 38 0)) (ite (= m6 3) 43 0)) (ite (= m7 3) 60 0)) (ite (= m8 3) 90 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 68 0) (ite (= m2 4) 9 0)) (ite (= m3 4) 29 0)) (ite (= m4 4) 89 0)) (ite (= m5 4) 38 0)) (ite (= m6 4) 43 0)) (ite (= m7 4) 60 0)) (ite (= m8 4) 90 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 68 0) (ite (= m2 5) 9 0)) (ite (= m3 5) 29 0)) (ite (= m4 5) 89 0)) (ite (= m5 5) 38 0)) (ite (= m6 5) 43 0)) (ite (= m7 5) 60 0)) (ite (= m8 5) 90 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 68 0) (ite (= m2 6) 9 0)) (ite (= m3 6) 29 0)) (ite (= m4 6) 89 0)) (ite (= m5 6) 38 0)) (ite (= m6 6) 43 0)) (ite (= m7 6) 60 0)) (ite (= m8 6) 90 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 68 0) (ite (= m2 7) 9 0)) (ite (= m3 7) 29 0)) (ite (= m4 7) 89 0)) (ite (= m5 7) 38 0)) (ite (= m6 7) 43 0)) (ite (= m7 7) 60 0)) (ite (= m8 7) 90 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 123 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 194 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 142 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 203 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 211 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 167 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 214 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 125 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 123 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 194 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 142 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 203 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 211 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 167 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 214 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 125 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 123 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 194 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 142 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 203 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 211 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 167 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 214 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 125 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 123 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 194 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 142 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 203 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 211 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 167 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 214 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 125 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 123 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 194 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 142 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 203 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 211 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 167 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 214 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 125 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 123 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 194 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 142 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 203 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 211 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 167 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 214 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 125 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 123 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 194 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 142 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 203 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 211 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 167 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 214 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 125 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 75413 ))

(check-sat)
(get-model)
