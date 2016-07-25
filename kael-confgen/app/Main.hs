module Main where

import Lib
import System.IO (stdin, hGetContents)
import System.Environment (getArgs)

main :: IO ()
main = do
  [id, groupId] <- map read <$> getArgs
  urls <- lines <$> hGetContents stdin
  putStr $ "# group_" ++ show groupId ++ "   pc & m site" ++ "\n"
  putStr $ gen id groupId urls
