; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 152, r = 29
(declare-const m2 Int) ; h = 1, c = 167, r = 31
(declare-const m3 Int) ; h = 2, c = 266, r = 59
(declare-const m4 Int) ; h = 3, c = 240, r = 55
(declare-const m5 Int) ; h = 1, c = 155, r = 21
(declare-const m6 Int) ; h = 4, c = 246, r = 32
(declare-const m7 Int) ; h = 4, c = 193, r = 30

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)
(declare-const s5 Int)
(declare-const s6 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)
(declare-const l4 Int)
(declare-const l5 Int)
(declare-const l6 Int)

(assert (and (<= 1 m1) (<= m1 6))) ; 1 <= m1 <= 6
(assert (and (<= 1 m2) (<= m2 6))) ; 1 <= m2 <= 6
(assert (and (<= 1 m3) (<= m3 6))) ; 1 <= m3 <= 6
(assert (and (<= 1 m4) (<= m4 6))) ; 1 <= m4 <= 6
(assert (and (<= 1 m5) (<= m5 6))) ; 1 <= m5 <= 6
(assert (and (<= 1 m6) (<= m6 6))) ; 1 <= m6 <= 6
(assert (and (<= 1 m7) (<= m7 6))) ; 1 <= m7 <= 6

(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 3 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 3 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 3) 7 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 3 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 4) 7 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 3 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 5) 7 0) (ite (= m2 5) 1 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 3 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 6) 7 0) (ite (= m2 6) 1 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 3 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 4 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (ite (= m1 1) 29 0) (ite (= m2 1) 31 0)) (ite (= m3 1) 59 0)) (ite (= m4 1) 55 0)) (ite (= m5 1) 21 0)) (ite (= m6 1) 32 0)) (ite (= m7 1) 30 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (ite (= m1 2) 29 0) (ite (= m2 2) 31 0)) (ite (= m3 2) 59 0)) (ite (= m4 2) 55 0)) (ite (= m5 2) 21 0)) (ite (= m6 2) 32 0)) (ite (= m7 2) 30 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (ite (= m1 3) 29 0) (ite (= m2 3) 31 0)) (ite (= m3 3) 59 0)) (ite (= m4 3) 55 0)) (ite (= m5 3) 21 0)) (ite (= m6 3) 32 0)) (ite (= m7 3) 30 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (ite (= m1 4) 29 0) (ite (= m2 4) 31 0)) (ite (= m3 4) 59 0)) (ite (= m4 4) 55 0)) (ite (= m5 4) 21 0)) (ite (= m6 4) 32 0)) (ite (= m7 4) 30 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (ite (= m1 5) 29 0) (ite (= m2 5) 31 0)) (ite (= m3 5) 59 0)) (ite (= m4 5) 55 0)) (ite (= m5 5) 21 0)) (ite (= m6 5) 32 0)) (ite (= m7 5) 30 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (ite (= m1 6) 29 0) (ite (= m2 6) 31 0)) (ite (= m3 6) 59 0)) (ite (= m4 6) 55 0)) (ite (= m5 6) 21 0)) (ite (= m6 6) 32 0)) (ite (= m7 6) 30 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 152 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 167 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 266 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 240 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 155 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 246 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 193 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 152 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 167 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 266 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 240 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 155 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 246 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 193 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 152 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 167 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 266 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 240 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 155 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 246 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 193 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 152 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 167 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 266 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 240 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 155 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 246 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 193 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 152 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 167 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 266 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 240 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 155 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 246 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 193 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 152 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 167 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 266 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 240 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 155 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 246 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 193 s6))))

(assert (= (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) 35475 ))

(check-sat)
(get-model)
