; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c =  17, r = 88
(declare-const m2 Int) ; h = 4, c =  16, r = 40
(declare-const m3 Int) ; h = 6, c =  10, r = 7
(declare-const m4 Int) ; h = 2, c =   9, r = 17
(declare-const m5 Int) ; h = 1, c =  12, r = 1
(declare-const m6 Int) ; h = 1, c =  10, r = 37
(declare-const m7 Int) ; h = 7, c =   9, r = 62
(declare-const m8 Int) ; h = 3, c =  10, r = 35

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 7 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 7 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 7 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 7 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 7 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 6 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 7 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 7 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 6 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 7 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 7 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 6 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 7 0)) (ite (= m8 7) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 88 0) (ite (= m2 1) 40 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 17 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 37 0)) (ite (= m7 1) 62 0)) (ite (= m8 1) 35 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 88 0) (ite (= m2 2) 40 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 17 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 37 0)) (ite (= m7 2) 62 0)) (ite (= m8 2) 35 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 88 0) (ite (= m2 3) 40 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 17 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 37 0)) (ite (= m7 3) 62 0)) (ite (= m8 3) 35 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 88 0) (ite (= m2 4) 40 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 17 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 37 0)) (ite (= m7 4) 62 0)) (ite (= m8 4) 35 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 88 0) (ite (= m2 5) 40 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 17 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 37 0)) (ite (= m7 5) 62 0)) (ite (= m8 5) 35 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 88 0) (ite (= m2 6) 40 0)) (ite (= m3 6) 7 0)) (ite (= m4 6) 17 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 37 0)) (ite (= m7 6) 62 0)) (ite (= m8 6) 35 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 88 0) (ite (= m2 7) 40 0)) (ite (= m3 7) 7 0)) (ite (= m4 7) 17 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 37 0)) (ite (= m7 7) 62 0)) (ite (= m8 7) 35 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  17 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  16 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  10 s1))))
(assert (or (not (= m4 1)) (>= l1 (*   9 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  12 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  10 s1))))
(assert (or (not (= m7 1)) (>= l1 (*   9 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  10 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  17 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  16 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  10 s2))))
(assert (or (not (= m4 2)) (>= l2 (*   9 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  12 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  10 s2))))
(assert (or (not (= m7 2)) (>= l2 (*   9 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  10 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  17 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  16 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  10 s3))))
(assert (or (not (= m4 3)) (>= l3 (*   9 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  12 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  10 s3))))
(assert (or (not (= m7 3)) (>= l3 (*   9 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  10 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  17 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  16 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  10 s4))))
(assert (or (not (= m4 4)) (>= l4 (*   9 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  12 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  10 s4))))
(assert (or (not (= m7 4)) (>= l4 (*   9 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  10 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  17 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  16 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  10 s5))))
(assert (or (not (= m4 5)) (>= l5 (*   9 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  12 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  10 s5))))
(assert (or (not (= m7 5)) (>= l5 (*   9 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  10 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  17 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  16 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  10 s6))))
(assert (or (not (= m4 6)) (>= l6 (*   9 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  12 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  10 s6))))
(assert (or (not (= m7 6)) (>= l6 (*   9 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  10 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  17 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  16 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  10 s7))))
(assert (or (not (= m4 7)) (>= l7 (*   9 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  12 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  10 s7))))
(assert (or (not (= m7 7)) (>= l7 (*   9 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  10 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 5812 ))

(check-sat)
(get-model)
