module Lib
  ( gen
  ) where

import Data.List (intersperse)

gen :: Int -> Int -> [String] -> String
gen id groupId urls = unlines . map gen' $ zip [id..] urls
  where p = 100 `div` (length urls)
        gen' (id, url) = concat . intersperse "\t" . (++[url]) . map show $ [id, groupId, p]
