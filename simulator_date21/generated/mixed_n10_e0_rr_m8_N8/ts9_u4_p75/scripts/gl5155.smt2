; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c =   7, r = 95
(declare-const m2 Int) ; h = 3, c =   9, r = 90
(declare-const m3 Int) ; h = 5, c =   9, r = 44
(declare-const m4 Int) ; h = 5, c =   7, r = 85
(declare-const m5 Int) ; h = 2, c =   8, r = 42
(declare-const m6 Int) ; h = 4, c =   7, r = 82
(declare-const m7 Int) ; h = 5, c =  12, r = 86
(declare-const m8 Int) ; h = 5, c =   8, r = 38

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 5 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 5 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 5 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 5 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 5 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 5 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 3 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 5 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 5 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 3 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 5 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 5 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 95 0) (ite (= m2 1) 90 0)) (ite (= m3 1) 44 0)) (ite (= m4 1) 85 0)) (ite (= m5 1) 42 0)) (ite (= m6 1) 82 0)) (ite (= m7 1) 86 0)) (ite (= m8 1) 38 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 95 0) (ite (= m2 2) 90 0)) (ite (= m3 2) 44 0)) (ite (= m4 2) 85 0)) (ite (= m5 2) 42 0)) (ite (= m6 2) 82 0)) (ite (= m7 2) 86 0)) (ite (= m8 2) 38 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 95 0) (ite (= m2 3) 90 0)) (ite (= m3 3) 44 0)) (ite (= m4 3) 85 0)) (ite (= m5 3) 42 0)) (ite (= m6 3) 82 0)) (ite (= m7 3) 86 0)) (ite (= m8 3) 38 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 95 0) (ite (= m2 4) 90 0)) (ite (= m3 4) 44 0)) (ite (= m4 4) 85 0)) (ite (= m5 4) 42 0)) (ite (= m6 4) 82 0)) (ite (= m7 4) 86 0)) (ite (= m8 4) 38 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 95 0) (ite (= m2 5) 90 0)) (ite (= m3 5) 44 0)) (ite (= m4 5) 85 0)) (ite (= m5 5) 42 0)) (ite (= m6 5) 82 0)) (ite (= m7 5) 86 0)) (ite (= m8 5) 38 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 95 0) (ite (= m2 6) 90 0)) (ite (= m3 6) 44 0)) (ite (= m4 6) 85 0)) (ite (= m5 6) 42 0)) (ite (= m6 6) 82 0)) (ite (= m7 6) 86 0)) (ite (= m8 6) 38 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 95 0) (ite (= m2 7) 90 0)) (ite (= m3 7) 44 0)) (ite (= m4 7) 85 0)) (ite (= m5 7) 42 0)) (ite (= m6 7) 82 0)) (ite (= m7 7) 86 0)) (ite (= m8 7) 38 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*   7 s1))))
(assert (or (not (= m2 1)) (>= l1 (*   9 s1))))
(assert (or (not (= m3 1)) (>= l1 (*   9 s1))))
(assert (or (not (= m4 1)) (>= l1 (*   7 s1))))
(assert (or (not (= m5 1)) (>= l1 (*   8 s1))))
(assert (or (not (= m6 1)) (>= l1 (*   7 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  12 s1))))
(assert (or (not (= m8 1)) (>= l1 (*   8 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*   7 s2))))
(assert (or (not (= m2 2)) (>= l2 (*   9 s2))))
(assert (or (not (= m3 2)) (>= l2 (*   9 s2))))
(assert (or (not (= m4 2)) (>= l2 (*   7 s2))))
(assert (or (not (= m5 2)) (>= l2 (*   8 s2))))
(assert (or (not (= m6 2)) (>= l2 (*   7 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  12 s2))))
(assert (or (not (= m8 2)) (>= l2 (*   8 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*   7 s3))))
(assert (or (not (= m2 3)) (>= l3 (*   9 s3))))
(assert (or (not (= m3 3)) (>= l3 (*   9 s3))))
(assert (or (not (= m4 3)) (>= l3 (*   7 s3))))
(assert (or (not (= m5 3)) (>= l3 (*   8 s3))))
(assert (or (not (= m6 3)) (>= l3 (*   7 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  12 s3))))
(assert (or (not (= m8 3)) (>= l3 (*   8 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*   7 s4))))
(assert (or (not (= m2 4)) (>= l4 (*   9 s4))))
(assert (or (not (= m3 4)) (>= l4 (*   9 s4))))
(assert (or (not (= m4 4)) (>= l4 (*   7 s4))))
(assert (or (not (= m5 4)) (>= l4 (*   8 s4))))
(assert (or (not (= m6 4)) (>= l4 (*   7 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  12 s4))))
(assert (or (not (= m8 4)) (>= l4 (*   8 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*   7 s5))))
(assert (or (not (= m2 5)) (>= l5 (*   9 s5))))
(assert (or (not (= m3 5)) (>= l5 (*   9 s5))))
(assert (or (not (= m4 5)) (>= l5 (*   7 s5))))
(assert (or (not (= m5 5)) (>= l5 (*   8 s5))))
(assert (or (not (= m6 5)) (>= l5 (*   7 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  12 s5))))
(assert (or (not (= m8 5)) (>= l5 (*   8 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*   7 s6))))
(assert (or (not (= m2 6)) (>= l6 (*   9 s6))))
(assert (or (not (= m3 6)) (>= l6 (*   9 s6))))
(assert (or (not (= m4 6)) (>= l6 (*   7 s6))))
(assert (or (not (= m5 6)) (>= l6 (*   8 s6))))
(assert (or (not (= m6 6)) (>= l6 (*   7 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  12 s6))))
(assert (or (not (= m8 6)) (>= l6 (*   8 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*   7 s7))))
(assert (or (not (= m2 7)) (>= l7 (*   9 s7))))
(assert (or (not (= m3 7)) (>= l7 (*   9 s7))))
(assert (or (not (= m4 7)) (>= l7 (*   7 s7))))
(assert (or (not (= m5 7)) (>= l7 (*   8 s7))))
(assert (or (not (= m6 7)) (>= l7 (*   7 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  12 s7))))
(assert (or (not (= m8 7)) (>= l7 (*   8 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 5155 ))

(check-sat)
(get-model)
