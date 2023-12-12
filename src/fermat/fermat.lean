import .library
import data.nat.prime

-- NOTE: Need to add a ¬| n or 0 < a < n

/- calculates if a is a fermat witness of compositeness for n -/
def fermat_witness (a n : ℕ) : bool :=
  if(((power a (n - 1)) % n) = (nat.succ 0)) then ff else tt

#eval fermat_witness 1 1009
#eval fermat_witness 2 1009
#eval fermat_witness 3 1009
#eval fermat_witness 4 1009
#eval fermat_witness 5 1009
#eval fermat_witness 6 1009
#eval fermat_witness 7 1009
#eval fermat_witness 8 1009
#eval fermat_witness 9 1009

#eval fermat_witness 1 1007
#eval fermat_witness 2 1007
#eval fermat_witness 3 1007
#eval fermat_witness 4 1007
#eval fermat_witness 5 1007
#eval fermat_witness 6 1007
#eval fermat_witness 7 1007
#eval fermat_witness 8 1007
#eval fermat_witness 9 1007

lemma zero_minus : (0 - 1) = 0
:= begin
  refl,
end

lemma fermat_little_theorem : ∀ a p : ℕ, nat.prime p → power a (p - 1) % p = 1
:= begin
  intros a p h,
  induction a with a ih,
  {
    cases p,
    {
      rw zero_minus,
      rw power,
      repeat {
        have h1 := nat.not_prime_zero,
        contradiction,
      },
    },
    {
      sorry,
    }
  },
  {
    --binomial theorem expansion needed
  }
end

theorem fermat_test_true : ∀ a p: ℕ, nat.prime p → fermat_witness a p = ff
:= begin
  intros a p h,
  rw fermat_witness,
  have h1 := fermat_little_theorem a p h,
  rw itetrue (power a (p - 1) % p = 1) h1,
end
