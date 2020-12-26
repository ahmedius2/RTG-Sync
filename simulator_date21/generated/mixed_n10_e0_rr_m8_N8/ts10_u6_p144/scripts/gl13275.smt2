; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c =  22, r = 61
(declare-const m2 Int) ; h = 4, c =  19, r = 96
(declare-const m3 Int) ; h = 5, c =  21, r = 87
(declare-const m4 Int) ; h = 2, c =  16, r = 91
(declare-const m5 Int) ; h = 2, c =  26, r = 19
(declare-const m6 Int) ; h = 8, c =  25, r = 20
(declare-const m7 Int) ; h = 8, c =  28, r = 61
(declare-const m8 Int) ; h = 1, c =  20, r = 4

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 8 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 8 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 8 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 8 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 8 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 8 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 8 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 1 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 61 0) (ite (= m2 1) 96 0)) (ite (= m3 1) 87 0)) (ite (= m4 1) 91 0)) (ite (= m5 1) 19 0)) (ite (= m6 1) 20 0)) (ite (= m7 1) 61 0)) (ite (= m8 1) 4 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 61 0) (ite (= m2 2) 96 0)) (ite (= m3 2) 87 0)) (ite (= m4 2) 91 0)) (ite (= m5 2) 19 0)) (ite (= m6 2) 20 0)) (ite (= m7 2) 61 0)) (ite (= m8 2) 4 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 61 0) (ite (= m2 3) 96 0)) (ite (= m3 3) 87 0)) (ite (= m4 3) 91 0)) (ite (= m5 3) 19 0)) (ite (= m6 3) 20 0)) (ite (= m7 3) 61 0)) (ite (= m8 3) 4 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 61 0) (ite (= m2 4) 96 0)) (ite (= m3 4) 87 0)) (ite (= m4 4) 91 0)) (ite (= m5 4) 19 0)) (ite (= m6 4) 20 0)) (ite (= m7 4) 61 0)) (ite (= m8 4) 4 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 61 0) (ite (= m2 5) 96 0)) (ite (= m3 5) 87 0)) (ite (= m4 5) 91 0)) (ite (= m5 5) 19 0)) (ite (= m6 5) 20 0)) (ite (= m7 5) 61 0)) (ite (= m8 5) 4 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 61 0) (ite (= m2 6) 96 0)) (ite (= m3 6) 87 0)) (ite (= m4 6) 91 0)) (ite (= m5 6) 19 0)) (ite (= m6 6) 20 0)) (ite (= m7 6) 61 0)) (ite (= m8 6) 4 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 61 0) (ite (= m2 7) 96 0)) (ite (= m3 7) 87 0)) (ite (= m4 7) 91 0)) (ite (= m5 7) 19 0)) (ite (= m6 7) 20 0)) (ite (= m7 7) 61 0)) (ite (= m8 7) 4 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  22 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  19 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  21 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  16 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  26 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  25 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  28 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  20 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  22 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  19 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  21 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  16 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  26 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  25 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  28 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  20 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  22 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  19 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  21 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  16 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  26 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  25 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  28 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  20 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  22 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  19 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  21 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  16 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  26 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  25 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  28 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  20 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  22 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  19 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  21 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  16 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  26 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  25 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  28 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  20 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  22 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  19 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  21 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  16 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  26 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  25 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  28 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  20 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  22 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  19 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  21 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  16 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  26 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  25 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  28 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  20 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 13275 ))

(check-sat)
(get-model)
