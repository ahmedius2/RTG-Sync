; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 4, c =  61, r = 72
(declare-const m2 Int) ; h = 3, c =  33, r = 18
(declare-const m3 Int) ; h = 1, c =  54, r = 96
(declare-const m4 Int) ; h = 6, c =  32, r = 3
(declare-const m5 Int) ; h = 7, c =  40, r = 16
(declare-const m6 Int) ; h = 6, c =  38, r = 39
(declare-const m7 Int) ; h = 8, c =  33, r = 16
(declare-const m8 Int) ; h = 3, c =  33, r = 62

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 4 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 1 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 7 0)) (ite (= m6 1) 6 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 4 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 1 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 7 0)) (ite (= m6 2) 6 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 4 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 1 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 7 0)) (ite (= m6 3) 6 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 4 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 1 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 7 0)) (ite (= m6 4) 6 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 4 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 1 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 7 0)) (ite (= m6 5) 6 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 4 0) (ite (= m2 6) 3 0)) (ite (= m3 6) 1 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 7 0)) (ite (= m6 6) 6 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 4 0) (ite (= m2 7) 3 0)) (ite (= m3 7) 1 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 7 0)) (ite (= m6 7) 6 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 72 0) (ite (= m2 1) 18 0)) (ite (= m3 1) 96 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 16 0)) (ite (= m6 1) 39 0)) (ite (= m7 1) 16 0)) (ite (= m8 1) 62 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 72 0) (ite (= m2 2) 18 0)) (ite (= m3 2) 96 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 16 0)) (ite (= m6 2) 39 0)) (ite (= m7 2) 16 0)) (ite (= m8 2) 62 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 72 0) (ite (= m2 3) 18 0)) (ite (= m3 3) 96 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 16 0)) (ite (= m6 3) 39 0)) (ite (= m7 3) 16 0)) (ite (= m8 3) 62 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 72 0) (ite (= m2 4) 18 0)) (ite (= m3 4) 96 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 16 0)) (ite (= m6 4) 39 0)) (ite (= m7 4) 16 0)) (ite (= m8 4) 62 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 72 0) (ite (= m2 5) 18 0)) (ite (= m3 5) 96 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 16 0)) (ite (= m6 5) 39 0)) (ite (= m7 5) 16 0)) (ite (= m8 5) 62 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 72 0) (ite (= m2 6) 18 0)) (ite (= m3 6) 96 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 16 0)) (ite (= m6 6) 39 0)) (ite (= m7 6) 16 0)) (ite (= m8 6) 62 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 72 0) (ite (= m2 7) 18 0)) (ite (= m3 7) 96 0)) (ite (= m4 7) 3 0)) (ite (= m5 7) 16 0)) (ite (= m6 7) 39 0)) (ite (= m7 7) 16 0)) (ite (= m8 7) 62 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  61 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  33 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  54 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  32 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  40 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  38 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  33 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  33 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  61 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  33 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  54 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  32 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  40 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  38 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  33 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  33 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  61 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  33 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  54 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  32 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  40 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  38 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  33 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  33 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  61 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  33 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  54 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  32 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  40 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  38 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  33 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  33 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  61 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  33 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  54 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  32 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  40 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  38 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  33 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  33 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  61 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  33 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  54 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  32 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  40 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  38 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  33 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  33 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  61 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  33 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  54 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  32 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  40 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  38 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  33 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  33 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 28350 ))

(check-sat)
(get-model)
