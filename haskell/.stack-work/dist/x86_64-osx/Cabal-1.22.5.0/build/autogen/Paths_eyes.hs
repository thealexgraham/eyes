module Paths_eyes (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/alexgraham/GoogleDrive/code/eyes/haskell/.stack-work/install/x86_64-osx/lts-6.8/7.10.3/bin"
libdir     = "/Users/alexgraham/GoogleDrive/code/eyes/haskell/.stack-work/install/x86_64-osx/lts-6.8/7.10.3/lib/x86_64-osx-ghc-7.10.3/eyes-0.1.0.0-IoowMOLq6oaJegID2DNDYP"
datadir    = "/Users/alexgraham/GoogleDrive/code/eyes/haskell/.stack-work/install/x86_64-osx/lts-6.8/7.10.3/share/x86_64-osx-ghc-7.10.3/eyes-0.1.0.0"
libexecdir = "/Users/alexgraham/GoogleDrive/code/eyes/haskell/.stack-work/install/x86_64-osx/lts-6.8/7.10.3/libexec"
sysconfdir = "/Users/alexgraham/GoogleDrive/code/eyes/haskell/.stack-work/install/x86_64-osx/lts-6.8/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "eyes_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "eyes_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "eyes_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "eyes_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "eyes_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
