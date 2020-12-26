; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  26, r = 16
(declare-const m2 Int) ; h = 7, c =  18, r = 88
(declare-const m3 Int) ; h = 5, c =  14, r = 5
(declare-const m4 Int) ; h = 3, c =  24, r = 89
(declare-const m5 Int) ; h = 5, c =  28, r = 100
(declare-const m6 Int) ; h = 1, c =  18, r = 60
(declare-const m7 Int) ; h = 2, c =  14, r = 41
(declare-const m8 Int) ; h = 2, c =  23, r = 5

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 2 0)) (ite (= m8 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 2 0)) (ite (= m8 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 2 0)) (ite (= m8 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 4 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 2 0)) (ite (= m8 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 4 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 2 0)) (ite (= m8 5) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 4 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 2 0)) (ite (= m8 6) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 4 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 3 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 2 0)) (ite (= m8 7) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 16 0) (ite (= m2 1) 88 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 89 0)) (ite (= m5 1) 100 0)) (ite (= m6 1) 60 0)) (ite (= m7 1) 41 0)) (ite (= m8 1) 5 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 16 0) (ite (= m2 2) 88 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 89 0)) (ite (= m5 2) 100 0)) (ite (= m6 2) 60 0)) (ite (= m7 2) 41 0)) (ite (= m8 2) 5 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 16 0) (ite (= m2 3) 88 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 89 0)) (ite (= m5 3) 100 0)) (ite (= m6 3) 60 0)) (ite (= m7 3) 41 0)) (ite (= m8 3) 5 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 16 0) (ite (= m2 4) 88 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 89 0)) (ite (= m5 4) 100 0)) (ite (= m6 4) 60 0)) (ite (= m7 4) 41 0)) (ite (= m8 4) 5 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 16 0) (ite (= m2 5) 88 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 89 0)) (ite (= m5 5) 100 0)) (ite (= m6 5) 60 0)) (ite (= m7 5) 41 0)) (ite (= m8 5) 5 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 16 0) (ite (= m2 6) 88 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 89 0)) (ite (= m5 6) 100 0)) (ite (= m6 6) 60 0)) (ite (= m7 6) 41 0)) (ite (= m8 6) 5 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 16 0) (ite (= m2 7) 88 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 89 0)) (ite (= m5 7) 100 0)) (ite (= m6 7) 60 0)) (ite (= m7 7) 41 0)) (ite (= m8 7) 5 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  26 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  18 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  14 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  24 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  28 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  18 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  14 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  23 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  26 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  18 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  14 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  24 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  28 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  18 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  14 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  23 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  26 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  18 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  14 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  24 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  28 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  18 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  14 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  23 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  26 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  18 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  14 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  24 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  28 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  18 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  14 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  23 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  26 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  18 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  14 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  24 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  28 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  18 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  14 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  23 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  26 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  18 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  14 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  24 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  28 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  18 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  14 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  23 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  26 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  18 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  14 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  24 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  28 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  18 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  14 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  23 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 9377 ))

(check-sat)
(get-model)
