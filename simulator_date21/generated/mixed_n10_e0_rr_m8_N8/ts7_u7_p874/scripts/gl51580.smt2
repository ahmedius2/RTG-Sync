; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 102, r = 45
(declare-const m2 Int) ; h = 5, c =  94, r = 50
(declare-const m3 Int) ; h = 2, c = 128, r = 13
(declare-const m4 Int) ; h = 4, c = 138, r = 13
(declare-const m5 Int) ; h = 6, c = 125, r = 72
(declare-const m6 Int) ; h = 4, c = 128, r = 37
(declare-const m7 Int) ; h = 2, c = 106, r = 45
(declare-const m8 Int) ; h = 6, c =  96, r = 71

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 6 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 2 0)) (ite (= m8 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 6 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 2 0)) (ite (= m8 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 5 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 6 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 2 0)) (ite (= m8 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 5 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 6 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 2 0)) (ite (= m8 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 5 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 6 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 2 0)) (ite (= m8 5) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 5 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 6 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 2 0)) (ite (= m8 6) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 5 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 6 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 2 0)) (ite (= m8 7) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 45 0) (ite (= m2 1) 50 0)) (ite (= m3 1) 13 0)) (ite (= m4 1) 13 0)) (ite (= m5 1) 72 0)) (ite (= m6 1) 37 0)) (ite (= m7 1) 45 0)) (ite (= m8 1) 71 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 45 0) (ite (= m2 2) 50 0)) (ite (= m3 2) 13 0)) (ite (= m4 2) 13 0)) (ite (= m5 2) 72 0)) (ite (= m6 2) 37 0)) (ite (= m7 2) 45 0)) (ite (= m8 2) 71 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 45 0) (ite (= m2 3) 50 0)) (ite (= m3 3) 13 0)) (ite (= m4 3) 13 0)) (ite (= m5 3) 72 0)) (ite (= m6 3) 37 0)) (ite (= m7 3) 45 0)) (ite (= m8 3) 71 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 45 0) (ite (= m2 4) 50 0)) (ite (= m3 4) 13 0)) (ite (= m4 4) 13 0)) (ite (= m5 4) 72 0)) (ite (= m6 4) 37 0)) (ite (= m7 4) 45 0)) (ite (= m8 4) 71 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 45 0) (ite (= m2 5) 50 0)) (ite (= m3 5) 13 0)) (ite (= m4 5) 13 0)) (ite (= m5 5) 72 0)) (ite (= m6 5) 37 0)) (ite (= m7 5) 45 0)) (ite (= m8 5) 71 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 45 0) (ite (= m2 6) 50 0)) (ite (= m3 6) 13 0)) (ite (= m4 6) 13 0)) (ite (= m5 6) 72 0)) (ite (= m6 6) 37 0)) (ite (= m7 6) 45 0)) (ite (= m8 6) 71 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 45 0) (ite (= m2 7) 50 0)) (ite (= m3 7) 13 0)) (ite (= m4 7) 13 0)) (ite (= m5 7) 72 0)) (ite (= m6 7) 37 0)) (ite (= m7 7) 45 0)) (ite (= m8 7) 71 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 102 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 128 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 138 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 125 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 128 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 106 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  96 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 102 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 128 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 138 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 125 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 128 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 106 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  96 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 102 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 128 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 138 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 125 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 128 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 106 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  96 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 102 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  94 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 128 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 138 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 125 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 128 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 106 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  96 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 102 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  94 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 128 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 138 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 125 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 128 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 106 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  96 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 102 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  94 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 128 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 138 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 125 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 128 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 106 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  96 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 102 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  94 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 128 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 138 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 125 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 128 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 106 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  96 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 51580 ))

(check-sat)
(get-model)
