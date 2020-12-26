; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c = 245, r = 52
(declare-const m2 Int) ; h = 5, c = 237, r = 32
(declare-const m3 Int) ; h = 5, c = 122, r = 94

(declare-const s1 Int)
(declare-const s2 Int)

(declare-const l1 Int)
(declare-const l2 Int)

(assert (and (<= 1 m1) (<= m1 2))) ; 1 <= m1 <= 2
(assert (and (<= 1 m2) (<= m2 2))) ; 1 <= m2 <= 2
(assert (and (<= 1 m3) (<= m3 2))) ; 1 <= m3 <= 2

(assert ( <= (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 5 0)) 8 ))
(assert ( <= (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 5 0)) 8 ))

(assert ( < m2 m3 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (ite (= m1 1) 52 0) (ite (= m2 1) 32 0)) (ite (= m3 1) 94 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (ite (= m1 2) 52 0) (ite (= m2 2) 32 0)) (ite (= m3 2) 94 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 245 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 237 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 122 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 245 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 237 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 122 s2))))

(assert (= (+ l1 l2) 60400 ))

(check-sat)
(get-model)
