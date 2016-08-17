{-# LANGUAGE TemplateHaskell #-}
module Lib where

import Lens.Micro hiding (element)
import Lens.Micro.TH
import Lens.Micro.Extras

data Atom = Atom { _element :: String
                 , _point :: Point
                 } deriving (Show)

data Point = Point { _x :: Double
                   , _y :: Double
                   } deriving (Show)

data Molecule = Molecule { _atoms :: [Atom] } deriving (Show)

makeLenses ''Atom
makeLenses ''Point
makeLenses ''Molecule

-- shiftAtomX :: Atom -> Atom
-- shiftAtomX (Atom e (Point x y)) = Atom e (Point (x+1) y)

shiftAtomX :: Atom -> Atom
shiftAtomX = over (point . x) (+1)

shiftMoleculeX :: Molecule -> Molecule
shiftMoleculeX = over (atoms . traverse . point . x) (+1)
