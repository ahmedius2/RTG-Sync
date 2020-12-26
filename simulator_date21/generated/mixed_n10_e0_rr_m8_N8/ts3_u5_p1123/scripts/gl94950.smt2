; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c = 148, r = 91
(declare-const m2 Int) ; h = 1, c = 123, r = 23
(declare-const m3 Int) ; h = 5, c = 198, r = 24
(declare-const m4 Int) ; h = 2, c = 149, r = 46
(declare-const m5 Int) ; h = 6, c = 116, r = 90
(declare-const m6 Int) ; h = 6, c = 219, r = 96
(declare-const m7 Int) ; h = 3, c = 114, r = 97
(declare-const m8 Int) ; h = 4, c = 199, r = 95

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 5 0)) (ite (= m4 1) 2 0)) (ite (= m5 1) 6 0)) (ite (= m6 1) 6 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 5 0)) (ite (= m4 2) 2 0)) (ite (= m5 2) 6 0)) (ite (= m6 2) 6 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 5 0)) (ite (= m4 3) 2 0)) (ite (= m5 3) 6 0)) (ite (= m6 3) 6 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 5 0)) (ite (= m4 4) 2 0)) (ite (= m5 4) 6 0)) (ite (= m6 4) 6 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 5 0) (ite (= m2 5) 1 0)) (ite (= m3 5) 5 0)) (ite (= m4 5) 2 0)) (ite (= m5 5) 6 0)) (ite (= m6 5) 6 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 5 0) (ite (= m2 6) 1 0)) (ite (= m3 6) 5 0)) (ite (= m4 6) 2 0)) (ite (= m5 6) 6 0)) (ite (= m6 6) 6 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 4 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 5 0) (ite (= m2 7) 1 0)) (ite (= m3 7) 5 0)) (ite (= m4 7) 2 0)) (ite (= m5 7) 6 0)) (ite (= m6 7) 6 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 4 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 91 0) (ite (= m2 1) 23 0)) (ite (= m3 1) 24 0)) (ite (= m4 1) 46 0)) (ite (= m5 1) 90 0)) (ite (= m6 1) 96 0)) (ite (= m7 1) 97 0)) (ite (= m8 1) 95 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 91 0) (ite (= m2 2) 23 0)) (ite (= m3 2) 24 0)) (ite (= m4 2) 46 0)) (ite (= m5 2) 90 0)) (ite (= m6 2) 96 0)) (ite (= m7 2) 97 0)) (ite (= m8 2) 95 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 91 0) (ite (= m2 3) 23 0)) (ite (= m3 3) 24 0)) (ite (= m4 3) 46 0)) (ite (= m5 3) 90 0)) (ite (= m6 3) 96 0)) (ite (= m7 3) 97 0)) (ite (= m8 3) 95 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 91 0) (ite (= m2 4) 23 0)) (ite (= m3 4) 24 0)) (ite (= m4 4) 46 0)) (ite (= m5 4) 90 0)) (ite (= m6 4) 96 0)) (ite (= m7 4) 97 0)) (ite (= m8 4) 95 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 91 0) (ite (= m2 5) 23 0)) (ite (= m3 5) 24 0)) (ite (= m4 5) 46 0)) (ite (= m5 5) 90 0)) (ite (= m6 5) 96 0)) (ite (= m7 5) 97 0)) (ite (= m8 5) 95 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 91 0) (ite (= m2 6) 23 0)) (ite (= m3 6) 24 0)) (ite (= m4 6) 46 0)) (ite (= m5 6) 90 0)) (ite (= m6 6) 96 0)) (ite (= m7 6) 97 0)) (ite (= m8 6) 95 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 91 0) (ite (= m2 7) 23 0)) (ite (= m3 7) 24 0)) (ite (= m4 7) 46 0)) (ite (= m5 7) 90 0)) (ite (= m6 7) 96 0)) (ite (= m7 7) 97 0)) (ite (= m8 7) 95 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 148 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 123 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 198 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 149 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 116 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 219 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 114 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 199 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 148 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 123 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 198 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 149 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 116 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 219 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 114 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 199 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 148 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 123 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 198 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 149 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 116 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 219 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 114 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 199 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 148 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 123 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 198 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 149 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 116 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 219 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 114 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 199 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 148 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 123 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 198 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 149 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 116 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 219 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 114 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 199 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 148 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 123 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 198 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 149 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 116 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 219 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 114 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 199 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 148 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 123 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 198 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 149 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 116 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 219 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 114 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 199 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 94950 ))

(check-sat)
(get-model)
