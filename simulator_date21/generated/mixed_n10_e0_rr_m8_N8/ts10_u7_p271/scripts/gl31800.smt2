; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  47, r = 23
(declare-const m2 Int) ; h = 7, c =  42, r = 62
(declare-const m3 Int) ; h = 8, c =  34, r = 21
(declare-const m4 Int) ; h = 3, c =  27, r = 45
(declare-const m5 Int) ; h = 2, c =  28, r = 37
(declare-const m6 Int) ; h = 2, c =  43, r = 37
(declare-const m7 Int) ; h = 8, c =  51, r = 66
(declare-const m8 Int) ; h = 5, c =  46, r = 15

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 1 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 1 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 1 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 1 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 3 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 23 0) (ite (= m2 1) 62 0)) (ite (= m3 1) 21 0)) (ite (= m4 1) 45 0)) (ite (= m5 1) 37 0)) (ite (= m6 1) 37 0)) (ite (= m7 1) 66 0)) (ite (= m8 1) 15 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 23 0) (ite (= m2 2) 62 0)) (ite (= m3 2) 21 0)) (ite (= m4 2) 45 0)) (ite (= m5 2) 37 0)) (ite (= m6 2) 37 0)) (ite (= m7 2) 66 0)) (ite (= m8 2) 15 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 23 0) (ite (= m2 3) 62 0)) (ite (= m3 3) 21 0)) (ite (= m4 3) 45 0)) (ite (= m5 3) 37 0)) (ite (= m6 3) 37 0)) (ite (= m7 3) 66 0)) (ite (= m8 3) 15 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 23 0) (ite (= m2 4) 62 0)) (ite (= m3 4) 21 0)) (ite (= m4 4) 45 0)) (ite (= m5 4) 37 0)) (ite (= m6 4) 37 0)) (ite (= m7 4) 66 0)) (ite (= m8 4) 15 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 23 0) (ite (= m2 5) 62 0)) (ite (= m3 5) 21 0)) (ite (= m4 5) 45 0)) (ite (= m5 5) 37 0)) (ite (= m6 5) 37 0)) (ite (= m7 5) 66 0)) (ite (= m8 5) 15 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 23 0) (ite (= m2 6) 62 0)) (ite (= m3 6) 21 0)) (ite (= m4 6) 45 0)) (ite (= m5 6) 37 0)) (ite (= m6 6) 37 0)) (ite (= m7 6) 66 0)) (ite (= m8 6) 15 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 23 0) (ite (= m2 7) 62 0)) (ite (= m3 7) 21 0)) (ite (= m4 7) 45 0)) (ite (= m5 7) 37 0)) (ite (= m6 7) 37 0)) (ite (= m7 7) 66 0)) (ite (= m8 7) 15 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  47 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  42 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  34 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  27 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  28 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  43 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  51 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  46 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  47 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  42 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  34 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  27 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  28 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  43 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  51 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  46 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  47 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  42 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  34 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  27 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  28 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  43 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  51 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  46 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  47 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  42 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  34 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  27 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  28 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  43 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  51 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  46 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  47 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  42 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  34 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  27 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  28 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  43 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  51 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  46 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  47 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  42 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  34 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  27 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  28 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  43 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  51 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  46 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  47 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  42 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  34 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  27 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  28 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  43 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  51 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  46 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 31800 ))

(check-sat)
(get-model)
