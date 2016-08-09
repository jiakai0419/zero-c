{-# LANGUAGE NoMonomorphismRestriction #-}
module Main where

import Lib
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import Data.Monoid (mconcat)

doodle :: Diagram B
doodle = mconcat . zipWith rotateBy angles $ repeat (square 1)
  where angles = map (/360.0) [1.5,3.0..360.0]

main :: IO ()
main = mainWith doodle
