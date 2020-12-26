; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c = 181, r = 44
(declare-const m2 Int) ; h = 2, c = 160, r = 31
(declare-const m3 Int) ; h = 5, c = 184, r = 55
(declare-const m4 Int) ; h = 4, c =  94, r = 58
(declare-const m5 Int) ; h = 5, c =  94, r = 64
(declare-const m6 Int) ; h = 6, c =  98, r = 47
(declare-const m7 Int) ; h = 3, c = 156, r = 71
(declare-const m8 Int) ; h = 1, c = 162, r = 7

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 6 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 6 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 6 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 6 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 5 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 6 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 5 0) (ite (= m2 6) 2 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 6 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 1 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 5 0) (ite (= m2 7) 2 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 6 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 1 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 44 0) (ite (= m2 1) 31 0)) (ite (= m3 1) 55 0)) (ite (= m4 1) 58 0)) (ite (= m5 1) 64 0)) (ite (= m6 1) 47 0)) (ite (= m7 1) 71 0)) (ite (= m8 1) 7 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 44 0) (ite (= m2 2) 31 0)) (ite (= m3 2) 55 0)) (ite (= m4 2) 58 0)) (ite (= m5 2) 64 0)) (ite (= m6 2) 47 0)) (ite (= m7 2) 71 0)) (ite (= m8 2) 7 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 44 0) (ite (= m2 3) 31 0)) (ite (= m3 3) 55 0)) (ite (= m4 3) 58 0)) (ite (= m5 3) 64 0)) (ite (= m6 3) 47 0)) (ite (= m7 3) 71 0)) (ite (= m8 3) 7 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 44 0) (ite (= m2 4) 31 0)) (ite (= m3 4) 55 0)) (ite (= m4 4) 58 0)) (ite (= m5 4) 64 0)) (ite (= m6 4) 47 0)) (ite (= m7 4) 71 0)) (ite (= m8 4) 7 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 44 0) (ite (= m2 5) 31 0)) (ite (= m3 5) 55 0)) (ite (= m4 5) 58 0)) (ite (= m5 5) 64 0)) (ite (= m6 5) 47 0)) (ite (= m7 5) 71 0)) (ite (= m8 5) 7 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 44 0) (ite (= m2 6) 31 0)) (ite (= m3 6) 55 0)) (ite (= m4 6) 58 0)) (ite (= m5 6) 64 0)) (ite (= m6 6) 47 0)) (ite (= m7 6) 71 0)) (ite (= m8 6) 7 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 44 0) (ite (= m2 7) 31 0)) (ite (= m3 7) 55 0)) (ite (= m4 7) 58 0)) (ite (= m5 7) 64 0)) (ite (= m6 7) 47 0)) (ite (= m7 7) 71 0)) (ite (= m8 7) 7 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 181 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 160 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 184 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  94 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  98 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 162 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 181 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 160 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 184 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  94 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  98 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 156 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 162 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 181 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 160 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 184 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  94 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  98 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 156 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 162 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 181 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 160 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 184 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  94 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  94 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  98 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 156 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 162 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 181 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 160 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 184 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  94 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  94 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  98 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 156 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 162 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 181 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 160 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 184 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  94 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  94 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  98 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 156 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 162 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 181 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 160 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 184 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  94 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  94 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  98 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 156 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 162 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 67806 ))

(check-sat)
(get-model)
