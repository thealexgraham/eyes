module Paths_the_eyes (
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
version = Version [0,0,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/alexgraham/code/the-eyes/haskell/the-eyes/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/bin"
libdir     = "/Users/alexgraham/code/the-eyes/haskell/the-eyes/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/lib/x86_64-osx-ghc-7.10.3/the-eyes-0.0.0.1-4u3OZkVM9b40frwdrOrzfq"
datadir    = "/Users/alexgraham/code/the-eyes/haskell/the-eyes/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/share/x86_64-osx-ghc-7.10.3/the-eyes-0.0.0.1"
libexecdir = "/Users/alexgraham/code/the-eyes/haskell/the-eyes/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/libexec"
sysconfdir = "/Users/alexgraham/code/the-eyes/haskell/the-eyes/.stack-work/install/x86_64-osx/lts-6.15/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "the_eyes_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "the_eyes_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "the_eyes_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "the_eyes_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "the_eyes_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
