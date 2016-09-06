module Main where

import Maxkell

main :: IO ()
main = do
    let prt = "6667"
    putStrLn $ "Starting server on " ++ prt
    serveLog prt plainHandler
    putStrLn "Done!"
