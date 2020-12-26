; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 182, r = 49
(declare-const m2 Int) ; h = 1, c = 210, r = 98
(declare-const m3 Int) ; h = 6, c = 125, r = 85
(declare-const m4 Int) ; h = 7, c = 125, r = 37
(declare-const m5 Int) ; h = 1, c = 194, r = 5
(declare-const m6 Int) ; h = 8, c = 145, r = 20
(declare-const m7 Int) ; h = 8, c = 216, r = 95
(declare-const m8 Int) ; h = 3, c = 165, r = 53

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 8 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 8 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 8 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 3 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 8 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 3 0) (ite (= m2 5) 1 0)) (ite (= m3 5) 6 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 8 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 3 0) (ite (= m2 6) 1 0)) (ite (= m3 6) 6 0)) (ite (= m4 6) 7 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 8 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 3 0) (ite (= m2 7) 1 0)) (ite (= m3 7) 6 0)) (ite (= m4 7) 7 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 8 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 49 0) (ite (= m2 1) 98 0)) (ite (= m3 1) 85 0)) (ite (= m4 1) 37 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 20 0)) (ite (= m7 1) 95 0)) (ite (= m8 1) 53 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 49 0) (ite (= m2 2) 98 0)) (ite (= m3 2) 85 0)) (ite (= m4 2) 37 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 20 0)) (ite (= m7 2) 95 0)) (ite (= m8 2) 53 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 49 0) (ite (= m2 3) 98 0)) (ite (= m3 3) 85 0)) (ite (= m4 3) 37 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 20 0)) (ite (= m7 3) 95 0)) (ite (= m8 3) 53 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 49 0) (ite (= m2 4) 98 0)) (ite (= m3 4) 85 0)) (ite (= m4 4) 37 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 20 0)) (ite (= m7 4) 95 0)) (ite (= m8 4) 53 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 49 0) (ite (= m2 5) 98 0)) (ite (= m3 5) 85 0)) (ite (= m4 5) 37 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 20 0)) (ite (= m7 5) 95 0)) (ite (= m8 5) 53 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 49 0) (ite (= m2 6) 98 0)) (ite (= m3 6) 85 0)) (ite (= m4 6) 37 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 20 0)) (ite (= m7 6) 95 0)) (ite (= m8 6) 53 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 49 0) (ite (= m2 7) 98 0)) (ite (= m3 7) 85 0)) (ite (= m4 7) 37 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 20 0)) (ite (= m7 7) 95 0)) (ite (= m8 7) 53 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 182 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 210 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 125 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 125 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 194 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 145 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 216 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 165 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 182 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 210 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 125 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 125 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 194 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 145 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 216 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 165 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 182 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 210 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 125 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 125 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 194 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 145 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 216 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 165 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 182 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 210 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 125 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 125 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 194 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 145 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 216 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 165 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 182 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 210 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 125 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 125 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 194 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 145 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 216 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 165 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 182 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 210 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 125 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 125 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 194 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 145 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 216 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 165 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 182 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 210 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 125 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 125 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 194 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 145 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 216 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 165 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 102150 ))

(check-sat)
(get-model)
