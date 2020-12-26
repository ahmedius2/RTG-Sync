; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 7, c = 156, r = 28
(declare-const m2 Int) ; h = 6, c = 198, r = 42

(declare-const s1 Int)

(declare-const l1 Int)

(assert (and (<= 1 m1) (<= m1 1))) ; 1 <= m1 <= 1
(assert (and (<= 1 m2) (<= m2 1))) ; 1 <= m2 <= 1

(assert ( <= (+ (ite (= m1 1) 7 0) (ite (= m2 1) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (ite (= m1 1) 28 0) (ite (= m2 1) 42 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 156 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 198 s1))))

(assert (= l1 35400 ))

(check-sat)
(get-model)
