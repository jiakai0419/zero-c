{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server
import           Dota2
import           System.IO (openFile, hClose, IOMode(..))
import           Control.Monad.Trans (liftIO)
import qualified Data.ByteString.Char8 as C
import           System.Random (random, newStdGen)

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "Hello Kai") <|>
    route [ ("static", serveDirectory ".")
          -- , ("echo/:echoparam", echoHandler)
          , ("hero", heroHandler)
          ]

-- echoHandler :: Snap ()
-- echoHandler = do
--     param <- getParam "echoparam"
--     maybe (writeBS "must specify echo/param in URL") writeBS param

heroHandler :: Snap ()
heroHandler = do
  handle <- liftIO $ openFile "dota2/heroes.data" ReadMode
  heroes <- liftIO $ loadHeroes handle
  liftIO $ hClose handle
  seed <- liftIO $ (fst . random) <$> newStdGen
  writeBS . C.pack . genPage . pickOne seed $ heroes
