module Lib where

import Text.Regex (matchRegex, mkRegex)

pjsonExtractRT :: [String] -> [(Int, Maybe [String])]
pjsonExtractRT = zip [1..] . map (matchRegex (mkRegex ".*\\[AdvController\\] \\[cpt_new.json\\] \\[SUCCESS\\] ([0-9]+)ms"))
