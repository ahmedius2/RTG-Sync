; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 214, r = 85
(declare-const m2 Int) ; h = 4, c = 206, r = 60
(declare-const m3 Int) ; h = 2, c = 195, r = 31
(declare-const m4 Int) ; h = 1, c = 248, r = 5
(declare-const m5 Int) ; h = 3, c = 222, r = 54
(declare-const m6 Int) ; h = 3, c = 201, r = 100
(declare-const m7 Int) ; h = 4, c = 162, r = 21
(declare-const m8 Int) ; h = 3, c = 123, r = 36

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 4 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 3 0)) (ite (= m6 1) 3 0)) (ite (= m7 1) 4 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 4 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 3 0)) (ite (= m6 2) 3 0)) (ite (= m7 2) 4 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 4 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 3 0)) (ite (= m6 3) 3 0)) (ite (= m7 3) 4 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 4 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 3 0)) (ite (= m6 4) 3 0)) (ite (= m7 4) 4 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 4 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 3 0)) (ite (= m6 5) 3 0)) (ite (= m7 5) 4 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 4 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 3 0)) (ite (= m6 6) 3 0)) (ite (= m7 6) 4 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 4 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 3 0)) (ite (= m6 7) 3 0)) (ite (= m7 7) 4 0)) (ite (= m8 7) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 85 0) (ite (= m2 1) 60 0)) (ite (= m3 1) 31 0)) (ite (= m4 1) 5 0)) (ite (= m5 1) 54 0)) (ite (= m6 1) 100 0)) (ite (= m7 1) 21 0)) (ite (= m8 1) 36 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 85 0) (ite (= m2 2) 60 0)) (ite (= m3 2) 31 0)) (ite (= m4 2) 5 0)) (ite (= m5 2) 54 0)) (ite (= m6 2) 100 0)) (ite (= m7 2) 21 0)) (ite (= m8 2) 36 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 85 0) (ite (= m2 3) 60 0)) (ite (= m3 3) 31 0)) (ite (= m4 3) 5 0)) (ite (= m5 3) 54 0)) (ite (= m6 3) 100 0)) (ite (= m7 3) 21 0)) (ite (= m8 3) 36 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 85 0) (ite (= m2 4) 60 0)) (ite (= m3 4) 31 0)) (ite (= m4 4) 5 0)) (ite (= m5 4) 54 0)) (ite (= m6 4) 100 0)) (ite (= m7 4) 21 0)) (ite (= m8 4) 36 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 85 0) (ite (= m2 5) 60 0)) (ite (= m3 5) 31 0)) (ite (= m4 5) 5 0)) (ite (= m5 5) 54 0)) (ite (= m6 5) 100 0)) (ite (= m7 5) 21 0)) (ite (= m8 5) 36 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 85 0) (ite (= m2 6) 60 0)) (ite (= m3 6) 31 0)) (ite (= m4 6) 5 0)) (ite (= m5 6) 54 0)) (ite (= m6 6) 100 0)) (ite (= m7 6) 21 0)) (ite (= m8 6) 36 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 85 0) (ite (= m2 7) 60 0)) (ite (= m3 7) 31 0)) (ite (= m4 7) 5 0)) (ite (= m5 7) 54 0)) (ite (= m6 7) 100 0)) (ite (= m7 7) 21 0)) (ite (= m8 7) 36 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 214 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 206 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 195 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 248 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 222 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 201 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 162 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 123 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 214 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 206 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 195 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 248 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 222 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 201 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 162 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 123 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 214 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 206 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 195 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 248 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 222 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 201 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 162 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 123 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 214 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 206 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 195 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 248 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 222 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 201 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 162 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 123 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 214 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 206 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 195 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 248 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 222 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 201 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 162 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 123 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 214 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 206 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 195 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 248 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 222 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 201 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 162 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 123 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 214 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 206 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 195 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 248 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 222 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 201 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 162 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 123 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 91117 ))

(check-sat)
(get-model)
