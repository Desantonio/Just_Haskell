module Main (main) where

main :: IO ()
main = do
  putStrLn "Hello, world!"
  putStr "Enter the first number: "
  input1 <- getLine
  putStr "Enter the second number: "
  input2 <- getLine

  let num1 = read input1 :: Double
      num2 = read input2 :: Double
      sumResult = num1 + num2

  putStrLn $ "The sum of " ++ show num1 ++ " and " ++ show num2 ++ " is " ++ show sumResult
