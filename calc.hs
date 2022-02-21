data Lexem = ADD
           | SUB
           | MUL
           | DIV
           | LBR
           | RBR
           | NUM Int
           deriving (Eq, Show)

printLA :: [Lexem] -> IO()
printLA = print

-- calculate - основная функция считающая итог построенного синтаксического дерева
calculate :: String -> Int
calculate readed = 5

-- isFigure - является ли символ цифрой
isFigure :: Char -> Bool
isFigure literal | (literal >= '0' && literal <= '9') = True
                 | otherwise = False

lexer_num :: [Char] Int -> [Char] Int
lexer_num [] prev = [] prev
lexer_num (x:xs) prev | () = xs (prev * 10)
                      | otherwise 

-- lexer - разбиение строки на лексемы
lexer :: [Char] -> [Lexem]
lexer "" = []
lexer (x:xs) | (x == '+') = [ADD] ++ (lexer xs)
             | (x == '-') = [SUB] ++ (lexer xs)
             | (x == '*') = [MUL] ++ (lexer xs)
             | (x == '/') = [DIV] ++ (lexer xs)
             | (x == '(') = [LBR] ++ (lexer xs)
             | (x == ')') = [RBR] ++ (lexer xs)
             | otherwise = (lexer xs)

-- main - функция, которая возвращает результат на экран
main :: IO()
main = do
    expression <- getLine
    printLA (lexer expression)