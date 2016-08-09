{-# LANGUAGE NoMonomorphismRestriction #-}
module Main where

import Lib
import Diagrams.Backend.SVG.CmdLine

main :: IO ()
main = do
  f <- doodleSCX_
  mainWith . f $ take 10 [1..]
