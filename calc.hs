-- main - функция, которая возвращает результат на экран
main :: IO()
main = do
    expression <- getLine
    printLA (lexer expression)

-- enum класс для перечисления возможных лексем
data Lexem = ADD
           | SUB
           | MUL
           | DIV
           | LBR
           | RBR
           | NUM Int
           deriving (Eq, Show)

-- специальная функция вывода списка лексем
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

-- lexer - разбиение строки на лексемы
lexer :: [Char] -> [Lexem]
lexer "" = []
lexer (x:xs) | (x == '+') = [ADD] ++ (lexer xs)
             | (x == '-') = [SUB] ++ (lexer xs)
             | (x == '*') = [MUL] ++ (lexer xs)
             | (x == '/') = [DIV] ++ (lexer xs)
             | (x == '(') = [LBR] ++ (lexer xs)
             | (x == ')') = [RBR] ++ (lexer xs)
             | (isFigure x) = [NUM ((lexer_num xs) (char2int x))] ++ (lexer (lexer_skip xs))
             | otherwise = (lexer xs)

lexer_skip :: [Char] -> [Char]
lexer_skip [] = []
lexer_skip (x:xs) | (isFigure x) = lexer_skip xs
                  | otherwise = [x] ++ xs
