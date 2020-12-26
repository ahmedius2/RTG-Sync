; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c =  81, r = 93
(declare-const m2 Int) ; h = 5, c =  67, r = 33
(declare-const m3 Int) ; h = 4, c =  68, r = 80
(declare-const m4 Int) ; h = 3, c =  95, r = 1
(declare-const m5 Int) ; h = 1, c =  71, r = 4
(declare-const m6 Int) ; h = 1, c =  87, r = 72
(declare-const m7 Int) ; h = 8, c =  67, r = 86
(declare-const m8 Int) ; h = 2, c =  52, r = 95

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 5 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 5 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 5 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 5 0)) (ite (= m3 6) 4 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 5 0)) (ite (= m3 7) 4 0)) (ite (= m4 7) 3 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 93 0) (ite (= m2 1) 33 0)) (ite (= m3 1) 80 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 4 0)) (ite (= m6 1) 72 0)) (ite (= m7 1) 86 0)) (ite (= m8 1) 95 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 93 0) (ite (= m2 2) 33 0)) (ite (= m3 2) 80 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 4 0)) (ite (= m6 2) 72 0)) (ite (= m7 2) 86 0)) (ite (= m8 2) 95 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 93 0) (ite (= m2 3) 33 0)) (ite (= m3 3) 80 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 4 0)) (ite (= m6 3) 72 0)) (ite (= m7 3) 86 0)) (ite (= m8 3) 95 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 93 0) (ite (= m2 4) 33 0)) (ite (= m3 4) 80 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 4 0)) (ite (= m6 4) 72 0)) (ite (= m7 4) 86 0)) (ite (= m8 4) 95 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 93 0) (ite (= m2 5) 33 0)) (ite (= m3 5) 80 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 4 0)) (ite (= m6 5) 72 0)) (ite (= m7 5) 86 0)) (ite (= m8 5) 95 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 93 0) (ite (= m2 6) 33 0)) (ite (= m3 6) 80 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 4 0)) (ite (= m6 6) 72 0)) (ite (= m7 6) 86 0)) (ite (= m8 6) 95 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 93 0) (ite (= m2 7) 33 0)) (ite (= m3 7) 80 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 4 0)) (ite (= m6 7) 72 0)) (ite (= m7 7) 86 0)) (ite (= m8 7) 95 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  81 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  67 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  68 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  95 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  71 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  87 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  67 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  52 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  81 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  67 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  68 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  95 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  71 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  87 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  67 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  52 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  81 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  67 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  68 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  95 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  71 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  87 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  67 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  52 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  81 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  67 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  68 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  95 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  71 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  87 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  67 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  52 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  81 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  67 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  68 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  95 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  71 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  87 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  67 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  52 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  81 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  67 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  68 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  95 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  71 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  87 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  67 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  52 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  81 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  67 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  68 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  95 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  71 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  87 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  67 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  52 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 39506 ))

(check-sat)
(get-model)
