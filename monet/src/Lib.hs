module Lib
  ( doodleSCX_
  ) where

import Data.Colour.Palette.ColorSet (Kolor, rybColor)
import Diagrams.Prelude
import Data.Monoid (mconcat)
import System.Random (randoms, newStdGen)
import Diagrams.Backend.SVG.CmdLine

cut :: Int -> [a] -> [[a]]
cut n [] = []
cut n xs = let (a, b) = splitAt n xs in [a] ++ cut n b

paletteIR :: Int -> IO [[Kolor]]
paletteIR n = cut n . map rybColor . randoms <$> newStdGen

doodleSC :: Double -> [Kolor] -> Diagram B
doodleSC r colors = mconcat . zipWith lc colors . zipWith rotateBy angles . repeat $ square r
  where angles = map (/360.0) [1.5,3.0..360.0]

doodleSCX :: [Double] -> [[Kolor]] -> Diagram B
doodleSCX rs colorss = mconcat $ zipWith doodleSC rs colorss

doodleSCX_ :: IO ([Double] -> Diagram B)
doodleSCX_ = do
  colorss <- paletteIR 10000
  return $ flip doodleSCX colorss
