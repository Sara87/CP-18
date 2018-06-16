import --???

--3

data Frac = data Frac = Frac {num :: Integer , den :: Integer }
deriving (Eq, Show)
instance Num Frac where 
	(+) :: Frac -> Frac -> Frac
	(*) :: Frac -> Frac -> Frac
	negate :: Frac -> Frac
	fromInteger :: Integer -> Frac
	signum :: Frac -> Frac
	abs :: Frac -> Frac


instance Arbitrary Frac where 
	-- arbitrary :: Gen Frac
	arbitrary = do x <- arbitrary
	               d <- arbitrary "suchThat" (/=0)
	               return $ Frac (x d)

prop1 :: Frac -> Frac -> Bool
prop1 a b = a+b == b+a

prop2 :: Frac -> Bool
prop2 a = a+0 == a


--4

data Nota = Faltou | Reprovado | Nota Int
deriving (Eq, Show)
data Aluno = Aluno {numero :: Int, nome :: String, nota :: Nota }
deriving (Eq, Show)
type Turma = [Aluno ]


procura :: Int -> Turma -> Maybe Nota


instance Arbitrary Nota where
	arbitrary = frequency [(1, return Faltou), (3, return Reprovado), (6, do { n <- choose (10,20); return Nota n})]
				

instance Arbitrary Aluno where
	arbitrary = do x <- arbitrary "suchThat" (>0)
				   y <- arbitrary 
				   z <- arbitrary 
				   return Aluno (x y z)
				
instance Arbitrary Turma where
  turma = do l <- arbitrary 
          return (aux l) -- aux é uma função que retira repetidos
                         -- usar resize no generate p escolher tamanho da turma

generate (resize 10 arbitrary :: Gen Turma)


--5

instance Arbitrary a => 













