runState :: State s a -> s -> (a, s)

main :: IO()
main = do 
    let r = runState ( do
            modify (+1)
            modify (*2)
            modify (+3)
            ) 5
    print r