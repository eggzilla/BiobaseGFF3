
-- | Encoding of GFF3

module Biobase.GFF3.Types where

import Prelude hiding (takeWhile)
import Data.Attoparsec.ByteString.Char8 hiding (isSpace)
import qualified Data.Attoparsec.ByteString.Lazy as L
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Builder as S
import qualified Data.ByteString.Lazy.Char8 as B
import qualified Data.Vector as V
import System.Directory
import Data.Char
import Control.Monad
import Debug.Trace
import Text.Printf

-- | Datastructure for GFF3 http://gmod.org/wiki/GFF3
data GFF3 = GFF3
    { gff3Entries :: !(V.Vector GFF3Entry),
      gff3Sequence :: !B.ByteString
    }
    deriving (Eq)

-- | Datastructure for data lines of GFF3 http://gmod.org/wiki/GFF3
data GFF3Entry = GFF3Entry
    { gff3Seqid :: !B.ByteString,
      gff3Source :: !B.ByteString,
      gff3Type :: !B.ByteString,
      gff3Start :: Int,
      gff3End :: Int,
      gff3Score :: !B.ByteString,
      gff3Strand :: Char,
      gff3Phase :: B.ByteString,
      gff3Attributes :: !(V.Vector B.ByteString)
    }
    deriving (Eq)
