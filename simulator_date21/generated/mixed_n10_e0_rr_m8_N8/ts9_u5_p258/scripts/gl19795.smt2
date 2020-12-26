; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c =  46, r = 44
(declare-const m2 Int) ; h = 2, c =  36, r = 28
(declare-const m3 Int) ; h = 2, c =  41, r = 12
(declare-const m4 Int) ; h = 2, c =  37, r = 65
(declare-const m5 Int) ; h = 7, c =  47, r = 49
(declare-const m6 Int) ; h = 4, c =  34, r = 1
(declare-const m7 Int) ; h = 3, c =  44, r = 32
(declare-const m8 Int) ; h = 4, c =  24, r = 59

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 7 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 7 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 7 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 7 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 7 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 2 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 7 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 2 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 7 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 4 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 44 0) (ite (= m2 1) 28 0)) (ite (= m3 1) 12 0)) (ite (= m4 1) 65 0)) (ite (= m5 1) 49 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 32 0)) (ite (= m8 1) 59 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 44 0) (ite (= m2 2) 28 0)) (ite (= m3 2) 12 0)) (ite (= m4 2) 65 0)) (ite (= m5 2) 49 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 32 0)) (ite (= m8 2) 59 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 44 0) (ite (= m2 3) 28 0)) (ite (= m3 3) 12 0)) (ite (= m4 3) 65 0)) (ite (= m5 3) 49 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 32 0)) (ite (= m8 3) 59 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 44 0) (ite (= m2 4) 28 0)) (ite (= m3 4) 12 0)) (ite (= m4 4) 65 0)) (ite (= m5 4) 49 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 32 0)) (ite (= m8 4) 59 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 44 0) (ite (= m2 5) 28 0)) (ite (= m3 5) 12 0)) (ite (= m4 5) 65 0)) (ite (= m5 5) 49 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 32 0)) (ite (= m8 5) 59 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 44 0) (ite (= m2 6) 28 0)) (ite (= m3 6) 12 0)) (ite (= m4 6) 65 0)) (ite (= m5 6) 49 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 32 0)) (ite (= m8 6) 59 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 44 0) (ite (= m2 7) 28 0)) (ite (= m3 7) 12 0)) (ite (= m4 7) 65 0)) (ite (= m5 7) 49 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 32 0)) (ite (= m8 7) 59 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  46 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  36 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  41 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  37 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  47 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  34 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  44 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  24 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  46 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  36 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  41 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  37 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  47 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  34 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  44 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  24 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  46 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  36 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  41 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  37 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  47 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  34 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  44 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  24 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  46 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  36 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  41 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  37 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  47 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  34 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  44 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  24 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  46 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  36 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  41 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  37 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  47 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  34 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  44 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  24 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  46 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  36 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  41 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  37 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  47 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  34 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  44 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  24 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  46 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  36 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  41 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  37 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  47 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  34 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  44 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  24 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 19795 ))

(check-sat)
(get-model)
