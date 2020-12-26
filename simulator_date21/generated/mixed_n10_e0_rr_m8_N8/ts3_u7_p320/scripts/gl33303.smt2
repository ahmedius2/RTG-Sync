; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c =  39, r = 15
(declare-const m2 Int) ; h = 8, c =  33, r = 57
(declare-const m3 Int) ; h = 4, c =  64, r = 91
(declare-const m4 Int) ; h = 7, c =  53, r = 75
(declare-const m5 Int) ; h = 1, c =  48, r = 22
(declare-const m6 Int) ; h = 8, c =  60, r = 93
(declare-const m7 Int) ; h = 6, c =  43, r = 80
(declare-const m8 Int) ; h = 7, c =  41, r = 53

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 7 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 8 0)) (ite (= m7 1) 6 0)) (ite (= m8 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 7 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 8 0)) (ite (= m7 2) 6 0)) (ite (= m8 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 7 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 8 0)) (ite (= m7 3) 6 0)) (ite (= m8 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 7 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 8 0)) (ite (= m7 4) 6 0)) (ite (= m8 4) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 7 0) (ite (= m2 5) 8 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 7 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 8 0)) (ite (= m7 5) 6 0)) (ite (= m8 5) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 7 0) (ite (= m2 6) 8 0)) (ite (= m3 6) 4 0)) (ite (= m4 6) 7 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 8 0)) (ite (= m7 6) 6 0)) (ite (= m8 6) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 7 0) (ite (= m2 7) 8 0)) (ite (= m3 7) 4 0)) (ite (= m4 7) 7 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 8 0)) (ite (= m7 7) 6 0)) (ite (= m8 7) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 15 0) (ite (= m2 1) 57 0)) (ite (= m3 1) 91 0)) (ite (= m4 1) 75 0)) (ite (= m5 1) 22 0)) (ite (= m6 1) 93 0)) (ite (= m7 1) 80 0)) (ite (= m8 1) 53 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 15 0) (ite (= m2 2) 57 0)) (ite (= m3 2) 91 0)) (ite (= m4 2) 75 0)) (ite (= m5 2) 22 0)) (ite (= m6 2) 93 0)) (ite (= m7 2) 80 0)) (ite (= m8 2) 53 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 15 0) (ite (= m2 3) 57 0)) (ite (= m3 3) 91 0)) (ite (= m4 3) 75 0)) (ite (= m5 3) 22 0)) (ite (= m6 3) 93 0)) (ite (= m7 3) 80 0)) (ite (= m8 3) 53 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 15 0) (ite (= m2 4) 57 0)) (ite (= m3 4) 91 0)) (ite (= m4 4) 75 0)) (ite (= m5 4) 22 0)) (ite (= m6 4) 93 0)) (ite (= m7 4) 80 0)) (ite (= m8 4) 53 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 15 0) (ite (= m2 5) 57 0)) (ite (= m3 5) 91 0)) (ite (= m4 5) 75 0)) (ite (= m5 5) 22 0)) (ite (= m6 5) 93 0)) (ite (= m7 5) 80 0)) (ite (= m8 5) 53 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 15 0) (ite (= m2 6) 57 0)) (ite (= m3 6) 91 0)) (ite (= m4 6) 75 0)) (ite (= m5 6) 22 0)) (ite (= m6 6) 93 0)) (ite (= m7 6) 80 0)) (ite (= m8 6) 53 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 15 0) (ite (= m2 7) 57 0)) (ite (= m3 7) 91 0)) (ite (= m4 7) 75 0)) (ite (= m5 7) 22 0)) (ite (= m6 7) 93 0)) (ite (= m7 7) 80 0)) (ite (= m8 7) 53 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  39 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  33 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  64 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  53 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  48 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  60 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  43 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  41 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  39 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  33 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  64 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  53 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  48 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  60 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  43 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  41 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  39 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  33 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  64 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  53 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  48 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  60 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  43 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  41 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  39 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  33 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  64 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  53 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  48 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  60 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  43 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  41 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  39 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  33 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  64 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  53 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  48 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  60 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  43 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  41 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  39 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  33 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  64 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  53 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  48 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  60 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  43 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  41 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  39 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  33 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  64 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  53 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  48 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  60 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  43 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  41 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 33303 ))

(check-sat)
(get-model)
