; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 5, c =  81, r = 58
(declare-const m2 Int) ; h = 7, c =  69, r = 95
(declare-const m3 Int) ; h = 6, c =  70, r = 7
(declare-const m4 Int) ; h = 6, c =  81, r = 100
(declare-const m5 Int) ; h = 3, c =  87, r = 39
(declare-const m6 Int) ; h = 1, c =  79, r = 47
(declare-const m7 Int) ; h = 1, c =  55, r = 6
(declare-const m8 Int) ; h = 2, c =  84, r = 25

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 5 0) (ite (= m2 1) 7 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 6 0)) (ite (= m5 1) 3 0)) (ite (= m6 1) 1 0)) (ite (= m7 1) 1 0)) (ite (= m8 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 5 0) (ite (= m2 2) 7 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 6 0)) (ite (= m5 2) 3 0)) (ite (= m6 2) 1 0)) (ite (= m7 2) 1 0)) (ite (= m8 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 5 0) (ite (= m2 3) 7 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 6 0)) (ite (= m5 3) 3 0)) (ite (= m6 3) 1 0)) (ite (= m7 3) 1 0)) (ite (= m8 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 5 0) (ite (= m2 4) 7 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 6 0)) (ite (= m5 4) 3 0)) (ite (= m6 4) 1 0)) (ite (= m7 4) 1 0)) (ite (= m8 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 5 0) (ite (= m2 5) 7 0)) (ite (= m3 5) 6 0)) (ite (= m4 5) 6 0)) (ite (= m5 5) 3 0)) (ite (= m6 5) 1 0)) (ite (= m7 5) 1 0)) (ite (= m8 5) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 5 0) (ite (= m2 6) 7 0)) (ite (= m3 6) 6 0)) (ite (= m4 6) 6 0)) (ite (= m5 6) 3 0)) (ite (= m6 6) 1 0)) (ite (= m7 6) 1 0)) (ite (= m8 6) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 5 0) (ite (= m2 7) 7 0)) (ite (= m3 7) 6 0)) (ite (= m4 7) 6 0)) (ite (= m5 7) 3 0)) (ite (= m6 7) 1 0)) (ite (= m7 7) 1 0)) (ite (= m8 7) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 58 0) (ite (= m2 1) 95 0)) (ite (= m3 1) 7 0)) (ite (= m4 1) 100 0)) (ite (= m5 1) 39 0)) (ite (= m6 1) 47 0)) (ite (= m7 1) 6 0)) (ite (= m8 1) 25 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 58 0) (ite (= m2 2) 95 0)) (ite (= m3 2) 7 0)) (ite (= m4 2) 100 0)) (ite (= m5 2) 39 0)) (ite (= m6 2) 47 0)) (ite (= m7 2) 6 0)) (ite (= m8 2) 25 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 58 0) (ite (= m2 3) 95 0)) (ite (= m3 3) 7 0)) (ite (= m4 3) 100 0)) (ite (= m5 3) 39 0)) (ite (= m6 3) 47 0)) (ite (= m7 3) 6 0)) (ite (= m8 3) 25 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 58 0) (ite (= m2 4) 95 0)) (ite (= m3 4) 7 0)) (ite (= m4 4) 100 0)) (ite (= m5 4) 39 0)) (ite (= m6 4) 47 0)) (ite (= m7 4) 6 0)) (ite (= m8 4) 25 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 58 0) (ite (= m2 5) 95 0)) (ite (= m3 5) 7 0)) (ite (= m4 5) 100 0)) (ite (= m5 5) 39 0)) (ite (= m6 5) 47 0)) (ite (= m7 5) 6 0)) (ite (= m8 5) 25 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 58 0) (ite (= m2 6) 95 0)) (ite (= m3 6) 7 0)) (ite (= m4 6) 100 0)) (ite (= m5 6) 39 0)) (ite (= m6 6) 47 0)) (ite (= m7 6) 6 0)) (ite (= m8 6) 25 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 58 0) (ite (= m2 7) 95 0)) (ite (= m3 7) 7 0)) (ite (= m4 7) 100 0)) (ite (= m5 7) 39 0)) (ite (= m6 7) 47 0)) (ite (= m7 7) 6 0)) (ite (= m8 7) 25 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (*  81 s1))))
(assert (or (not (= m2 1)) (>= l1 (*  69 s1))))
(assert (or (not (= m3 1)) (>= l1 (*  70 s1))))
(assert (or (not (= m4 1)) (>= l1 (*  81 s1))))
(assert (or (not (= m5 1)) (>= l1 (*  87 s1))))
(assert (or (not (= m6 1)) (>= l1 (*  79 s1))))
(assert (or (not (= m7 1)) (>= l1 (*  55 s1))))
(assert (or (not (= m8 1)) (>= l1 (*  84 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (*  81 s2))))
(assert (or (not (= m2 2)) (>= l2 (*  69 s2))))
(assert (or (not (= m3 2)) (>= l2 (*  70 s2))))
(assert (or (not (= m4 2)) (>= l2 (*  81 s2))))
(assert (or (not (= m5 2)) (>= l2 (*  87 s2))))
(assert (or (not (= m6 2)) (>= l2 (*  79 s2))))
(assert (or (not (= m7 2)) (>= l2 (*  55 s2))))
(assert (or (not (= m8 2)) (>= l2 (*  84 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (*  81 s3))))
(assert (or (not (= m2 3)) (>= l3 (*  69 s3))))
(assert (or (not (= m3 3)) (>= l3 (*  70 s3))))
(assert (or (not (= m4 3)) (>= l3 (*  81 s3))))
(assert (or (not (= m5 3)) (>= l3 (*  87 s3))))
(assert (or (not (= m6 3)) (>= l3 (*  79 s3))))
(assert (or (not (= m7 3)) (>= l3 (*  55 s3))))
(assert (or (not (= m8 3)) (>= l3 (*  84 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (*  81 s4))))
(assert (or (not (= m2 4)) (>= l4 (*  69 s4))))
(assert (or (not (= m3 4)) (>= l4 (*  70 s4))))
(assert (or (not (= m4 4)) (>= l4 (*  81 s4))))
(assert (or (not (= m5 4)) (>= l4 (*  87 s4))))
(assert (or (not (= m6 4)) (>= l4 (*  79 s4))))
(assert (or (not (= m7 4)) (>= l4 (*  55 s4))))
(assert (or (not (= m8 4)) (>= l4 (*  84 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (*  81 s5))))
(assert (or (not (= m2 5)) (>= l5 (*  69 s5))))
(assert (or (not (= m3 5)) (>= l5 (*  70 s5))))
(assert (or (not (= m4 5)) (>= l5 (*  81 s5))))
(assert (or (not (= m5 5)) (>= l5 (*  87 s5))))
(assert (or (not (= m6 5)) (>= l5 (*  79 s5))))
(assert (or (not (= m7 5)) (>= l5 (*  55 s5))))
(assert (or (not (= m8 5)) (>= l5 (*  84 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (*  81 s6))))
(assert (or (not (= m2 6)) (>= l6 (*  69 s6))))
(assert (or (not (= m3 6)) (>= l6 (*  70 s6))))
(assert (or (not (= m4 6)) (>= l6 (*  81 s6))))
(assert (or (not (= m5 6)) (>= l6 (*  87 s6))))
(assert (or (not (= m6 6)) (>= l6 (*  79 s6))))
(assert (or (not (= m7 6)) (>= l6 (*  55 s6))))
(assert (or (not (= m8 6)) (>= l6 (*  84 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (*  81 s7))))
(assert (or (not (= m2 7)) (>= l7 (*  69 s7))))
(assert (or (not (= m3 7)) (>= l7 (*  70 s7))))
(assert (or (not (= m4 7)) (>= l7 (*  81 s7))))
(assert (or (not (= m5 7)) (>= l7 (*  87 s7))))
(assert (or (not (= m6 7)) (>= l7 (*  79 s7))))
(assert (or (not (= m7 7)) (>= l7 (*  55 s7))))
(assert (or (not (= m8 7)) (>= l7 (*  84 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 33993 ))

(check-sat)
(get-model)
