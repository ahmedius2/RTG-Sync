; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 219, r = 48
(declare-const m2 Int) ; h = 2, c = 244, r = 64
(declare-const m3 Int) ; h = 5, c = 193, r = 75

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 7 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 5 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 7 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 5 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 48 0) (ite (= m2 1) 64 0)) (ite (= m3 1) 75 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 48 0) (ite (= m2 2) 64 0)) (ite (= m3 2) 75 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 219 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 244 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 193 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 219 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 244 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 193 s2))))

(assert (= (+ l1 l2) 55605 ))

(check-sat)
(get-model)
