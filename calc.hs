import Data.Typeable

-- main - функция, которая возвращает результат на экран
main :: IO()
main = do
    expression <- getLine
    printLA (lexer expression)
    print (parse_expr (lexer expression))

-- enum класс для перечисления возможных лексем
data Lexem = ADD
           | SUB
           | MUL
           | DIV
           | LBR
           | RBR
           | NUM Int
           | ERR                -- lexical error
           deriving (Eq, Show)

-- printLA - специальная функция вывода списка лексем
printLA :: [Lexem] -> IO()
printLA = print

-- calculate - основная функция считающая итог построенного синтаксического дерева
calculate :: String -> Int
calculate readed = 5

-- isFigure - является ли символ цифрой
isFigure :: Char -> Bool
isFigure literal | (literal >= '0' && literal <= '9') = True
                 | otherwise = False

-- lexer_num - функция для перевода части строки в число
lexer_num :: [Char] -> Int -> Int
lexer_num [] prev = prev
lexer_num (x:xs) prev | (isFigure x) = lexer_num xs (prev * 10 + (char2int x))
                      | otherwise = prev

-- char2int - перевод буквы в соответствующую цифру
char2int :: Char -> Int
char2int char | (char == '0') =  0
              | (char == '1') =  1
              | (char == '2') =  2
              | (char == '3') =  3
              | (char == '4') =  4
              | (char == '5') =  5
              | (char == '6') =  6
              | (char == '7') =  7
              | (char == '8') =  8
              | (char == '9') =  9
              | otherwise     = -1

-- isSpaces - проверка является ли символом - разделителем
isSpaces :: Char -> Bool 
isSpaces literal | (literal == ' ' ) = True
                 | (literal == '\t') = True
                 | otherwise         = False

-- lexer - разбиение строки на лексемы
lexer :: [Char] -> [Lexem]
lexer "" = []
lexer (x:xs) | (isSpaces x) = lexer xs
             | (x == '+')   = [ADD] ++ (lexer xs)
             | (x == '-')   = [SUB] ++ (lexer xs)
             | (x == '*')   = [MUL] ++ (lexer xs)
             | (x == '/')   = [DIV] ++ (lexer xs)
             | (x == '(')   = [LBR] ++ (lexer xs)
             | (x == ')')   = [RBR] ++ (lexer xs)
             | (isFigure x) = [NUM ((lexer_num xs) (char2int x))] ++ (lexer (lexer_skip xs))
             | otherwise    = [ERR]

-- lexer_skip - проход по массиву пока не встретится не цифра
lexer_skip :: [Char] -> [Char]
lexer_skip [] = []
lexer_skip (x:xs) | (isFigure x) = lexer_skip xs
                  | otherwise = [x] ++ xs

-- lexical_check - проверка корректности синтаксиса 
lexical_check :: [Lexem] -> Bool
lexical_check [] = True
lexical_check (x:xs) | (x == ERR) = False
                     | otherwise  = (lexical_check xs)

-- parse_expr - смотри грамматику в прикрепленном комментарии
parse_expr :: [Lexem] -> Double
parse_expr []  = 1488
parse_expr [x] = parse_term [x]
parse_expr (x:s:xs) | (s == ADD) = (parse_mul [x]) + (parse_expr xs)
                    | (s == SUB) = (parse_mul [x]) - (parse_expr xs)
                    | otherwise  = parse_mul ([x] ++ xs)

parse_mul :: [Lexem] -> Double
parse_mul []  = 322
parse_mul (x:xs) | (x == MUL) =  (parse_mul xs)
                 | (x == DIV) = 1 / (parse_mul xs)
                 | otherwise  = parse_term ([x] ++ xs)

parse_term :: [Lexem] -> Double
parse_term []  = 1337
parse_term [x] = x :: Double
parse_term (x:xs)   | (x == SUB) = - (parse_term xs)
                    | otherwise  = parse_term ([x] ++ xs)

-- cast :: (Typeable a, Typeable b) => a -> b
-- cast x = if typeOf x == typeOf (undefined::String) then 1 else 2


-- Trans :: Lexem -> Int
-- Trans x | (x == NUM) = x
--         | otherwise  = 0

{- 
grammar : 
parse_expr = parse_mul + parse_expr
           | parse_mul - parse_expr
           | parse_mul
parse_mul  = parse_term * parse_mul
           | parse_term / parse_mul
           | parse_term
parse_term = (parse_expr)
           | - parse_term
           | num
-}

