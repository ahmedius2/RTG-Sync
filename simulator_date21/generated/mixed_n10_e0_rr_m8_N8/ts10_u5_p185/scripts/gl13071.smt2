; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  22, r = 6
(declare-const m2 Int) ; h = 2, c =  33, r = 56
(declare-const m3 Int) ; h = 2, c =  26, r = 74
(declare-const m4 Int) ; h = 6, c =  20, r = 12
(declare-const m5 Int) ; h = 2, c =  26, r = 27
(declare-const m6 Int) ; h = 7, c =  37, r = 31
(declare-const m7 Int) ; h = 2, c =  35, r = 40
(declare-const m8 Int) ; h = 6, c =  35, r = 11

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 7 0)) (ite (= m7 1) 2 0)) (ite (= m8 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 7 0)) (ite (= m7 2) 2 0)) (ite (= m8 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 7 0)) (ite (= m7 3) 2 0)) (ite (= m8 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 1 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 7 0)) (ite (= m7 4) 2 0)) (ite (= m8 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 1 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 7 0)) (ite (= m7 5) 2 0)) (ite (= m8 5) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 1 0) (ite (= m2 6) 2 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 7 0)) (ite (= m7 6) 2 0)) (ite (= m8 6) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 1 0) (ite (= m2 7) 2 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 7 0)) (ite (= m7 7) 2 0)) (ite (= m8 7) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 56 0)) (ite (= m3 1) 74 0)) (ite (= m4 1) 12 0)) (ite (= m5 1) 27 0)) (ite (= m6 1) 31 0)) (ite (= m7 1) 40 0)) (ite (= m8 1) 11 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 56 0)) (ite (= m3 2) 74 0)) (ite (= m4 2) 12 0)) (ite (= m5 2) 27 0)) (ite (= m6 2) 31 0)) (ite (= m7 2) 40 0)) (ite (= m8 2) 11 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 56 0)) (ite (= m3 3) 74 0)) (ite (= m4 3) 12 0)) (ite (= m5 3) 27 0)) (ite (= m6 3) 31 0)) (ite (= m7 3) 40 0)) (ite (= m8 3) 11 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 56 0)) (ite (= m3 4) 74 0)) (ite (= m4 4) 12 0)) (ite (= m5 4) 27 0)) (ite (= m6 4) 31 0)) (ite (= m7 4) 40 0)) (ite (= m8 4) 11 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 6 0) (ite (= m2 5) 56 0)) (ite (= m3 5) 74 0)) (ite (= m4 5) 12 0)) (ite (= m5 5) 27 0)) (ite (= m6 5) 31 0)) (ite (= m7 5) 40 0)) (ite (= m8 5) 11 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 6 0) (ite (= m2 6) 56 0)) (ite (= m3 6) 74 0)) (ite (= m4 6) 12 0)) (ite (= m5 6) 27 0)) (ite (= m6 6) 31 0)) (ite (= m7 6) 40 0)) (ite (= m8 6) 11 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 6 0) (ite (= m2 7) 56 0)) (ite (= m3 7) 74 0)) (ite (= m4 7) 12 0)) (ite (= m5 7) 27 0)) (ite (= m6 7) 31 0)) (ite (= m7 7) 40 0)) (ite (= m8 7) 11 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  22 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  33 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  26 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  20 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  26 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  37 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  35 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  35 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  22 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  33 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  26 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  20 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  26 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  37 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  35 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  35 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  22 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  33 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  26 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  20 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  26 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  37 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  35 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  35 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  22 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  33 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  26 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  20 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  26 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  37 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  35 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  35 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  22 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  33 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  26 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  20 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  26 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  37 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  35 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  35 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  22 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  33 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  26 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  20 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  26 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  37 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  35 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  35 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  22 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  33 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  26 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  20 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  26 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  37 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  35 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  35 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 13071 ))

(check-sat)
(get-model)
