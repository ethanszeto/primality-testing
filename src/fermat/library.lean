/- computes x + y -/
def plus : ℕ -> ℕ -> ℕ
  | nat.zero y := y
  | (nat.succ x) y := nat.succ (plus x y)

/- computes x * y -/
def mult : ℕ → ℕ → ℕ
  | 0 _ := 0
  | (nat.succ x) y := plus y (mult x y)

/- computes x ^ y -/
def power : ℕ → ℕ → ℕ
  | 0 _ := 0
  | _ 0 := 1
  | x (nat.succ y) := x * power x y

/- computes x ^ y mod n-/
-- def fast_power : ℕ → ℕ → ℕ → ℕ
--   | 0 _ _ := 0
--   | _ 0 _ := 1
--   | x y n := sorry

/- calculates x mod y -/
-- def modulo : ℕ → ℕ → ℕ
--   | 0 _ := 0
--   | _ 0 := 0
--   | x y := if (x < y) then x else modulo (x - y) y
