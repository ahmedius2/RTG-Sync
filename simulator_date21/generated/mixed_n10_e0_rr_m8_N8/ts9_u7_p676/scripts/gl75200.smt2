; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 8, c = 117, r = 70
(declare-const m2 Int) ; h = 6, c =  96, r = 91
(declare-const m3 Int) ; h = 2, c =  77, r = 62
(declare-const m4 Int) ; h = 6, c = 114, r = 59
(declare-const m5 Int) ; h = 4, c = 124, r = 81
(declare-const m6 Int) ; h = 4, c = 133, r = 86
(declare-const m7 Int) ; h = 8, c = 116, r = 5
(declare-const m8 Int) ; h = 7, c =  60, r = 97

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 8 0) (ite (= m2 1) 6 0)) (ite (= m3 1) 2 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 4 0)) (ite (= m6 1) 4 0)) (ite (= m7 1) 8 0)) (ite (= m8 1) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 8 0) (ite (= m2 2) 6 0)) (ite (= m3 2) 2 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 4 0)) (ite (= m6 2) 4 0)) (ite (= m7 2) 8 0)) (ite (= m8 2) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 8 0) (ite (= m2 3) 6 0)) (ite (= m3 3) 2 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 4 0)) (ite (= m6 3) 4 0)) (ite (= m7 3) 8 0)) (ite (= m8 3) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 8 0) (ite (= m2 4) 6 0)) (ite (= m3 4) 2 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 4 0)) (ite (= m6 4) 4 0)) (ite (= m7 4) 8 0)) (ite (= m8 4) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 8 0) (ite (= m2 5) 6 0)) (ite (= m3 5) 2 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 4 0)) (ite (= m6 5) 4 0)) (ite (= m7 5) 8 0)) (ite (= m8 5) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 8 0) (ite (= m2 6) 6 0)) (ite (= m3 6) 2 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 4 0)) (ite (= m6 6) 4 0)) (ite (= m7 6) 8 0)) (ite (= m8 6) 7 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 8 0) (ite (= m2 7) 6 0)) (ite (= m3 7) 2 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 4 0)) (ite (= m6 7) 4 0)) (ite (= m7 7) 8 0)) (ite (= m8 7) 7 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 70 0) (ite (= m2 1) 91 0)) (ite (= m3 1) 62 0)) (ite (= m4 1) 59 0)) (ite (= m5 1) 81 0)) (ite (= m6 1) 86 0)) (ite (= m7 1) 5 0)) (ite (= m8 1) 97 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 70 0) (ite (= m2 2) 91 0)) (ite (= m3 2) 62 0)) (ite (= m4 2) 59 0)) (ite (= m5 2) 81 0)) (ite (= m6 2) 86 0)) (ite (= m7 2) 5 0)) (ite (= m8 2) 97 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 70 0) (ite (= m2 3) 91 0)) (ite (= m3 3) 62 0)) (ite (= m4 3) 59 0)) (ite (= m5 3) 81 0)) (ite (= m6 3) 86 0)) (ite (= m7 3) 5 0)) (ite (= m8 3) 97 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 70 0) (ite (= m2 4) 91 0)) (ite (= m3 4) 62 0)) (ite (= m4 4) 59 0)) (ite (= m5 4) 81 0)) (ite (= m6 4) 86 0)) (ite (= m7 4) 5 0)) (ite (= m8 4) 97 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 70 0) (ite (= m2 5) 91 0)) (ite (= m3 5) 62 0)) (ite (= m4 5) 59 0)) (ite (= m5 5) 81 0)) (ite (= m6 5) 86 0)) (ite (= m7 5) 5 0)) (ite (= m8 5) 97 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 70 0) (ite (= m2 6) 91 0)) (ite (= m3 6) 62 0)) (ite (= m4 6) 59 0)) (ite (= m5 6) 81 0)) (ite (= m6 6) 86 0)) (ite (= m7 6) 5 0)) (ite (= m8 6) 97 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 70 0) (ite (= m2 7) 91 0)) (ite (= m3 7) 62 0)) (ite (= m4 7) 59 0)) (ite (= m5 7) 81 0)) (ite (= m6 7) 86 0)) (ite (= m7 7) 5 0)) (ite (= m8 7) 97 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 117 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  96 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  77 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 114 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 124 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 133 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 116 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  60 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 117 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  96 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  77 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 114 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 124 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 133 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 116 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  60 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 117 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  96 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  77 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 114 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 124 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 133 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 116 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  60 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 117 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  96 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  77 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 114 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 124 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 133 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 116 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  60 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 117 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  96 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  77 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 114 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 124 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 133 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 116 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  60 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 117 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  96 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  77 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 114 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 124 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 133 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 116 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  60 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 117 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  96 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  77 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 114 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 124 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 133 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 116 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  60 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 75200 ))

(check-sat)
(get-model)
