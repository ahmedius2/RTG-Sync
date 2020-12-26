; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 111, r = 25
(declare-const m2 Int) ; h = 8, c =  90, r = 53
(declare-const m3 Int) ; h = 1, c =  95, r = 49
(declare-const m4 Int) ; h = 4, c =  86, r = 43
(declare-const m5 Int) ; h = 5, c =  94, r = 49
(declare-const m6 Int) ; h = 4, c =  68, r = 97
(declare-const m7 Int) ; h = 1, c =  83, r = 1
(declare-const m8 Int) ; h = 1, c =  91, r = 10

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 6 0) (ite (= m2 5) 8 0)) (ite (= m3 5) 1 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 6 0) (ite (= m2 6) 8 0)) (ite (= m3 6) 1 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 6 0) (ite (= m2 7) 8 0)) (ite (= m3 7) 1 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 1 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 25 0) (ite (= m2 1) 53 0)) (ite (= m3 1) 49 0)) (ite (= m4 1) 43 0)) (ite (= m5 1) 49 0)) (ite (= m6 1) 97 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 10 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 25 0) (ite (= m2 2) 53 0)) (ite (= m3 2) 49 0)) (ite (= m4 2) 43 0)) (ite (= m5 2) 49 0)) (ite (= m6 2) 97 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 10 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 25 0) (ite (= m2 3) 53 0)) (ite (= m3 3) 49 0)) (ite (= m4 3) 43 0)) (ite (= m5 3) 49 0)) (ite (= m6 3) 97 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 10 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 25 0) (ite (= m2 4) 53 0)) (ite (= m3 4) 49 0)) (ite (= m4 4) 43 0)) (ite (= m5 4) 49 0)) (ite (= m6 4) 97 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 10 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 25 0) (ite (= m2 5) 53 0)) (ite (= m3 5) 49 0)) (ite (= m4 5) 43 0)) (ite (= m5 5) 49 0)) (ite (= m6 5) 97 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 10 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 25 0) (ite (= m2 6) 53 0)) (ite (= m3 6) 49 0)) (ite (= m4 6) 43 0)) (ite (= m5 6) 49 0)) (ite (= m6 6) 97 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 10 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 25 0) (ite (= m2 7) 53 0)) (ite (= m3 7) 49 0)) (ite (= m4 7) 43 0)) (ite (= m5 7) 49 0)) (ite (= m6 7) 97 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 10 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 111 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  90 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  95 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  86 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  68 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  83 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  91 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 111 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  90 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  95 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  86 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  68 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  83 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  91 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 111 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  90 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  95 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  86 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  68 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  83 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  91 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 111 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  90 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  95 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  86 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  94 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  68 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  83 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  91 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 111 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  90 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  95 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  86 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  94 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  68 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  83 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  91 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 111 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  90 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  95 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  86 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  94 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  68 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  83 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  91 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 111 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  90 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  95 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  86 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  94 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  68 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  83 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  91 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 41523 ))

(check-sat)
(get-model)
