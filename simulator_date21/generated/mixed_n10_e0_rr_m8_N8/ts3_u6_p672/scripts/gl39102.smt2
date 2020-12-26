; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  76, r = 97
(declare-const m2 Int) ; h = 1, c =  89, r = 5
(declare-const m3 Int) ; h = 7, c =  78, r = 37
(declare-const m4 Int) ; h = 1, c =  86, r = 99
(declare-const m5 Int) ; h = 2, c =  95, r = 6
(declare-const m6 Int) ; h = 2, c =  70, r = 68
(declare-const m7 Int) ; h = 1, c =  77, r = 50
(declare-const m8 Int) ; h = 8, c =  83, r = 13

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 4 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 4 0) (ite (= m2 5) 1 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 4 0) (ite (= m2 6) 1 0)) (ite (= m3 6) 7 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 4 0) (ite (= m2 7) 1 0)) (ite (= m3 7) 7 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 97 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 37 0)) (ite (= m4 1) 99 0)) (ite (= m5 1) 6 0)) (ite (= m6 1) 68 0)) (ite (= m7 1) 50 0)) (ite (= m8 1) 13 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 97 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 37 0)) (ite (= m4 2) 99 0)) (ite (= m5 2) 6 0)) (ite (= m6 2) 68 0)) (ite (= m7 2) 50 0)) (ite (= m8 2) 13 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 97 0) (ite (= m2 3) 5 0)) (ite (= m3 3) 37 0)) (ite (= m4 3) 99 0)) (ite (= m5 3) 6 0)) (ite (= m6 3) 68 0)) (ite (= m7 3) 50 0)) (ite (= m8 3) 13 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 97 0) (ite (= m2 4) 5 0)) (ite (= m3 4) 37 0)) (ite (= m4 4) 99 0)) (ite (= m5 4) 6 0)) (ite (= m6 4) 68 0)) (ite (= m7 4) 50 0)) (ite (= m8 4) 13 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 97 0) (ite (= m2 5) 5 0)) (ite (= m3 5) 37 0)) (ite (= m4 5) 99 0)) (ite (= m5 5) 6 0)) (ite (= m6 5) 68 0)) (ite (= m7 5) 50 0)) (ite (= m8 5) 13 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 97 0) (ite (= m2 6) 5 0)) (ite (= m3 6) 37 0)) (ite (= m4 6) 99 0)) (ite (= m5 6) 6 0)) (ite (= m6 6) 68 0)) (ite (= m7 6) 50 0)) (ite (= m8 6) 13 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 97 0) (ite (= m2 7) 5 0)) (ite (= m3 7) 37 0)) (ite (= m4 7) 99 0)) (ite (= m5 7) 6 0)) (ite (= m6 7) 68 0)) (ite (= m7 7) 50 0)) (ite (= m8 7) 13 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  76 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  89 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  78 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  86 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  95 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  70 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  77 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  83 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  76 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  89 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  78 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  86 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  95 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  70 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  77 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  83 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  76 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  89 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  78 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  86 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  95 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  70 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  77 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  83 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  76 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  89 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  78 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  86 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  95 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  70 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  77 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  83 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  76 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  89 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  78 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  86 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  95 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  70 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  77 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  83 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  76 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  89 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  78 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  86 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  95 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  70 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  77 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  83 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  76 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  89 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  78 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  86 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  95 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  70 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  77 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  83 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 39102 ))

(check-sat)
(get-model)
