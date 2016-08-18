{-# LANGUAGE TemplateHaskell #-}
module Lib where

import Lens.Micro hiding (element)
import Lens.Micro.TH
import Lens.Micro.Extras

data Point = Point { _x :: Double
                   , _y :: Double
                   } deriving (Show)

data Atom = Atom { _element :: String
                 , _point :: Point
                 } deriving (Show)

data Molecule = Molecule { _atoms :: [Atom] } deriving (Show)

makeLenses ''Point

-- makeLenses ''Atom
element :: Lens' Atom String
element = lens _element (\atom e -> atom { _element = e })

point :: Lens' Atom Point
point = lens _point (\atom p -> atom {_point = p})

-- makeLenses ''Molecule
atoms :: Functor f => ([Atom] -> f [Atom]) -> Molecule -> f Molecule
atoms f m = fmap (setter m) $ f (getter m)
  where getter = _atoms
        setter m a = m { _atoms = a }
