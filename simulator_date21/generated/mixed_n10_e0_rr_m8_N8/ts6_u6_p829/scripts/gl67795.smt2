; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 156, r = 87
(declare-const m2 Int) ; h = 4, c = 105, r = 36
(declare-const m3 Int) ; h = 8, c = 156, r = 16
(declare-const m4 Int) ; h = 2, c =  96, r = 24
(declare-const m5 Int) ; h = 5, c = 122, r = 27
(declare-const m6 Int) ; h = 4, c =  82, r = 37
(declare-const m7 Int) ; h = 8, c = 129, r = 70
(declare-const m8 Int) ; h = 5, c =  10, r = 68

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 7 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 7 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 7 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 87 0) (ite (= m2 1) 36 0)) (ite (= m3 1) 16 0)) (ite (= m4 1) 24 0)) (ite (= m5 1) 27 0)) (ite (= m6 1) 37 0)) (ite (= m7 1) 70 0)) (ite (= m8 1) 68 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 87 0) (ite (= m2 2) 36 0)) (ite (= m3 2) 16 0)) (ite (= m4 2) 24 0)) (ite (= m5 2) 27 0)) (ite (= m6 2) 37 0)) (ite (= m7 2) 70 0)) (ite (= m8 2) 68 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 87 0) (ite (= m2 3) 36 0)) (ite (= m3 3) 16 0)) (ite (= m4 3) 24 0)) (ite (= m5 3) 27 0)) (ite (= m6 3) 37 0)) (ite (= m7 3) 70 0)) (ite (= m8 3) 68 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 87 0) (ite (= m2 4) 36 0)) (ite (= m3 4) 16 0)) (ite (= m4 4) 24 0)) (ite (= m5 4) 27 0)) (ite (= m6 4) 37 0)) (ite (= m7 4) 70 0)) (ite (= m8 4) 68 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 87 0) (ite (= m2 5) 36 0)) (ite (= m3 5) 16 0)) (ite (= m4 5) 24 0)) (ite (= m5 5) 27 0)) (ite (= m6 5) 37 0)) (ite (= m7 5) 70 0)) (ite (= m8 5) 68 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 87 0) (ite (= m2 6) 36 0)) (ite (= m3 6) 16 0)) (ite (= m4 6) 24 0)) (ite (= m5 6) 27 0)) (ite (= m6 6) 37 0)) (ite (= m7 6) 70 0)) (ite (= m8 6) 68 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 87 0) (ite (= m2 7) 36 0)) (ite (= m3 7) 16 0)) (ite (= m4 7) 24 0)) (ite (= m5 7) 27 0)) (ite (= m6 7) 37 0)) (ite (= m7 7) 70 0)) (ite (= m8 7) 68 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 105 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  96 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 122 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  82 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 129 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  10 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 105 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  96 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 122 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  82 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 129 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  10 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 105 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  96 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 122 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  82 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 129 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  10 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 105 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  96 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 122 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  82 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 129 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  10 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 156 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 105 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 156 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  96 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 122 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  82 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 129 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  10 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 156 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 105 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 156 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  96 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 122 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  82 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 129 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  10 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 156 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 105 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 156 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  96 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 122 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  82 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 129 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  10 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 67795 ))

(check-sat)
(get-model)
