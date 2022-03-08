main :: IO()
main = print("It's fine!")

data EXP = ADD EXP EXP
         | SUB EXP EXP
         | MUL EXP EXP
         | DIV EXP EXP
         | MOD EXP EXP
         | NUM Integer
         | NEG Integer
           deriving(Eq, Show)

printLA :: [EXP] -> IO()
printLA = print

eval :: EXP -> Maybe Integer
eval (ADD exp_1 exp_2) = case (eval exp_1, eval exp_2) of
                         (Just x, Just y) -> Just (x + y)
                         _                -> Nothing
eval (SUB exp_1 exp_2) = case (eval exp_1, eval exp_2) of
                         (Just x, Just y) -> Just (x - y)
eval (MUL exp_1 exp_2) = case (eval exp_1, eval exp_2) of 
                         (Just x, Just y) -> Just (x * y)
eval (DIV exp_1 exp_2) = case (eval exp_1, eval exp_2) of
                         (Just x, Just 0) -> Nothing
                         (Just x, Just y) -> Just (x `div` y)
                         _                -> Nothing
eval (MOD exp_1 exp_2) = case (eval exp_1, eval exp_2) of
                         (Just x, Just 0) -> Nothing
                         (Just x, Just y) -> Just (x `mod` y)
                         _                -> Nothing
eval (NEG term)        = case (eval term) of 
                         Just x -> Just (negate term)
                         _      -> Nothing
eval (NUM term) = Just term



char2int :: Char -> Integer
char2int '0' = 0
char2int '1' = 1
char2int '2' = 2
char2int '3' = 3
char2int '4' = 4
char2int '5' = 5
char2int '6' = 6
char2int '7' = 7
char2int '8' = 8
char2int '9' = 9