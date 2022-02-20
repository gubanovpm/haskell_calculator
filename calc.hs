-- lexem - тип, который может принимать значение числа/операцию/скобочку
data Lexem = Binop | Bracket | Number

data Bracket = LBrack
             | RBrack

data Binop = Add
           | Sub
           | Mul
           | Div 
           
data Number = Float
 

-- calculate - основная функция считающая итог построенного синтаксического дерева
calculate :: String -> Float
calculate = do
    return 5

-- lexer - разбиение строки на лексемы
lexer :: String -> [Lexem]
lexer = do
    return []

-- main - функция, которая возвращает результат на экран
main :: IO()
main = do
    expression <- getLine
    print (calculate expression)