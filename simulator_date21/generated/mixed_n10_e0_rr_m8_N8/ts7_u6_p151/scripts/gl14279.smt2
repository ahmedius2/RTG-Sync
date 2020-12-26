; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  16, r = 53
(declare-const m2 Int) ; h = 7, c =  20, r = 51
(declare-const m3 Int) ; h = 8, c =  26, r = 7
(declare-const m4 Int) ; h = 2, c =  15, r = 39
(declare-const m5 Int) ; h = 6, c =  24, r = 36
(declare-const m6 Int) ; h = 1, c =  30, r = 84
(declare-const m7 Int) ; h = 8, c =  18, r = 4
(declare-const m8 Int) ; h = 7, c =  27, r = 100

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 6 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 6 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 6 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 1 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 6 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 1 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 6 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 1 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 6 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 1 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 6 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 53 0) (ite (= m2 1) 51 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 39 0)) (ite (= m5 1) 36 0)) (ite (= m6 1) 84 0)) (ite (= m7 1) 4 0)) (ite (= m8 1) 100 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 53 0) (ite (= m2 2) 51 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 39 0)) (ite (= m5 2) 36 0)) (ite (= m6 2) 84 0)) (ite (= m7 2) 4 0)) (ite (= m8 2) 100 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 53 0) (ite (= m2 3) 51 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 39 0)) (ite (= m5 3) 36 0)) (ite (= m6 3) 84 0)) (ite (= m7 3) 4 0)) (ite (= m8 3) 100 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 53 0) (ite (= m2 4) 51 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 39 0)) (ite (= m5 4) 36 0)) (ite (= m6 4) 84 0)) (ite (= m7 4) 4 0)) (ite (= m8 4) 100 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 53 0) (ite (= m2 5) 51 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 39 0)) (ite (= m5 5) 36 0)) (ite (= m6 5) 84 0)) (ite (= m7 5) 4 0)) (ite (= m8 5) 100 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 53 0) (ite (= m2 6) 51 0)) (ite (= m3 6) 7 0)) (ite (= m4 6) 39 0)) (ite (= m5 6) 36 0)) (ite (= m6 6) 84 0)) (ite (= m7 6) 4 0)) (ite (= m8 6) 100 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 53 0) (ite (= m2 7) 51 0)) (ite (= m3 7) 7 0)) (ite (= m4 7) 39 0)) (ite (= m5 7) 36 0)) (ite (= m6 7) 84 0)) (ite (= m7 7) 4 0)) (ite (= m8 7) 100 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  16 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  20 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  26 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  15 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  24 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  30 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  18 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  27 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  16 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  20 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  26 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  15 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  24 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  30 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  18 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  27 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  16 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  20 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  26 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  15 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  24 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  30 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  18 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  27 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  16 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  20 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  26 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  15 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  24 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  30 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  18 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  27 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  16 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  20 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  26 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  15 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  24 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  30 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  18 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  27 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  16 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  20 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  26 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  15 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  24 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  30 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  18 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  27 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  16 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  20 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  26 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  15 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  24 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  30 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  18 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  27 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 14279 ))

(check-sat)
(get-model)
