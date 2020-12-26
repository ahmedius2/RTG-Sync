; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 119, r = 51
(declare-const m2 Int) ; h = 3, c = 147, r = 89
(declare-const m3 Int) ; h = 4, c = 152, r = 57
(declare-const m4 Int) ; h = 6, c = 154, r = 49
(declare-const m5 Int) ; h = 3, c =  97, r = 70
(declare-const m6 Int) ; h = 8, c =  93, r = 27
(declare-const m7 Int) ; h = 3, c =  13, r = 96

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

(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 4 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 3 0)) (ite (= m6 1) 8 0)) (ite (= m7 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 4 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 3 0)) (ite (= m6 2) 8 0)) (ite (= m7 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 4 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 3 0)) (ite (= m6 3) 8 0)) (ite (= m7 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 4 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 3 0)) (ite (= m6 4) 8 0)) (ite (= m7 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 4 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 3 0)) (ite (= m6 5) 8 0)) (ite (= m7 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 3 0)) (ite (= m3 6) 4 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 3 0)) (ite (= m6 6) 8 0)) (ite (= m7 6) 3 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (ite (= m1 1) 51 0) (ite (= m2 1) 89 0)) (ite (= m3 1) 57 0)) (ite (= m4 1) 49 0)) (ite (= m5 1) 70 0)) (ite (= m6 1) 27 0)) (ite (= m7 1) 96 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (ite (= m1 2) 51 0) (ite (= m2 2) 89 0)) (ite (= m3 2) 57 0)) (ite (= m4 2) 49 0)) (ite (= m5 2) 70 0)) (ite (= m6 2) 27 0)) (ite (= m7 2) 96 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (ite (= m1 3) 51 0) (ite (= m2 3) 89 0)) (ite (= m3 3) 57 0)) (ite (= m4 3) 49 0)) (ite (= m5 3) 70 0)) (ite (= m6 3) 27 0)) (ite (= m7 3) 96 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (ite (= m1 4) 51 0) (ite (= m2 4) 89 0)) (ite (= m3 4) 57 0)) (ite (= m4 4) 49 0)) (ite (= m5 4) 70 0)) (ite (= m6 4) 27 0)) (ite (= m7 4) 96 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (ite (= m1 5) 51 0) (ite (= m2 5) 89 0)) (ite (= m3 5) 57 0)) (ite (= m4 5) 49 0)) (ite (= m5 5) 70 0)) (ite (= m6 5) 27 0)) (ite (= m7 5) 96 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (ite (= m1 6) 51 0) (ite (= m2 6) 89 0)) (ite (= m3 6) 57 0)) (ite (= m4 6) 49 0)) (ite (= m5 6) 70 0)) (ite (= m6 6) 27 0)) (ite (= m7 6) 96 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 119 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 147 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 152 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 154 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  97 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  93 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  13 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 119 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 147 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 152 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 154 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  97 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  93 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  13 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 119 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 147 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 152 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 154 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  97 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  93 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  13 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 119 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 147 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 152 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 154 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  97 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  93 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  13 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 119 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 147 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 152 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 154 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  97 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  93 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  13 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 119 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 147 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 152 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 154 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  97 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  93 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  13 s6))))

(assert (= (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) 69819 ))

(check-sat)
(get-model)
