; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 133, r = 10
(declare-const m2 Int) ; h = 5, c = 173, r = 92
(declare-const m3 Int) ; h = 8, c = 173, r = 55
(declare-const m4 Int) ; h = 3, c = 169, r = 18
(declare-const m5 Int) ; h = 2, c = 139, r = 69
(declare-const m6 Int) ; h = 2, c = 258, r = 5
(declare-const m7 Int) ; h = 5, c = 257, r = 41
(declare-const m8 Int) ; h = 5, c = 159, r = 83

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 8 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 5 0)) (ite (= m8 1) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 8 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 5 0)) (ite (= m8 2) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 5 0)) (ite (= m3 3) 8 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 5 0)) (ite (= m8 3) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 5 0)) (ite (= m3 4) 8 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 5 0)) (ite (= m8 4) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 5 0)) (ite (= m3 5) 8 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 5 0)) (ite (= m8 5) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 5 0)) (ite (= m3 6) 8 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 5 0)) (ite (= m8 6) 5 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 5 0)) (ite (= m3 7) 8 0)) (ite (= m4 7) 3 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 5 0)) (ite (= m8 7) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 10 0) (ite (= m2 1) 92 0)) (ite (= m3 1) 55 0)) (ite (= m4 1) 18 0)) (ite (= m5 1) 69 0)) (ite (= m6 1) 5 0)) (ite (= m7 1) 41 0)) (ite (= m8 1) 83 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 10 0) (ite (= m2 2) 92 0)) (ite (= m3 2) 55 0)) (ite (= m4 2) 18 0)) (ite (= m5 2) 69 0)) (ite (= m6 2) 5 0)) (ite (= m7 2) 41 0)) (ite (= m8 2) 83 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 10 0) (ite (= m2 3) 92 0)) (ite (= m3 3) 55 0)) (ite (= m4 3) 18 0)) (ite (= m5 3) 69 0)) (ite (= m6 3) 5 0)) (ite (= m7 3) 41 0)) (ite (= m8 3) 83 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 10 0) (ite (= m2 4) 92 0)) (ite (= m3 4) 55 0)) (ite (= m4 4) 18 0)) (ite (= m5 4) 69 0)) (ite (= m6 4) 5 0)) (ite (= m7 4) 41 0)) (ite (= m8 4) 83 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 10 0) (ite (= m2 5) 92 0)) (ite (= m3 5) 55 0)) (ite (= m4 5) 18 0)) (ite (= m5 5) 69 0)) (ite (= m6 5) 5 0)) (ite (= m7 5) 41 0)) (ite (= m8 5) 83 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 10 0) (ite (= m2 6) 92 0)) (ite (= m3 6) 55 0)) (ite (= m4 6) 18 0)) (ite (= m5 6) 69 0)) (ite (= m6 6) 5 0)) (ite (= m7 6) 41 0)) (ite (= m8 6) 83 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 10 0) (ite (= m2 7) 92 0)) (ite (= m3 7) 55 0)) (ite (= m4 7) 18 0)) (ite (= m5 7) 69 0)) (ite (= m6 7) 5 0)) (ite (= m7 7) 41 0)) (ite (= m8 7) 83 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 133 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 173 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 173 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 169 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 139 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 258 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 257 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 159 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 133 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 173 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 173 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 169 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 139 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 258 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 257 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 159 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 133 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 173 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 173 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 169 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 139 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 258 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 257 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 159 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 133 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 173 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 173 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 169 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 139 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 258 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 257 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 159 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 133 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 173 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 173 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 169 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 139 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 258 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 257 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 159 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 133 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 173 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 173 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 169 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 139 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 258 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 257 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 159 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 133 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 173 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 173 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 169 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 139 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 258 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 257 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 159 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 146100 ))

(check-sat)
(get-model)
