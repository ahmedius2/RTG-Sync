; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c = 169, r = 44
(declare-const m2 Int) ; h = 7, c = 108, r = 30
(declare-const m3 Int) ; h = 8, c = 137, r = 86
(declare-const m4 Int) ; h = 4, c = 187, r = 49
(declare-const m5 Int) ; h = 4, c = 164, r = 30
(declare-const m6 Int) ; h = 2, c = 132, r = 38
(declare-const m7 Int) ; h = 8, c = 188, r = 63
(declare-const m8 Int) ; h = 3, c = 141, r = 9

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 4 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 4 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 4 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 1 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 4 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 1 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 4 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 1 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 4 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 1 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 4 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 44 0) (ite (= m2 1) 30 0)) (ite (= m3 1) 86 0)) (ite (= m4 1) 49 0)) (ite (= m5 1) 30 0)) (ite (= m6 1) 38 0)) (ite (= m7 1) 63 0)) (ite (= m8 1) 9 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 44 0) (ite (= m2 2) 30 0)) (ite (= m3 2) 86 0)) (ite (= m4 2) 49 0)) (ite (= m5 2) 30 0)) (ite (= m6 2) 38 0)) (ite (= m7 2) 63 0)) (ite (= m8 2) 9 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 44 0) (ite (= m2 3) 30 0)) (ite (= m3 3) 86 0)) (ite (= m4 3) 49 0)) (ite (= m5 3) 30 0)) (ite (= m6 3) 38 0)) (ite (= m7 3) 63 0)) (ite (= m8 3) 9 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 44 0) (ite (= m2 4) 30 0)) (ite (= m3 4) 86 0)) (ite (= m4 4) 49 0)) (ite (= m5 4) 30 0)) (ite (= m6 4) 38 0)) (ite (= m7 4) 63 0)) (ite (= m8 4) 9 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 44 0) (ite (= m2 5) 30 0)) (ite (= m3 5) 86 0)) (ite (= m4 5) 49 0)) (ite (= m5 5) 30 0)) (ite (= m6 5) 38 0)) (ite (= m7 5) 63 0)) (ite (= m8 5) 9 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 44 0) (ite (= m2 6) 30 0)) (ite (= m3 6) 86 0)) (ite (= m4 6) 49 0)) (ite (= m5 6) 30 0)) (ite (= m6 6) 38 0)) (ite (= m7 6) 63 0)) (ite (= m8 6) 9 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 44 0) (ite (= m2 7) 30 0)) (ite (= m3 7) 86 0)) (ite (= m4 7) 49 0)) (ite (= m5 7) 30 0)) (ite (= m6 7) 38 0)) (ite (= m7 7) 63 0)) (ite (= m8 7) 9 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 169 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 108 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 137 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 187 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 164 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 132 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 188 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 141 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 169 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 108 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 137 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 187 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 164 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 132 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 188 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 141 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 169 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 108 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 137 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 187 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 164 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 132 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 188 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 141 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 169 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 108 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 137 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 187 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 164 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 132 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 188 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 141 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 169 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 108 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 137 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 187 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 164 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 132 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 188 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 141 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 169 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 108 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 137 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 187 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 164 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 132 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 188 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 141 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 169 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 108 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 137 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 187 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 164 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 132 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 188 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 141 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 76625 ))

(check-sat)
(get-model)
