# This is my Calculator on Haskell project of "Comparative analysis of programming languages"
## C01-019, Gubanov Peter, 2nd year student 
## Teacher: Krasnov Mikhail Mikhailovich
### To compile it use:
``` 
ghc -dynamic calc.hs -o calculate.out
```
### If you haven't ghc-comiler, then you can install it from official site for Windows
### Or if you use Linux-based system just install it
#### For Debian-based system:
```
sudo apt install ghc
```
#### For Arch-based system:
```
sudo pacman -S ghc
```
### After compile just run it and write your expression (as an example):
```
./calculate.out
(1 + 3) * 4 - 1 - 1 - 1
```
### Supported operations: (), +, -, *, /

### When solving, the string turns into a set of tokens, according to which a left-associative syntactic tree is built, after which it only counts the result of the entered arithmetic expression.