; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 110, r = 72
(declare-const m2 Int) ; h = 8, c = 103, r = 50
(declare-const m3 Int) ; h = 1, c =  63, r = 53
(declare-const m4 Int) ; h = 6, c =  68, r = 9
(declare-const m5 Int) ; h = 2, c = 104, r = 2
(declare-const m6 Int) ; h = 4, c =  68, r = 56
(declare-const m7 Int) ; h = 2, c =  80, r = 49
(declare-const m8 Int) ; h = 5, c = 113, r = 95

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 2 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 2 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 2 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 2 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 8 0)) (ite (= m3 5) 1 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 2 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 8 0)) (ite (= m3 6) 1 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 2 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 8 0)) (ite (= m3 7) 1 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 2 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 72 0) (ite (= m2 1) 50 0)) (ite (= m3 1) 53 0)) (ite (= m4 1) 9 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 56 0)) (ite (= m7 1) 49 0)) (ite (= m8 1) 95 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 72 0) (ite (= m2 2) 50 0)) (ite (= m3 2) 53 0)) (ite (= m4 2) 9 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 56 0)) (ite (= m7 2) 49 0)) (ite (= m8 2) 95 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 72 0) (ite (= m2 3) 50 0)) (ite (= m3 3) 53 0)) (ite (= m4 3) 9 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 56 0)) (ite (= m7 3) 49 0)) (ite (= m8 3) 95 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 72 0) (ite (= m2 4) 50 0)) (ite (= m3 4) 53 0)) (ite (= m4 4) 9 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 56 0)) (ite (= m7 4) 49 0)) (ite (= m8 4) 95 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 72 0) (ite (= m2 5) 50 0)) (ite (= m3 5) 53 0)) (ite (= m4 5) 9 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 56 0)) (ite (= m7 5) 49 0)) (ite (= m8 5) 95 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 72 0) (ite (= m2 6) 50 0)) (ite (= m3 6) 53 0)) (ite (= m4 6) 9 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 56 0)) (ite (= m7 6) 49 0)) (ite (= m8 6) 95 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 72 0) (ite (= m2 7) 50 0)) (ite (= m3 7) 53 0)) (ite (= m4 7) 9 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 56 0)) (ite (= m7 7) 49 0)) (ite (= m8 7) 95 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 110 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 103 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  63 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  68 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 104 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  68 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  80 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 113 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 110 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 103 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  63 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  68 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 104 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  68 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  80 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 113 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 110 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 103 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  63 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  68 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 104 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  68 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  80 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 113 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 110 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 103 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  63 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  68 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 104 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  68 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  80 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 113 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 110 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 103 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  63 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  68 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 104 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  68 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  80 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 113 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 110 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 103 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  63 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  68 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 104 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  68 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  80 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 113 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 110 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 103 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  63 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  68 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 104 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  68 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  80 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 113 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 46528 ))

(check-sat)
(get-model)
