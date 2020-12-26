; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c =  30, r = 20
(declare-const m2 Int) ; h = 2, c =  27, r = 21
(declare-const m3 Int) ; h = 6, c =  34, r = 2
(declare-const m4 Int) ; h = 1, c =  32, r = 34
(declare-const m5 Int) ; h = 5, c =  35, r = 31
(declare-const m6 Int) ; h = 4, c =  25, r = 13
(declare-const m7 Int) ; h = 1, c =  36, r = 43
(declare-const m8 Int) ; h = 4, c =  32, r = 99

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 3 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 3 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 6 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 3 0) (ite (= m2 6) 2 0)) (ite (= m3 6) 6 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 3 0) (ite (= m2 7) 2 0)) (ite (= m3 7) 6 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 4 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 20 0) (ite (= m2 1) 21 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 34 0)) (ite (= m5 1) 31 0)) (ite (= m6 1) 13 0)) (ite (= m7 1) 43 0)) (ite (= m8 1) 99 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 20 0) (ite (= m2 2) 21 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 34 0)) (ite (= m5 2) 31 0)) (ite (= m6 2) 13 0)) (ite (= m7 2) 43 0)) (ite (= m8 2) 99 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 20 0) (ite (= m2 3) 21 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 34 0)) (ite (= m5 3) 31 0)) (ite (= m6 3) 13 0)) (ite (= m7 3) 43 0)) (ite (= m8 3) 99 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 20 0) (ite (= m2 4) 21 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 34 0)) (ite (= m5 4) 31 0)) (ite (= m6 4) 13 0)) (ite (= m7 4) 43 0)) (ite (= m8 4) 99 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 20 0) (ite (= m2 5) 21 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 34 0)) (ite (= m5 5) 31 0)) (ite (= m6 5) 13 0)) (ite (= m7 5) 43 0)) (ite (= m8 5) 99 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 20 0) (ite (= m2 6) 21 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 34 0)) (ite (= m5 6) 31 0)) (ite (= m6 6) 13 0)) (ite (= m7 6) 43 0)) (ite (= m8 6) 99 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 20 0) (ite (= m2 7) 21 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 34 0)) (ite (= m5 7) 31 0)) (ite (= m6 7) 13 0)) (ite (= m7 7) 43 0)) (ite (= m8 7) 99 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  30 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  27 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  34 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  32 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  35 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  25 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  36 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  32 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  30 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  27 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  34 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  32 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  35 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  25 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  36 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  32 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  30 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  27 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  34 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  32 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  35 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  25 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  36 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  32 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  30 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  27 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  34 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  32 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  35 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  25 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  36 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  32 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  30 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  27 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  34 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  32 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  35 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  25 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  36 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  32 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  30 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  27 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  34 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  32 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  35 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  25 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  36 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  32 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  30 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  27 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  34 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  32 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  35 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  25 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  36 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  32 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 13000 ))

(check-sat)
(get-model)
