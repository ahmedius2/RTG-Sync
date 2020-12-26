; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 193, r = 80
(declare-const m2 Int) ; h = 4, c = 202, r = 71
(declare-const m3 Int) ; h = 1, c = 188, r = 75
(declare-const m4 Int) ; h = 4, c = 168, r = 79
(declare-const m5 Int) ; h = 1, c = 156, r = 13
(declare-const m6 Int) ; h = 3, c = 212, r = 26
(declare-const m7 Int) ; h = 8, c = 193, r = 26
(declare-const m8 Int) ; h = 8, c = 188, r = 62

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 3 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 3 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 3 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 3 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 7 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 1 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 3 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 7 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 1 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 3 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 7 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 1 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 3 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 80 0) (ite (= m2 1) 71 0)) (ite (= m3 1) 75 0)) (ite (= m4 1) 79 0)) (ite (= m5 1) 13 0)) (ite (= m6 1) 26 0)) (ite (= m7 1) 26 0)) (ite (= m8 1) 62 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 80 0) (ite (= m2 2) 71 0)) (ite (= m3 2) 75 0)) (ite (= m4 2) 79 0)) (ite (= m5 2) 13 0)) (ite (= m6 2) 26 0)) (ite (= m7 2) 26 0)) (ite (= m8 2) 62 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 80 0) (ite (= m2 3) 71 0)) (ite (= m3 3) 75 0)) (ite (= m4 3) 79 0)) (ite (= m5 3) 13 0)) (ite (= m6 3) 26 0)) (ite (= m7 3) 26 0)) (ite (= m8 3) 62 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 80 0) (ite (= m2 4) 71 0)) (ite (= m3 4) 75 0)) (ite (= m4 4) 79 0)) (ite (= m5 4) 13 0)) (ite (= m6 4) 26 0)) (ite (= m7 4) 26 0)) (ite (= m8 4) 62 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 80 0) (ite (= m2 5) 71 0)) (ite (= m3 5) 75 0)) (ite (= m4 5) 79 0)) (ite (= m5 5) 13 0)) (ite (= m6 5) 26 0)) (ite (= m7 5) 26 0)) (ite (= m8 5) 62 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 80 0) (ite (= m2 6) 71 0)) (ite (= m3 6) 75 0)) (ite (= m4 6) 79 0)) (ite (= m5 6) 13 0)) (ite (= m6 6) 26 0)) (ite (= m7 6) 26 0)) (ite (= m8 6) 62 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 80 0) (ite (= m2 7) 71 0)) (ite (= m3 7) 75 0)) (ite (= m4 7) 79 0)) (ite (= m5 7) 13 0)) (ite (= m6 7) 26 0)) (ite (= m7 7) 26 0)) (ite (= m8 7) 62 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 193 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 202 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 188 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 168 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 212 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 193 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 188 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 193 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 202 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 188 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 168 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 212 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 193 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 188 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 193 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 202 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 188 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 168 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 212 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 193 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 188 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 193 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 202 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 188 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 168 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 212 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 193 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 188 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 193 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 202 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 188 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 168 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 156 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 212 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 193 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 188 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 193 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 202 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 188 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 168 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 156 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 212 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 193 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 188 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 193 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 202 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 188 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 168 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 156 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 212 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 193 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 188 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 106001 ))

(check-sat)
(get-model)
