module Main where

import Lib
import System.IO (putStrLn)

atom1 = Atom { _element = "C", _point = Point { _x = 1.0, _y = 2.0}}
atom2 = Atom { _element = "O", _point = Point { _x = 3.0, _y = 4.0}}
molecule = Molecule { _atoms = [atom1, atom2] }

main :: IO ()
main = putStrLn "Hello World"
