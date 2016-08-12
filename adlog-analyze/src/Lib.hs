module Lib where

import Text.Regex (matchRegex, mkRegex)
import Data.Maybe (isJust, fromJust)

pjsonExtractRT :: [String] -> [Int]
pjsonExtractRT = map (read . head . fromJust) . filter isJust . map (matchRegex (mkRegex ".*\\[AdvController\\] \\[cpt_new\\.json\\] \\[SUCCESS\\] ([0-9]+)ms"))
