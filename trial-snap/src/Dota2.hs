{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Dota2 where

import qualified Data.Text as T
import qualified Data.ByteString.Lazy as LBS
import qualified Data.ByteString.Lazy.Char8 as LC
import Data.Aeson (encode, decode, FromJSON(..), ToJSON(..))
import GHC.Generics (Generic(..))
import Data.Maybe (fromJust)
import System.IO (Handle)
import Control.DeepSeq (deepseq)

data Hero = Hero { ename :: T.Text
                 , sname :: T.Text
                 , link :: String
                 , full :: String
                 } deriving (Show, Generic)

instance FromJSON Hero
instance ToJSON Hero

loadHeroes :: Handle -> IO [Hero]
loadHeroes handle = do
  contents <- LBS.hGetContents handle
  deepseq contents $ return ()
  return . map (fromJust . decode) . LC.lines $ contents

pickOne :: Int -> [Hero] -> Hero
pickOne seed heroes = heroes !! (seed `mod` length heroes)

genPage :: Hero -> String
genPage = show -- TODO
