; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 2, c = 195, r = 68
(declare-const m2 Int) ; h = 1, c = 275, r = 13
(declare-const m3 Int) ; h = 3, c = 174, r = 100
(declare-const m4 Int) ; h = 1, c = 187, r = 17
(declare-const m5 Int) ; h = 1, c = 213, r = 81
(declare-const m6 Int) ; h = 2, c = 237, r = 91
(declare-const m7 Int) ; h = 3, c = 254, r = 61
(declare-const m8 Int) ; h = 3, c = 203, r = 38

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

(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 2 0) (ite (= m2 1) 1 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 1 0)) (ite (= m6 1) 2 0)) (ite (= m7 1) 3 0)) (ite (= m8 1) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 2 0) (ite (= m2 2) 1 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 1 0)) (ite (= m6 2) 2 0)) (ite (= m7 2) 3 0)) (ite (= m8 2) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 2 0) (ite (= m2 3) 1 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 1 0)) (ite (= m6 3) 2 0)) (ite (= m7 3) 3 0)) (ite (= m8 3) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 2 0) (ite (= m2 4) 1 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 1 0)) (ite (= m6 4) 2 0)) (ite (= m7 4) 3 0)) (ite (= m8 4) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 2 0) (ite (= m2 5) 1 0)) (ite (= m3 5) 3 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 1 0)) (ite (= m6 5) 2 0)) (ite (= m7 5) 3 0)) (ite (= m8 5) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 2 0) (ite (= m2 6) 1 0)) (ite (= m3 6) 3 0)) (ite (= m4 6) 1 0)) (ite (= m5 6) 1 0)) (ite (= m6 6) 2 0)) (ite (= m7 6) 3 0)) (ite (= m8 6) 3 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 2 0) (ite (= m2 7) 1 0)) (ite (= m3 7) 3 0)) (ite (= m4 7) 1 0)) (ite (= m5 7) 1 0)) (ite (= m6 7) 2 0)) (ite (= m7 7) 3 0)) (ite (= m8 7) 3 0)) 8 ))

(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 1) 68 0) (ite (= m2 1) 13 0)) (ite (= m3 1) 100 0)) (ite (= m4 1) 17 0)) (ite (= m5 1) 81 0)) (ite (= m6 1) 91 0)) (ite (= m7 1) 61 0)) (ite (= m8 1) 38 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 2) 68 0) (ite (= m2 2) 13 0)) (ite (= m3 2) 100 0)) (ite (= m4 2) 17 0)) (ite (= m5 2) 81 0)) (ite (= m6 2) 91 0)) (ite (= m7 2) 61 0)) (ite (= m8 2) 38 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 3) 68 0) (ite (= m2 3) 13 0)) (ite (= m3 3) 100 0)) (ite (= m4 3) 17 0)) (ite (= m5 3) 81 0)) (ite (= m6 3) 91 0)) (ite (= m7 3) 61 0)) (ite (= m8 3) 38 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 4) 68 0) (ite (= m2 4) 13 0)) (ite (= m3 4) 100 0)) (ite (= m4 4) 17 0)) (ite (= m5 4) 81 0)) (ite (= m6 4) 91 0)) (ite (= m7 4) 61 0)) (ite (= m8 4) 38 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 5) 68 0) (ite (= m2 5) 13 0)) (ite (= m3 5) 100 0)) (ite (= m4 5) 17 0)) (ite (= m5 5) 81 0)) (ite (= m6 5) 91 0)) (ite (= m7 5) 61 0)) (ite (= m8 5) 38 0)) ))
(assert (>= s6 100))
(assert (>= s6 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 6) 68 0) (ite (= m2 6) 13 0)) (ite (= m3 6) 100 0)) (ite (= m4 6) 17 0)) (ite (= m5 6) 81 0)) (ite (= m6 6) 91 0)) (ite (= m7 6) 61 0)) (ite (= m8 6) 38 0)) ))
(assert (>= s7 100))
(assert (>= s7 (+ (+ (+ (+ (+ (+ (+ (ite (= m1 7) 68 0) (ite (= m2 7) 13 0)) (ite (= m3 7) 100 0)) (ite (= m4 7) 17 0)) (ite (= m5 7) 81 0)) (ite (= m6 7) 91 0)) (ite (= m7 7) 61 0)) (ite (= m8 7) 38 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 195 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 275 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 174 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 187 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 213 s1))))
(assert (or (not (= m6 1)) (>= l1 (* 237 s1))))
(assert (or (not (= m7 1)) (>= l1 (* 254 s1))))
(assert (or (not (= m8 1)) (>= l1 (* 203 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 195 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 275 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 174 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 187 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 213 s2))))
(assert (or (not (= m6 2)) (>= l2 (* 237 s2))))
(assert (or (not (= m7 2)) (>= l2 (* 254 s2))))
(assert (or (not (= m8 2)) (>= l2 (* 203 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 195 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 275 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 174 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 187 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 213 s3))))
(assert (or (not (= m6 3)) (>= l3 (* 237 s3))))
(assert (or (not (= m7 3)) (>= l3 (* 254 s3))))
(assert (or (not (= m8 3)) (>= l3 (* 203 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 195 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 275 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 174 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 187 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 213 s4))))
(assert (or (not (= m6 4)) (>= l4 (* 237 s4))))
(assert (or (not (= m7 4)) (>= l4 (* 254 s4))))
(assert (or (not (= m8 4)) (>= l4 (* 203 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 195 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 275 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 174 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 187 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 213 s5))))
(assert (or (not (= m6 5)) (>= l5 (* 237 s5))))
(assert (or (not (= m7 5)) (>= l5 (* 254 s5))))
(assert (or (not (= m8 5)) (>= l5 (* 203 s5))))
(assert (>= l6 0))
(assert (or (not (= m1 6)) (>= l6 (* 195 s6))))
(assert (or (not (= m2 6)) (>= l6 (* 275 s6))))
(assert (or (not (= m3 6)) (>= l6 (* 174 s6))))
(assert (or (not (= m4 6)) (>= l6 (* 187 s6))))
(assert (or (not (= m5 6)) (>= l6 (* 213 s6))))
(assert (or (not (= m6 6)) (>= l6 (* 237 s6))))
(assert (or (not (= m7 6)) (>= l6 (* 254 s6))))
(assert (or (not (= m8 6)) (>= l6 (* 203 s6))))
(assert (>= l7 0))
(assert (or (not (= m1 7)) (>= l7 (* 195 s7))))
(assert (or (not (= m2 7)) (>= l7 (* 275 s7))))
(assert (or (not (= m3 7)) (>= l7 (* 174 s7))))
(assert (or (not (= m4 7)) (>= l7 (* 187 s7))))
(assert (or (not (= m5 7)) (>= l7 (* 213 s7))))
(assert (or (not (= m6 7)) (>= l7 (* 237 s7))))
(assert (or (not (= m7 7)) (>= l7 (* 254 s7))))
(assert (or (not (= m8 7)) (>= l7 (* 203 s7))))

(assert (= (+ (+ (+ (+ (+ (+ l1 l2) l3) l4) l5) l6) l7) 105400 ))

(check-sat)
(get-model)
