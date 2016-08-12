module Main where

import Lib
import System.IO

main :: IO ()
main = do
  handle <- openFile "a" ReadMode
  -- hSetEncoding handle utf8
  lines <- lines <$> hGetContents handle
  mapM_ putStrLn lines
  -- print $ pjsonExtractRT lines
