module Main where

import Lib
import System.IO (putStrLn)
import Lens.Micro hiding (element)
import Lens.Micro.Extras

p1 = Point { _x = 1.0, _y = 2.0}
p2 = Point { _x = 3.0, _y = 4.0}

atom1 = Atom { _element = "C", _point = p1}
atom2 = Atom { _element = "O", _point = p2}

molecule = Molecule { _atoms = [atom1, atom2] }

main :: IO ()
main = do
  print . toListOf (atoms . traverse . point. y) $ molecule
  print . over (atoms . traverse . point. y) (*2) $ molecule
