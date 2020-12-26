; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 140, r = 29
(declare-const m2 Int) ; h = 7, c = 113, r = 41
(declare-const m3 Int) ; h = 4, c = 197, r = 96
(declare-const m4 Int) ; h = 1, c = 197, r = 21
(declare-const m5 Int) ; h = 4, c = 204, r = 99
(declare-const m6 Int) ; h = 1, c = 148, r = 63
(declare-const m7 Int) ; h = 3, c = 190, r = 9
(declare-const m8 Int) ; h = 8, c =  83, r = 76

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 4 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 4 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 4 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 4 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 4 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 4 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 4 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 4 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 4 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 29 0) (ite (= m2 1) 41 0)) (ite (= m3 1) 96 0)) (ite (= m4 1) 21 0)) (ite (= m5 1) 99 0)) (ite (= m6 1) 63 0)) (ite (= m7 1) 9 0)) (ite (= m8 1) 76 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 29 0) (ite (= m2 2) 41 0)) (ite (= m3 2) 96 0)) (ite (= m4 2) 21 0)) (ite (= m5 2) 99 0)) (ite (= m6 2) 63 0)) (ite (= m7 2) 9 0)) (ite (= m8 2) 76 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 29 0) (ite (= m2 3) 41 0)) (ite (= m3 3) 96 0)) (ite (= m4 3) 21 0)) (ite (= m5 3) 99 0)) (ite (= m6 3) 63 0)) (ite (= m7 3) 9 0)) (ite (= m8 3) 76 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 29 0) (ite (= m2 4) 41 0)) (ite (= m3 4) 96 0)) (ite (= m4 4) 21 0)) (ite (= m5 4) 99 0)) (ite (= m6 4) 63 0)) (ite (= m7 4) 9 0)) (ite (= m8 4) 76 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 29 0) (ite (= m2 5) 41 0)) (ite (= m3 5) 96 0)) (ite (= m4 5) 21 0)) (ite (= m5 5) 99 0)) (ite (= m6 5) 63 0)) (ite (= m7 5) 9 0)) (ite (= m8 5) 76 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 29 0) (ite (= m2 6) 41 0)) (ite (= m3 6) 96 0)) (ite (= m4 6) 21 0)) (ite (= m5 6) 99 0)) (ite (= m6 6) 63 0)) (ite (= m7 6) 9 0)) (ite (= m8 6) 76 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 29 0) (ite (= m2 7) 41 0)) (ite (= m3 7) 96 0)) (ite (= m4 7) 21 0)) (ite (= m5 7) 99 0)) (ite (= m6 7) 63 0)) (ite (= m7 7) 9 0)) (ite (= m8 7) 76 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 140 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 113 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 197 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 197 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 204 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 148 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 190 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  83 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 140 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 113 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 197 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 197 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 204 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 148 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 190 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  83 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 140 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 113 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 197 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 197 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 204 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 148 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 190 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  83 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 140 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 113 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 197 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 197 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 204 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 148 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 190 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  83 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 140 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 113 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 197 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 197 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 204 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 148 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 190 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  83 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 140 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 113 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 197 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 197 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 204 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 148 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 190 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  83 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 140 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 113 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 197 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 197 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 204 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 148 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 190 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  83 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 74503 ))

(check-sat)
(get-model)
