{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_my_haskell_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/bin"
libdir     = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/lib/aarch64-osx-ghc-9.4.6/my-haskell-project-0.1.0.0-HHZk9xmfGcCyqQLRImEH-my-haskell-project"
dynlibdir  = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/lib/aarch64-osx-ghc-9.4.6"
datadir    = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/share/aarch64-osx-ghc-9.4.6/my-haskell-project-0.1.0.0"
libexecdir = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/libexec/aarch64-osx-ghc-9.4.6/my-haskell-project-0.1.0.0"
sysconfdir = "/Users/vatsalgayakwad/Documents/my-haskell-project/.stack-work/install/aarch64-osx/1cf26de249cb7914fb3d395ece742b7f56f496a858b695861a7741ac73a06b43/9.4.6/etc"

getBinDir     = catchIO (getEnv "my_haskell_project_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "my_haskell_project_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "my_haskell_project_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "my_haskell_project_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_haskell_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_haskell_project_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
