; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 128, r = 74
(declare-const m2 Int) ; h = 2, c = 107, r = 97
(declare-const m3 Int) ; h = 3, c = 105, r = 86
(declare-const m4 Int) ; h = 6, c = 103, r = 18
(declare-const m5 Int) ; h = 3, c = 139, r = 6
(declare-const m6 Int) ; h = 2, c = 149, r = 95
(declare-const m7 Int) ; h = 5, c = 149, r = 2
(declare-const m8 Int) ; h = 2, c =  79, r = 39

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 2 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 3 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 5 0)) (ite (= m8 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 2 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 3 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 5 0)) (ite (= m8 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 2 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 3 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 5 0)) (ite (= m8 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 2 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 3 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 5 0)) (ite (= m8 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 2 0)) (ite (= m3 5) 3 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 3 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 5 0)) (ite (= m8 5) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 2 0)) (ite (= m3 6) 3 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 3 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 5 0)) (ite (= m8 6) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 2 0)) (ite (= m3 7) 3 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 3 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 5 0)) (ite (= m8 7) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 74 0) (ite (= m2 1) 97 0)) (ite (= m3 1) 86 0)) (ite (= m4 1) 18 0)) (ite (= m5 1) 6 0)) (ite (= m6 1) 95 0)) (ite (= m7 1) 2 0)) (ite (= m8 1) 39 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 74 0) (ite (= m2 2) 97 0)) (ite (= m3 2) 86 0)) (ite (= m4 2) 18 0)) (ite (= m5 2) 6 0)) (ite (= m6 2) 95 0)) (ite (= m7 2) 2 0)) (ite (= m8 2) 39 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 74 0) (ite (= m2 3) 97 0)) (ite (= m3 3) 86 0)) (ite (= m4 3) 18 0)) (ite (= m5 3) 6 0)) (ite (= m6 3) 95 0)) (ite (= m7 3) 2 0)) (ite (= m8 3) 39 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 74 0) (ite (= m2 4) 97 0)) (ite (= m3 4) 86 0)) (ite (= m4 4) 18 0)) (ite (= m5 4) 6 0)) (ite (= m6 4) 95 0)) (ite (= m7 4) 2 0)) (ite (= m8 4) 39 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 74 0) (ite (= m2 5) 97 0)) (ite (= m3 5) 86 0)) (ite (= m4 5) 18 0)) (ite (= m5 5) 6 0)) (ite (= m6 5) 95 0)) (ite (= m7 5) 2 0)) (ite (= m8 5) 39 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 74 0) (ite (= m2 6) 97 0)) (ite (= m3 6) 86 0)) (ite (= m4 6) 18 0)) (ite (= m5 6) 6 0)) (ite (= m6 6) 95 0)) (ite (= m7 6) 2 0)) (ite (= m8 6) 39 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 74 0) (ite (= m2 7) 97 0)) (ite (= m3 7) 86 0)) (ite (= m4 7) 18 0)) (ite (= m5 7) 6 0)) (ite (= m6 7) 95 0)) (ite (= m7 7) 2 0)) (ite (= m8 7) 39 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 128 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 107 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 105 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 103 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 139 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 149 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 149 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  79 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 128 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 107 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 105 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 103 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 139 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 149 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 149 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  79 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 128 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 107 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 105 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 103 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 139 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 149 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 149 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  79 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 128 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 107 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 105 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 103 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 139 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 149 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 149 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  79 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 128 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 107 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 105 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 103 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 139 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 149 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 149 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  79 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 128 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 107 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 105 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 103 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 139 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 149 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 149 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  79 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 128 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 107 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 105 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 103 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 139 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 149 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 149 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  79 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 54233 ))

(check-sat)
(get-model)
