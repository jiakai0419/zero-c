module Main where

import Lib
import System.IO
import Data.List (sort)

main :: IO ()
main = do
  lines <- lines <$> hGetContents stdin
  rtList <- return . pjsonExtractRT $ lines
  print rtList
  print . sort $ rtList
  print . length $ rtList
