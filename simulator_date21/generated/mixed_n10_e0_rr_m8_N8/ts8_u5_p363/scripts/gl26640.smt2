; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 1, c =  58, r = 37
(declare-const m2 Int) ; h = 5, c =  60, r = 78
(declare-const m3 Int) ; h = 3, c =  39, r = 87
(declare-const m4 Int) ; h = 4, c =  57, r = 41
(declare-const m5 Int) ; h = 5, c =  72, r = 2
(declare-const m6 Int) ; h = 3, c =  65, r = 44
(declare-const m7 Int) ; h = 4, c =  43, r = 33
(declare-const m8 Int) ; h = 6, c =  39, r = 11

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 1 0) (ite (= m2 1) 5 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 3 0)) (ite (= m7 1) 4 0)) (ite (= m8 1) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 1 0) (ite (= m2 2) 5 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 3 0)) (ite (= m7 2) 4 0)) (ite (= m8 2) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 1 0) (ite (= m2 3) 5 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 3 0)) (ite (= m7 3) 4 0)) (ite (= m8 3) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 1 0) (ite (= m2 4) 5 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 3 0)) (ite (= m7 4) 4 0)) (ite (= m8 4) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 1 0) (ite (= m2 5) 5 0)) (ite (= m3 5) 3 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 3 0)) (ite (= m7 5) 4 0)) (ite (= m8 5) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 1 0) (ite (= m2 6) 5 0)) (ite (= m3 6) 3 0)) (ite (= m4 6) 4 0)) (ite (= m5 6) 5 0)) (ite (= m6 6) 3 0)) (ite (= m7 6) 4 0)) (ite (= m8 6) 6 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 1 0) (ite (= m2 7) 5 0)) (ite (= m3 7) 3 0)) (ite (= m4 7) 4 0)) (ite (= m5 7) 5 0)) (ite (= m6 7) 3 0)) (ite (= m7 7) 4 0)) (ite (= m8 7) 6 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 37 0) (ite (= m2 1) 78 0)) (ite (= m3 1) 87 0)) (ite (= m4 1) 41 0)) (ite (= m5 1) 2 0)) (ite (= m6 1) 44 0)) (ite (= m7 1) 33 0)) (ite (= m8 1) 11 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 37 0) (ite (= m2 2) 78 0)) (ite (= m3 2) 87 0)) (ite (= m4 2) 41 0)) (ite (= m5 2) 2 0)) (ite (= m6 2) 44 0)) (ite (= m7 2) 33 0)) (ite (= m8 2) 11 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 37 0) (ite (= m2 3) 78 0)) (ite (= m3 3) 87 0)) (ite (= m4 3) 41 0)) (ite (= m5 3) 2 0)) (ite (= m6 3) 44 0)) (ite (= m7 3) 33 0)) (ite (= m8 3) 11 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 37 0) (ite (= m2 4) 78 0)) (ite (= m3 4) 87 0)) (ite (= m4 4) 41 0)) (ite (= m5 4) 2 0)) (ite (= m6 4) 44 0)) (ite (= m7 4) 33 0)) (ite (= m8 4) 11 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 37 0) (ite (= m2 5) 78 0)) (ite (= m3 5) 87 0)) (ite (= m4 5) 41 0)) (ite (= m5 5) 2 0)) (ite (= m6 5) 44 0)) (ite (= m7 5) 33 0)) (ite (= m8 5) 11 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 37 0) (ite (= m2 6) 78 0)) (ite (= m3 6) 87 0)) (ite (= m4 6) 41 0)) (ite (= m5 6) 2 0)) (ite (= m6 6) 44 0)) (ite (= m7 6) 33 0)) (ite (= m8 6) 11 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 37 0) (ite (= m2 7) 78 0)) (ite (= m3 7) 87 0)) (ite (= m4 7) 41 0)) (ite (= m5 7) 2 0)) (ite (= m6 7) 44 0)) (ite (= m7 7) 33 0)) (ite (= m8 7) 11 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  58 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  60 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  39 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  57 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  72 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  65 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  43 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  39 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  58 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  60 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  39 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  57 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  72 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  65 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  43 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  39 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  58 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  60 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  39 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  57 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  72 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  65 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  43 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  39 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  58 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  60 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  39 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  57 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  72 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  65 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  43 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  39 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  58 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  60 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  39 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  57 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  72 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  65 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  43 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  39 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  58 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  60 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  39 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  57 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  72 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  65 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  43 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  39 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  58 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  60 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  39 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  57 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  72 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  65 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  43 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  39 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 26640 ))

(check-sat)
(get-model)
